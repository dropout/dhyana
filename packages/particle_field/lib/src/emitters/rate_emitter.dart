import '../core/particle_system.dart';
import 'emitter.dart';
import 'particle_template.dart';

/// Continuous emission at [rate] particles per second.
class RateEmitter extends Emitter {
  RateEmitter({
    required this.template,
    required this.rate,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.enabled = true,
  });

  final ParticleTemplate template;
  double rate;
  double x, y, z;
  bool enabled;
  double _carry = 0;

  @override
  void update(ParticleSystem system, double dt) {
    if (!enabled) return;
    // Fractional carry keeps low rates accurate.
    _carry += rate * dt;
    final n = _carry.floor();
    _carry -= n;
    for (var i = 0; i < n; i++) {
      if (template.spawnAt(system, x, y, z) < 0) break;
    }
  }
}

/// Emits [count] particles every [interval] seconds, [repeat] times
/// (null = forever). Use [fire] for manual bursts.
class BurstEmitter extends Emitter {
  BurstEmitter({
    required this.template,
    required this.count,
    this.interval = 1,
    this.repeat = 1,
    this.x = 0,
    this.y = 0,
    this.z = 0,
    this.enabled = true,
  });

  final ParticleTemplate template;
  final int count;
  final double interval;
  int? repeat;
  double x, y, z;
  bool enabled;
  double _timer = 0;

  void fire(ParticleSystem system, [double? atX, double? atY, double? atZ]) {
    for (var i = 0; i < count; i++) {
      if (template.spawnAt(system, atX ?? x, atY ?? y, atZ ?? z) < 0) break;
    }
  }

  @override
  void update(ParticleSystem system, double dt) {
    if (!enabled || (repeat != null && repeat! <= 0)) return;
    if (_timer <= 0) {
      fire(system);
      _timer = interval;
      if (repeat != null) repeat = repeat! - 1;
    }
    _timer -= dt;
  }
}
