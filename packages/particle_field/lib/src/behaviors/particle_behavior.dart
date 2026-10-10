import '../core/particle_buffers.dart';
import '../forces/force_field.dart';

/// Per-particle logic run over the whole live range once per step.
abstract class ParticleBehavior {
  const ParticleBehavior({this.kindMask = allKinds});

  final int kindMask;

  bool affects(int kind) => (kindMask >> kind) & 1 == 1;

  void update(ParticleBuffers b, int count, double dt, double time);
}

/// Escape hatch: a closure run once per particle index.
class CustomBehavior extends ParticleBehavior {
  const CustomBehavior(this.fn, {super.kindMask});
  final void Function(ParticleBuffers b, int i, double dt, double time) fn;

  @override
  void update(ParticleBuffers b, int count, double dt, double time) {
    for (var i = 0; i < count; i++) {
      if (affects(b.kind[i])) fn(b, i, dt, time);
    }
  }
}
