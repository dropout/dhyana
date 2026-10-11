import 'dart:math';

import 'package:particle_field/particle_field.dart';

class QuestionMarkFlyThrough({required final Random random}) {
  late final ParticleSystem system;

  this {
    system = ParticleSystem(
      random: random,
      maxParticles: 64,
      emitters: [QMarkEmitter()],
      behaviors: [FadeInOut(
        fadeInEnd: 0.2, 
        fadeOutStart: 0.8, 
        startAlpha: 0.0, 
        peak: 1.0, 
        endAlpha: 0.0
      )],
      forces: [Gravity(x: 0, y: 0, z: -10)],
    );
  }
}

class QMarkEmitter extends Emitter {
  int _nextCell = 0;

  double _lastEmitTime = 0.0;

  @override
  void update(ParticleSystem system, double dt) {
    final area = 512+256.0;
    const gridSize = 10;
    final cellSize = area / gridSize;
    final cell = _nextCell++ % (gridSize * gridSize);
    final column = cell % gridSize;
    final row = cell ~/ gridSize;
    final jitter = cellSize * 0.2;

    if (_lastEmitTime + system.random.nextDouble() * 6.0 < system.time) {
      system.spawn(
        color: 0x00000000,
        // life: system.random.nextDouble() * 10, 
        life: 6.0 + system.random.nextDouble() * 2.0,
        x:
            -area / 2 +
            (column + 0.5) * cellSize +
            (system.random.nextDouble() * 2 - 1) * jitter,
        y:
            -area / 2 +
            (row + 0.5) * cellSize +
            (system.random.nextDouble() * 2 - 1) * jitter,
        z: system.random.nextDouble() * 10 + 100,
        vz: -10,
      );
      _lastEmitTime = system.time;
    
    }


  }
}
