import 'dart:math';

import '../core/particle_system.dart';
import 'emitter.dart';

/// Returns a packed 0xAARRGGBB colour for a new particle.
typedef ColorPicker = int Function(Random random);

/// Randomised description of the particles an emitter produces.
class ParticleTemplate {
  const ParticleTemplate({
    this.shape = const PointShape(),
    this.direction = -pi / 2,
    this.spread = 2 * pi,
    this.radial = false,
    this.minSpeed = 20,
    this.maxSpeed = 60,
    this.minLife = 1,
    this.maxLife = 2,
    this.minSize = 1,
    this.maxSize = 1,
    this.color = 0xFFFFFFFF,
    this.colorPicker,
    this.kind = 0,
    this.onSpawn,
    this.axis,
  });

  final EmitterShape shape;

  /// 3D cone axis `(x, y, z)`; when set, particles are emitted in a cone
  /// around it instead of in the xy plane.
  final (double, double, double)? axis;

  /// Centre of the planar emission cone in radians (0 = +x, -pi/2 = up).
  ///
  /// Ignored when [axis] is set.
  final double direction;

  /// Full width of the emission cone in radians. In 3D (with [axis]) this is
  /// the cone angle, where `2 * pi` covers the whole sphere.
  final double spread;

  /// Emit away from the shape centre, ignoring [direction] and [spread].
  final bool radial;
  final double minSpeed, maxSpeed;
  final double minLife, maxLife;
  final double minSize, maxSize;
  final int color;
  final ColorPicker? colorPicker;
  final int kind;
  final void Function(ParticleSystem system, int index)? onSpawn;

  static final Vec3 _tmp = Vec3();

  /// Spawns one particle at ([ox], [oy], [oz]) and returns its index or -1.
  int spawnAt(ParticleSystem s, double ox, double oy, [double oz = 0]) {
    final r = s.random;
    shape.sample(r, _tmp);
    final sx = _tmp.x, sy = _tmp.y, sz = _tmp.z;
    double dx, dy, dz;
    final len = sqrt(sx * sx + sy * sy + sz * sz);
    if (radial && len > 0) {
      dx = sx / len;
      dy = sy / len;
      dz = sz / len;
    } else if (axis != null) {
      final (ax, ay, az) = axis!;
      _cone(r, ax, ay, az, spread);
      dx = _dir.x;
      dy = _dir.y;
      dz = _dir.z;
    } else {
      final angle = direction + (r.nextDouble() - 0.5) * spread;
      dx = cos(angle);
      dy = sin(angle);
      dz = 0;
    }
    final speed = _lerp(minSpeed, maxSpeed, r.nextDouble());
    final i = s.spawn(
      x: ox + sx,
      y: oy + sy,
      z: oz + sz,
      vx: dx * speed,
      vy: dy * speed,
      vz: dz * speed,
      life: _lerp(minLife, maxLife, r.nextDouble()),
      size: _lerp(minSize, maxSize, r.nextDouble()),
      rotation: r.nextDouble() * 2 * pi,
      color: colorPicker?.call(r) ?? color,
      kind: kind,
    );
    if (i >= 0) onSpawn?.call(s, i);
    return i;
  }

  static final Vec3 _dir = Vec3();

  /// Writes a uniformly distributed unit vector within a cone of full angle
  /// [spread] around the axis into [_dir].
  static void _cone(Random r, double ax, double ay, double az, double spread) {
    final l = sqrt(ax * ax + ay * ay + az * az);
    if (l == 0) {
      _dir.x = _dir.y = _dir.z = 0;
      return;
    }
    ax /= l;
    ay /= l;
    az /= l;
    final cosMax = cos(min(spread / 2, pi));
    final cosT = 1 - r.nextDouble() * (1 - cosMax);
    final sinT = sqrt(max(0.0, 1 - cosT * cosT));
    final phi = r.nextDouble() * 2 * pi;
    // Orthonormal basis (t1, t2, axis).
    final hx = ax.abs() < 0.9 ? 1.0 : 0.0, hy = ax.abs() < 0.9 ? 0.0 : 1.0;
    var t1x = hy * az, t1y = -hx * az, t1z = hx * ay - hy * ax;
    final tl = sqrt(t1x * t1x + t1y * t1y + t1z * t1z);
    t1x /= tl;
    t1y /= tl;
    t1z /= tl;
    final t2x = ay * t1z - az * t1y;
    final t2y = az * t1x - ax * t1z;
    final t2z = ax * t1y - ay * t1x;
    final c = sinT * cos(phi), d = sinT * sin(phi);
    _dir.x = t1x * c + t2x * d + ax * cosT;
    _dir.y = t1y * c + t2y * d + ay * cosT;
    _dir.z = t1z * c + t2z * d + az * cosT;
  }

  static double _lerp(double a, double b, double t) => a + (b - a) * t;
}
