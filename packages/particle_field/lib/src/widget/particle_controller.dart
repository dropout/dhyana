import 'package:flutter/foundation.dart';
import 'package:flutter/scheduler.dart';

import '../core/particle_system.dart';
import '../emitters/particle_template.dart';

/// Per-frame hook; [dt] is in seconds.
typedef ParticleFrameCallback = void Function(ParticleSystem system, double dt);

/// Drives a [ParticleSystem] from a [Ticker] and notifies painters each frame.
class ParticleController extends ChangeNotifier {
  ParticleController({
    required TickerProvider vsync,
    required this.system,
    this.onFrame,
    bool autoStart = true,
  }) {
    _ticker = vsync.createTicker(_tick);
    if (autoStart) start();
  }

  final ParticleSystem system;

  /// Runs before each simulation step, for custom per-frame logic.
  ParticleFrameCallback? onFrame;

  late final Ticker _ticker;
  Duration? _last;
  bool _hadParticles = false;

  bool get isActive => _ticker.isActive;

  void _tick(Duration elapsed) {
    // The first frame after a start has no previous timestamp.
    final last = _last;
    final dt = last == null
        ? 0.0
        : (elapsed - last).inMicroseconds / Duration.microsecondsPerSecond;
    _last = elapsed;
    onFrame?.call(system, dt);
    system.step(dt);

    final has = system.count > 0;
    // One extra notification clears the last particles from the screen.
    if (has || _hadParticles) notifyListeners();
    _hadParticles = has;
  }

  void start() {
    if (_ticker.isActive) return;
    _last = null;
    _ticker.start();
  }

  void stop() => _ticker.stop();

  /// Spawns [count] particles from [template] at ([x], [y], [z]) in particle space.
  void emitAt(
    ParticleTemplate template,
    double x,
    double y, {
    double z = 0,
    int count = 1,
  }) {
    for (var i = 0; i < count; i++) {
      if (template.spawnAt(system, x, y, z) < 0) break;
    }
    notifyListeners();
  }

  void clear() {
    system.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
