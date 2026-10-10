import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_gpu/gpu.dart' as gpu;
import 'package:vector_math/vector_math.dart' as vm;

import '../core/particle_buffers.dart';
import '../render/particle_camera.dart';
import '../render/particle_renderer.dart';

/// Flutter GPU renderer: draws all particles as instanced camera-facing quads
/// in one draw call and composites the result as an image.
///
/// Flutter GPU is experimental. It needs Impeller and the
/// `--enable-flutter-gpu` flag (or the platform equivalent), so create it with
/// [GpuParticleRenderer.tryCreate] and fall back to `AtlasRenderer3D`.
///
/// Particles are not depth sorted; prefer [additive] blending, or particles
/// that don't overlap much.
class GpuParticleRenderer extends ParticleRenderer {
  GpuParticleRenderer._(
    this.camera,
    this.alignment,
    this.spriteSize,
    this.additive,
    this.pixelRatio,
    gpu.ShaderLibrary library,
    this._texture,
  ) : _pipeline = gpu.gpuContext.createRenderPipeline(
        library['ParticleVertex']!,
        library['ParticleFragment']!,
        vertexLayout: _layout,
      ) {
    _frameSlot = _pipeline.vertexShader.getUniformSlot('FrameInfo');
    _spriteSlot = _pipeline.fragmentShader.getUniformSlot('sprite');
    final quad = Float32List.fromList([-1, -1, 1, -1, 1, 1, -1, 1]);
    final indices = Uint16List.fromList([0, 1, 2, 0, 2, 3]);
    _quad = gpu.gpuContext.createDeviceBuffer(
      gpu.StorageMode.hostVisible,
      quad.lengthInBytes,
    )..overwrite(ByteData.sublistView(quad));
    _indices = gpu.gpuContext.createDeviceBuffer(
      gpu.StorageMode.hostVisible,
      indices.lengthInBytes,
    )..overwrite(ByteData.sublistView(indices));
  }

  static const String _assetKey =
      'packages/particle_field/assets/particle.shaderbundle';
  static const int _floatsPerInstance = 9;

  static const gpu.VertexLayout _layout = gpu.VertexLayout(
    buffers: [
      gpu.VertexBuffer(
        strideInBytes: 8,
        attributes: [
          gpu.VertexAttribute(
            name: 'corner',
            format: gpu.VertexFormat.float32x2,
          ),
        ],
      ),
      gpu.VertexBuffer(
        strideInBytes: _floatsPerInstance * 4,
        stepMode: gpu.VertexStepMode.instance,
        attributes: [
          gpu.VertexAttribute(
            name: 'center_size',
            format: gpu.VertexFormat.float32x4,
          ),
          gpu.VertexAttribute(
            name: 'color',
            format: gpu.VertexFormat.float32x4,
            offsetInBytes: 16,
          ),
          gpu.VertexAttribute(
            name: 'rotation',
            format: gpu.VertexFormat.float32,
            offsetInBytes: 32,
          ),
        ],
      ),
    ],
  );

  /// Whether Flutter GPU can be used in the current process.
  static bool get isSupported {
    try {
      gpu.gpuContext;
      return true;
    } catch (_) {
      return false;
    }
  }

  /// Creates a renderer, or returns null when Flutter GPU is unavailable.
  ///
  /// [sprite] is drawn on every particle quad. [alignment] must match the
  /// `ParticleField.alignment` it is used with.
  static Future<GpuParticleRenderer?> tryCreate({
    required ui.Image sprite,
    required ParticleCamera camera,
    Alignment alignment = Alignment.center,
    double spriteSize = 16,
    bool additive = true,
    double? pixelRatio,
  }) async {
    try {
      if (!isSupported) return null;
      final data = await rootBundle.load(_assetKey);
      final library = await gpu.ShaderLibrary.fromBytes(data);
      if (library == null) return null;
      final texture = gpu.Texture.fromImage(gpu.gpuContext, sprite);
      return GpuParticleRenderer._(
        camera,
        alignment,
        spriteSize,
        additive,
        pixelRatio ??
            ui.PlatformDispatcher.instance.implicitView?.devicePixelRatio ??
            1,
        library,
        texture,
      );
    } catch (e, st) {
      FlutterError.reportError(
        FlutterErrorDetails(
          exception: e,
          stack: st,
          library: 'particle_field',
          context: ErrorDescription('while creating the Flutter GPU renderer'),
        ),
      );
      return null;
    }
  }

  final ParticleCamera camera;
  final Alignment alignment;

  /// Rendered size in logical px at particle size 1 and a screen scale of 1.
  final double spriteSize;

