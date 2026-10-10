import 'dart:math';
import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../core/particle_buffers.dart';
import 'particle_renderer.dart';

/// Picks the sprite frame for particle [i]. Defaults to frame 0.
typedef FrameSelector = int Function(ParticleBuffers b, int i);

/// Batched sprite renderer built on `drawRawAtlas`, with no per-frame
/// allocation beyond cheap list views.
///
/// A particle's `size` is a scale factor on [spriteSize] (logical px), its
/// `color` tints the sprite via [colorBlendMode], and `rotation` is applied
/// when [rotate] is true.
class AtlasRenderer extends ParticleRenderer {
  AtlasRenderer({
    required this.image,
    List<Rect>? frames,
    this.spriteSize = 16,
    this.frameSelector,
    this.rotate = true,
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

  /// Source rects inside [image].
  final List<Rect> frames;

  /// Rendered size in logical px at particle size 1.
  final double spriteSize;
  final FrameSelector? frameSelector;
  final bool rotate;

  /// How particle colour combines with the sprite.
  final BlendMode colorBlendMode;

  /// How the sprites composite onto the canvas (use [BlendMode.plus] for glow).
  final BlendMode blendMode;
  final FilterQuality filterQuality;

  late final Paint _paint = Paint()
    ..blendMode = blendMode
    ..filterQuality = filterQuality;

  Float32List _transforms = Float32List(0);
  Float32List _rects = Float32List(0);

  @override
  void paint(Canvas canvas, Size size, ParticleBuffers b) {
    final n = b.count;
    if (n == 0) return;
    _ensureCapacity(b.capacity);
    fill(b, n);
    canvas.drawRawAtlas(
      image,
      Float32List.sublistView(_transforms, 0, n * 4),
      Float32List.sublistView(_rects, 0, n * 4),
      b.color.buffer.asInt32List(b.color.offsetInBytes, n),
      colorBlendMode,
      null,
      _paint,
    );
  }

  void _ensureCapacity(int capacity) {
    if (_transforms.length >= capacity * 4) return;
    _transforms = Float32List(capacity * 4);
    _rects = Float32List(capacity * 4);
  }

  /// Fills the transform and rect arrays for the first [n] particles.
  @visibleForTesting
  ({Float32List transforms, Float32List rects}) fill(ParticleBuffers b, int n) {
    _ensureCapacity(b.capacity);
    final select = frameSelector;
    final frameCount = frames.length;
    for (var i = 0; i < n; i++) {
      final frame = frames[select == null ? 0 : select(b, i) % frameCount];
      final scale = b.size[i] * spriteSize / frame.width;
      final scos = rotate ? cos(b.rotation[i]) * scale : scale;
      final ssin = rotate ? sin(b.rotation[i]) * scale : 0.0;
      final cx = frame.width / 2, cy = frame.height / 2;
      final o = i * 4;
      _transforms[o] = scos;
      _transforms[o + 1] = ssin;
      _transforms[o + 2] = b.px[i] - (scos * cx - ssin * cy);
      _transforms[o + 3] = b.py[i] - (ssin * cx + scos * cy);
      _rects[o] = frame.left;
      _rects[o + 1] = frame.top;
      _rects[o + 2] = frame.right;
      _rects[o + 3] = frame.bottom;
    }
    return (transforms: _transforms, rects: _rects);
  }
}
