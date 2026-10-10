import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../core/particle_buffers.dart';
import 'atlas_renderer.dart';
import 'particle_camera.dart';
import 'particle_renderer.dart';

/// CPU 3D renderer: projects particles through a [ParticleCamera] and draws
/// them as camera-facing sprites with `drawRawAtlas`.
///
/// Particles are depth-sorted back to front with a counting sort so alpha
/// blending looks right; disable [sort] for additive blending to save time.
/// `size` scales with perspective, so near particles look bigger.
class AtlasRenderer3D extends ParticleRenderer {
  AtlasRenderer3D({
    required this.image,
    required this.camera,
    List<Rect>? frames,
    this.spriteSize = 16,
    this.frameSelector,
    this.rotate = true,
    this.sort = true,
    this.colorBlendMode = BlendMode.modulate,
    this.blendMode = BlendMode.srcOver,
    this.filterQuality = FilterQuality.low,
  }) : frames =
           frames ??
           [
             Rect.fromLTWH(
               0,
               0,
               image.width.toDouble(),
               image.height.toDouble(),
             ),
           ],
       assert(frames == null || frames.isNotEmpty);

  final Image image;
  final ParticleCamera camera;
  final List<Rect> frames;

  /// Rendered size in logical px at particle size 1 and a screen scale of 1.
  final double spriteSize;
  final FrameSelector? frameSelector;
  final bool rotate;

  /// Draw far particles first. Not needed for order-independent blending.
  final bool sort;
  final BlendMode colorBlendMode;
  final BlendMode blendMode;
  final FilterQuality filterQuality;

  static const int _buckets = 1024;

  late final Paint _paint = Paint()
    ..blendMode = blendMode
    ..filterQuality = filterQuality;
  final ProjectedPoint _p = ProjectedPoint();

  Float32List _transforms = Float32List(0);
  Float32List _rects = Float32List(0);
  Int32List _colors = Int32List(0);
  Float32List _sx = Float32List(0);
  Float32List _sy = Float32List(0);
  Float32List _scale = Float32List(0);
  Float32List _depth = Float32List(0);
  Int32List _visible = Int32List(0);
  Int32List _order = Int32List(0);
  final Int32List _counts = Int32List(_buckets + 1);

  @override
  Listenable? get repaint => camera;

  @override
  void paint(Canvas canvas, Size size, ParticleBuffers b) {
    final n = fill(b, size);
    if (n == 0) return;
    canvas.drawRawAtlas(
      image,
      Float32List.sublistView(_transforms, 0, n * 4),
      Float32List.sublistView(_rects, 0, n * 4),
      Int32List.sublistView(_colors, 0, n),
      colorBlendMode,
      null,
      _paint,
    );
  }

  void _ensure(int capacity) {
    if (_depth.length >= capacity) return;
    _transforms = Float32List(capacity * 4);
    _rects = Float32List(capacity * 4);
    _colors = Int32List(capacity);
    _sx = Float32List(capacity);
    _sy = Float32List(capacity);
    _scale = Float32List(capacity);
    _depth = Float32List(capacity);
    _visible = Int32List(capacity);
    _order = Int32List(capacity);
  }

  /// Projects, culls and sorts; returns the number of drawable particles.
  @visibleForTesting
  int fill(ParticleBuffers b, Size size) {
    final n = b.count;
    if (n == 0) return 0;
    _ensure(b.capacity);
    camera.beginFrame(size);

    var m = 0;
    var minD = double.infinity, maxD = -double.infinity;
    for (var i = 0; i < n; i++) {
      if (!camera.project(b.px[i], b.py[i], b.pz[i], _p)) continue;
      _sx[i] = _p.x;
      _sy[i] = _p.y;
      _scale[i] = _p.scale;
      _depth[i] = _p.depth;
      _visible[m++] = i;
      if (_p.depth < minD) minD = _p.depth;
      if (_p.depth > maxD) maxD = _p.depth;
    }
    if (m == 0) return 0;

    if (sort && m > 1 && maxD > minD) {
      _counts.fillRange(0, _buckets + 1, 0);
      final k = (_buckets - 1) / (maxD - minD);
      // Reversed so the farthest particles come first.
      for (var j = 0; j < m; j++) {
        _counts[_buckets - 1 - ((_depth[_visible[j]] - minD) * k).toInt()]++;
      }
      var sum = 0;
      for (var c = 0; c < _buckets; c++) {
        final v = _counts[c];
        _counts[c] = sum;
        sum += v;
      }
      for (var j = 0; j < m; j++) {
        final i = _visible[j];
        final bucket = _buckets - 1 - ((_depth[i] - minD) * k).toInt();
        _order[_counts[bucket]++] = i;
      }
    } else {
      for (var j = 0; j < m; j++) {
        _order[j] = _visible[j];
      }
    }

    final select = frameSelector;
    final frameCount = frames.length;
    for (var j = 0; j < m; j++) {
      final i = _order[j];
      final frame = frames[select == null ? 0 : select(b, i) % frameCount];
      final scale = b.size[i] * spriteSize * _scale[i] / frame.width;
      final scos = rotate ? cos(b.rotation[i]) * scale : scale;
      final ssin = rotate ? sin(b.rotation[i]) * scale : 0.0;
      final cx = frame.width / 2, cy = frame.height / 2;
      final o = j * 4;
      _transforms[o] = scos;
      _transforms[o + 1] = ssin;
      _transforms[o + 2] = _sx[i] - (scos * cx - ssin * cy);
      _transforms[o + 3] = _sy[i] - (ssin * cx + scos * cy);
      _rects[o] = frame.left;
      _rects[o + 1] = frame.top;
      _rects[o + 2] = frame.right;
      _rects[o + 3] = frame.bottom;
      _colors[j] = b.color[i];
    }
    return m;
  }

  /// Source indices of the drawn particles in draw order (first [n] entries).
  @visibleForTesting
  Int32List get drawOrder => _order;
}
