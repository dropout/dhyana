import '../core/particle_buffers.dart';
import 'particle_behavior.dart';

double _t(ParticleBuffers b, int i) {
  final l = b.life[i];
  return l <= 0 ? 1 : (b.age[i] / l).clamp(0.0, 1.0);
}

/// Linearly changes alpha over life (0..1). Defaults fade 1 -> 0.
class FadeOut extends ParticleBehavior {
  const FadeOut({this.from = 1, this.to = 0, super.kindMask});
  final double from, to;

  @override
  void update(ParticleBuffers b, int count, double dt, double time) {
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      final a = ((from + (to - from) * _t(b, i)) * 255).round().clamp(0, 255);
      b.color[i] = (b.color[i] & 0x00FFFFFF) | (a << 24);
    }
  }
}

/// Sets size from [start] to [end] over life.
class ScaleOverLife extends ParticleBehavior {
  const ScaleOverLife({this.start = 1, this.end = 0, super.kindMask});
  final double start, end;

  @override
  void update(ParticleBuffers b, int count, double dt, double time) {
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      b.size[i] = start + (end - start) * _t(b, i);
    }
  }
}

/// Interpolates all ARGB channels (alpha included) from [begin] to [end].
class ColorOverLife extends ParticleBehavior {
  const ColorOverLife({required this.begin, required this.end, super.kindMask});
  final int begin, end;

  @override
  void update(ParticleBuffers b, int count, double dt, double time) {
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      final t = _t(b, i);
      int ch(int shift) {
        final a = (begin >> shift) & 0xFF, c = (end >> shift) & 0xFF;
        return (a + (c - a) * t).round();
      }

      b.color[i] = (ch(24) << 24) | (ch(16) << 16) | (ch(8) << 8) | ch(0);
    }
  }
}

/// Kills particles that leave the box. The z range is unbounded by default.
class BoundsKill extends ParticleBehavior {
  const BoundsKill(
    this.left,
    this.top,
    this.right,
    this.bottom, {
    this.minZ = double.negativeInfinity,
    this.maxZ = double.infinity,
    super.kindMask,
  });
  final double left, top, right, bottom, minZ, maxZ;

  @override
  void update(ParticleBuffers b, int count, double dt, double time) {
    for (var i = 0; i < count; i++) {
      if (!affects(b.kind[i])) continue;
      final x = b.px[i], y = b.py[i], z = b.pz[i];
      if (x < left ||
          x > right ||
          y < top ||
          y > bottom ||
          z < minZ ||
          z > maxZ) {
        b.age[i] = b.life[i];
      }
    }
  }
}
