import 'dart:ui';

import 'package:flutter/foundation.dart';

import '../core/particle_buffers.dart';

/// Draws live particles. The canvas origin is the particle-space origin.
abstract class ParticleRenderer {
  const ParticleRenderer();

  /// Notifies when the renderer needs a repaint without the system changing,
  /// e.g. when a camera moves.
  Listenable? get repaint => null;

  void paint(Canvas canvas, Size size, ParticleBuffers buffers);
}

/// Paints all live particles in one call.
typedef ParticlePaintCallback = void Function(
  Canvas canvas,
  Size size,
  ParticleBuffers buffers,
);

/// Full custom painting with direct access to the buffers.
class CallbackRenderer extends ParticleRenderer {
  const CallbackRenderer(this.callback);
  final ParticlePaintCallback callback;

  @override
  void paint(Canvas canvas, Size size, ParticleBuffers buffers) =>
      callback(canvas, size, buffers);
}

/// Paints the particle at index [i].
typedef ParticleItemPainter = void Function(
  Canvas canvas,
  ParticleBuffers b,
  int i,
);

/// Convenience for simple per-particle painting; slower than batch renderers.
class PerParticleRenderer extends ParticleRenderer {
  const PerParticleRenderer(this.paintParticle);
  final ParticleItemPainter paintParticle;

  @override
  void paint(Canvas canvas, Size size, ParticleBuffers buffers) {
    for (var i = 0; i < buffers.count; i++) {
      paintParticle(canvas, buffers, i);
    }
  }
}
