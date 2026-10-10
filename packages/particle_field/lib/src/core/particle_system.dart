import 'dart:math';

import '../behaviors/particle_behavior.dart';
import '../emitters/emitter.dart';
import '../forces/force_field.dart';
import 'particle_buffers.dart';

/// Called for a particle about to be removed; [index] is still valid.
typedef ParticleDeathCallback = void Function(ParticleSystem system, int index);

/// Simulation core. Units are logical pixels and seconds, +y is down and, in
/// 3D, +z points away from a default camera (right-handed).
///
/// Each [step] runs emitters, forces, behaviours, integrates position and
/// age, then removes dead particles (calling [onDeath] for each).
class ParticleSystem {
  ParticleSystem({
    int maxParticles = 2048,
    int customChannels = 0,
    Random? random,
    this.maxDt = 1 / 20,
    List<Emitter>? emitters,
    List<ForceField>? forces,
    List<ParticleBehavior>? behaviors,
    this.onDeath,
  }) : buffers = ParticleBuffers(maxParticles, customChannels: customChannels),
       random = random ?? Random(),
       emitters = emitters ?? [],
       forces = forces ?? [],
       behaviors = behaviors ?? [];

  final ParticleBuffers buffers;
  final Random random;
  final List<Emitter> emitters;
  final List<ForceField> forces;
  final List<ParticleBehavior> behaviors;

  /// Called just before a particle is removed; may call [spawn].
  ParticleDeathCallback? onDeath;

  /// Upper bound for a single step so lag spikes don't explode the simulation.
  final double maxDt;

  /// Simulated seconds.
  double time = 0;

  int get count => buffers.count;

  int spawn({
    double x = 0,
    double y = 0,
    double z = 0,
    double vx = 0,
    double vy = 0,
    double vz = 0,
    double life = 1,
    double size = 1,
    double rotation = 0,
    int color = 0xFFFFFFFF,
    int kind = 0,
  }) => buffers.add(
    x: x,
    y: y,
    z: z,
    vx: vx,
    vy: vy,
    vz: vz,
    life: life,
    size: size,
    rotation: rotation,
    color: color,
    kind: kind,
  );

  void step(double dt) {
    if (dt <= 0) return;
    dt = min(dt, maxDt);
    time += dt;

    for (final e in emitters) {
      e.update(this, dt);
    }
    final b = buffers;
    for (final f in forces) {
      f.apply(b, b.count, dt, time);
    }
    for (final bh in behaviors) {
      bh.update(b, b.count, dt, time);
    }

    final n = b.count;
    for (var i = 0; i < n; i++) {
      b.px[i] += b.vx[i] * dt;
      b.py[i] += b.vy[i] * dt;
      b.pz[i] += b.vz[i] * dt;
      b.age[i] += dt;
    }

    // Reverse order keeps swap-remove safe and lets onDeath append children.
    for (var i = n - 1; i >= 0; i--) {
      if (b.age[i] >= b.life[i]) {
        onDeath?.call(this, i);
        b.removeAt(i);
      }
    }
  }

  void clear() => buffers.clear();
}