  /// Additive (glow) blending instead of premultiplied alpha.
  final bool additive;

  /// Device pixels per logical pixel for the offscreen surface.
  final double pixelRatio;

  final gpu.Texture _texture;
  final gpu.RenderPipeline _pipeline;
  late final gpu.UniformSlot _frameSlot;
  late final gpu.UniformSlot _spriteSlot;
  late final gpu.DeviceBuffer _quad;
  late final gpu.DeviceBuffer _indices;
  final gpu.HostBuffer _host = gpu.gpuContext.createHostBuffer();
  final Float32List _view = Float32List(24);
  Float32List _instances = Float32List(0);
  gpu.GpuImageSurface? _surface;

  @override
  Listenable? get repaint => camera;

  @override
  void paint(ui.Canvas canvas, ui.Size size, ParticleBuffers b) {
    final n = b.count;
    if (n == 0 || size.isEmpty) return;
    final w = (size.width * pixelRatio).ceil(),
        h = (size.height * pixelRatio).ceil();
    var surface = _surface;
    if (surface == null) {
      surface = _surface = gpu.gpuContext.createImageSurface(w, h);
    } else if (surface.width != w || surface.height != h) {
      surface.resize(w, h);
    }

    // The camera's principal point is the alignment origin, not the centre.
    final origin = alignment.alongSize(size);
    camera.writeViewData(_view, size, origin - size.center(ui.Offset.zero));

    _fillInstances(b, n);
    _host.reset();
    final frame = surface.acquireNextFrame();
    final cb = gpu.gpuContext.createCommandBuffer();
    final pass = cb.createRenderPass(
      gpu.RenderTarget.singleColor(
        gpu.ColorAttachment(
          texture: frame.colorTexture,
          clearValue: vm.Vector4.zero(),
        ),
      ),
    );
    pass.bindPipeline(_pipeline);
    pass.setColorBlendEnable(true);
    pass.setCullMode(gpu.CullMode.none);
    if (additive) {
      pass.setColorBlendEquation(
        gpu.ColorBlendEquation(
          sourceColorBlendFactor: gpu.BlendFactor.one,
          destinationColorBlendFactor: gpu.BlendFactor.one,
          sourceAlphaBlendFactor: gpu.BlendFactor.one,
          destinationAlphaBlendFactor: gpu.BlendFactor.one,
        ),
      );
    }
    pass.bindVertexBuffer(
      gpu.BufferView(_quad, offsetInBytes: 0, lengthInBytes: 32),
    );
    pass.bindVertexBuffer(
      _host.emplace(
        ByteData.sublistView(_instances, 0, n * _floatsPerInstance * 4),
      ),
      slot: 1,
    );
    pass.bindIndexBuffer(
      gpu.BufferView(_indices, offsetInBytes: 0, lengthInBytes: 12),
      gpu.IndexType.int16,
    );
    pass.bindUniform(_frameSlot, _host.emplace(ByteData.sublistView(_view)));
    pass.bindTexture(
      _spriteSlot,
      _texture,
      sampler: gpu.SamplerOptions(
        minFilter: gpu.MinMagFilter.linear,
        magFilter: gpu.MinMagFilter.linear,
      ),
    );
    pass.drawIndexed(6, instanceCount: n);
    frame.present(cb);
    cb.submit();

    final image = surface.currentImage;
    if (image == null) return;
    // Undo the canvas translate to the origin, then align the surface to it.
    canvas.drawImageRect(
      image,
      ui.Rect.fromLTWH(0, 0, w.toDouble(), h.toDouble()),
      (ui.Offset.zero & size).shift(-origin),
      ui.Paint(),
    );
  }

  void _fillInstances(ParticleBuffers b, int n) {
    final need = b.capacity * _floatsPerInstance;
    if (_instances.length < need) _instances = Float32List(need);
    final f = _instances;
    for (var i = 0; i < n; i++) {
      final o = i * _floatsPerInstance;
      final c = b.color[i];
      f[o] = b.px[i];
      f[o + 1] = b.py[i];
      f[o + 2] = b.pz[i];
      f[o + 3] = b.size[i] * spriteSize;
      f[o + 4] = ((c >> 16) & 0xFF) / 255;
      f[o + 5] = ((c >> 8) & 0xFF) / 255;
      f[o + 6] = (c & 0xFF) / 255;
      f[o + 7] = ((c >> 24) & 0xFF) / 255;
      f[o + 8] = b.rotation[i];
    }
  }

  /// Releases the offscreen surface.
  void dispose() {
    _surface = null;
  }
}
