import 'dart:typed_data';
import 'dart:ui';

import '../core/particle_buffers.dart';
import 'particle_renderer.dart';

/// Cheapest renderer: one `drawRawPoints` call with a single colour and size.
/// Per-particle colour and size are ignored; use [AtlasRenderer] for those.
class PointsRenderer extends ParticleRenderer {
  PointsRenderer({
    this.color = const Color(0xFFFFFFFF),
    this.pointSize = 3,
    this.round = true,
    this.blendMode = BlendMode.srcOver,
  });

  final Color color;
  final double pointSize;
  final bool round;
  final BlendMode blendMode;

  late final Paint _paint = Paint()
    ..color = color
    ..strokeWidth = pointSize
    ..strokeCap = round ? StrokeCap.round : StrokeCap.square
    ..blendMode = blendMode;

  Float32List? _points;

  @override
  void paint(Canvas canvas, Size size, ParticleBuffers b) {
    final n = b.count;
    if (n == 0) return;
    var pts = _points;
    if (pts == null || pts.length < n * 2) {
      pts = _points = Float32List(b.capacity * 2);
    }
    for (var i = 0; i < n; i++) {
      pts[i * 2] = b.px[i];
      pts[i * 2 + 1] = b.py[i];
    }
    canvas.drawRawPoints(
      PointMode.points,
      Float32List.sublistView(pts, 0, n * 2),
      _paint,
    );
  }
}
