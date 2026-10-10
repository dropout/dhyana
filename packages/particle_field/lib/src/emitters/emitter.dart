import 'dart:math';

import '../core/particle_system.dart';

/// Spawns particles into a [ParticleSystem] every step.
abstract class Emitter {
  /// Spawns particles into [system] for the elapsed [dt] seconds.
  void update(ParticleSystem system, double dt);
}

/// Mutable 3D output value, reused to avoid allocations.
class Vec3 {
  double x = 0, y = 0, z = 0;
}

/// Region new particles are spawned in, relative to the emitter origin.
abstract class EmitterShape {
  const EmitterShape();

  /// Writes a random offset from the emitter origin into [out].
  void sample(Random random, Vec3 out);
}

/// Spawns at the origin.
class PointShape extends EmitterShape {
  const PointShape();
  @override
  void sample(Random random, Vec3 out) => out.x = out.y = out.z = 0;
}

/// Spawns inside a circle (z = 0), or on its edge when `edgeOnly` is set.
class CircleShape extends EmitterShape {
  const CircleShape(this.radius, {this.edgeOnly = false});
  final double radius;
  final bool edgeOnly;

  @override
  void sample(Random random, Vec3 out) {
    final a = random.nextDouble() * 2 * pi;
    final r = edgeOnly ? radius : radius * sqrt(random.nextDouble());
    out.x = cos(a) * r;
    out.y = sin(a) * r;
    out.z = 0;
  }
}

/// Spawns inside a sphere, or on its surface when `surfaceOnly` is set.
class SphereShape extends EmitterShape {
  const SphereShape(this.radius, {this.surfaceOnly = false});
  final double radius;
  final bool surfaceOnly;

  @override
  void sample(Random random, Vec3 out) {
    // Uniform direction via z in [-1, 1] and a random azimuth.
    final z = random.nextDouble() * 2 - 1;
    final a = random.nextDouble() * 2 * pi;
    final s = sqrt(1 - z * z);
    final r = surfaceOnly ? radius : radius * pow(random.nextDouble(), 1 / 3);
    out.x = cos(a) * s * r;
    out.y = sin(a) * s * r;
    out.z = z * r;
  }
}

/// Spawns inside a rectangle centred on the origin (z = 0).
class RectShape extends EmitterShape {
  const RectShape(this.width, this.height);
  final double width, height;

  @override
  void sample(Random random, Vec3 out) {
    out.x = (random.nextDouble() - 0.5) * width;
    out.y = (random.nextDouble() - 0.5) * height;
    out.z = 0;
  }
}

/// Spawns inside a box centred on the origin.
class BoxShape extends EmitterShape {
  const BoxShape(this.width, this.height, this.depth);
  final double width, height, depth;

  @override
  void sample(Random random, Vec3 out) {
    out.x = (random.nextDouble() - 0.5) * width;
    out.y = (random.nextDouble() - 0.5) * height;
    out.z = (random.nextDouble() - 0.5) * depth;
  }
}

/// Spawns along a line segment.
class LineShape extends EmitterShape {
  const LineShape(
    this.x1,
    this.y1,
    this.x2,
    this.y2, {
    this.z1 = 0,
    this.z2 = 0,
  });
  final double x1, y1, x2, y2, z1, z2;

  @override
  void sample(Random random, Vec3 out) {
    final t = random.nextDouble();
    out.x = x1 + (x2 - x1) * t;
    out.y = y1 + (y2 - y1) * t;
    out.z = z1 + (z2 - z1) * t;
  }
}
