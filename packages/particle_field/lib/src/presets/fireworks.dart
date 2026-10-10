import 'dart:math';

import '../behaviors/behaviors.dart';
import '../behaviors/particle_behavior.dart';
import '../core/particle_buffers.dart';
import '../core/particle_system.dart';
import '../forces/forces.dart';

/// Rocket -> burst of sparks -> fading glitter trail.
class Fireworks {
  Fireworks({
    Random? random,
    int maxParticles = 4096,
    this.gravity = 160,
    this.sparkCount = 90,
    this.trails = true,
    this.spherical = false,
    this.palette = const [
      0xFFFF5252,
      0xFFFFD740,
      0xFF69F0AE,
      0xFF40C4FF,
      0xFFE040FB,
      0xFFFFFFFF,
    ],
  }) {
    system = ParticleSystem(
      maxParticles: maxParticles,
      random: random,
      onDeath: _onDeath,
      forces: [
        Gravity(y: gravity, kindMask: rocketMask | sparkMask | trailMask),
        const Drag(coefficient: 1.6, kindMask: sparkMask),
      ],
      behaviors: [
        const FadeOut(from: 1, to: 0, kindMask: sparkMask | trailMask),
        const ScaleOverLife(
          start: 1,
          end: 0.2,
          kindMask: sparkMask | trailMask,
        ),
        if (trails) CustomBehavior(_rocketTrail, kindMask: rocketMask),
      ],
    );
  }

  static const rocket = 0, spark = 1, trail = 2;
  static const rocketMask = 1 << rocket;
  static const sparkMask = 1 << spark;
  static const trailMask = 1 << trail;

  final double gravity;
  final int sparkCount;
  final bool trails;

  /// Bursts into a 3D sphere instead of a flat ring. Render with a 3D camera.
  final bool spherical;
  final List<int> palette;
  late final ParticleSystem system;

  /// Launches a rocket from ([x], [y]) that bursts around [apexY] in particle space.
  void launch(double x, double y, {double z = 0, double? apexY, int? color}) {
    final r = system.random;
    final rise = max(60.0, y - (apexY ?? y - 300));
    // v² = 2*g*h gives an apex at the requested height under gravity.
    final vy = -sqrt(2 * gravity * rise);
    system.spawn(
      x: x,
      y: y,
      z: z,
      vx: (r.nextDouble() - 0.5) * 40,
      vy: vy,
      vz: spherical ? (r.nextDouble() - 0.5) * 40 : 0,
      life: -vy / gravity,
      size: 1.2,
      color: color ?? palette[r.nextInt(palette.length)],
      kind: rocket,
    );
  }

  void _onDeath(ParticleSystem s, int i) {
    if (s.buffers.kind[i] != rocket) return;
    final b = s.buffers;
    final r = s.random;
    final x = b.px[i], y = b.py[i], z = b.pz[i];
    final color = b.color[i];
    final base = 90 + r.nextDouble() * 80;
    for (var k = 0; k < sparkCount; k++) {
      final a = r.nextDouble() * 2 * pi;
      final v = base * (0.35 + 0.65 * sqrt(r.nextDouble()));
      // Uniform point on a sphere via z in [-1, 1]; flat ring otherwise.
      final cz = spherical ? r.nextDouble() * 2 - 1 : 0.0;
      final ring = sqrt(1 - cz * cz);
      s.spawn(
        x: x,
        y: y,
        z: z,
        vx: cos(a) * ring * v,
        vy: sin(a) * ring * v,
        vz: cz * v,
        life: 1.1 + r.nextDouble() * 0.9,
        size: 0.7 + r.nextDouble() * 0.5,
        color: color,
        kind: spark,
      );
    }
  }

  void _rocketTrail(ParticleBuffers b, int i, double dt, double time) {
    // Short-lived glitter behind the rocket, spawned past the live range.
    system.spawn(
      x: b.px[i],
      y: b.py[i],
      z: b.pz[i],
      vx: (system.random.nextDouble() - 0.5) * 20,
      vy: 20 + system.random.nextDouble() * 20,
      vz: spherical ? (system.random.nextDouble() - 0.5) * 20 : 0,
      life: 0.35,
      size: 0.6,
      color: 0xFFFFE0B2,
      kind: trail,
    );
  }
}
