import '../core/particle_buffers.dart';

const int allKinds = 0xFFFFFFFF;

/// Applies an acceleration to a whole range of particles per call.
abstract class ForceField {
  const ForceField({this.kindMask = allKinds});

  /// Bit `1 << kind` selects which particle kinds are affected.
  final int kindMask;

  bool affects(int kind) => (kindMask >> kind) & 1 == 1;

  void apply(ParticleBuffers b, int count, double dt, double time);
}
