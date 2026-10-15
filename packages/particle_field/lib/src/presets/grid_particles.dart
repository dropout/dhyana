import 'dart:math';

import '../behaviors/particle_behavior.dart';
import '../core/particle_buffers.dart';
import '../core/particle_system.dart';

/// Grid of static particles whose z position ripples like an ocean swell and
/// whose opacity is driven by a pulse sweeping from bottom-left to top-right.
///
/// The grid is centred on the origin and spans [width] x [height]. Particles
/// never die; the system holds exactly `columns * rows` particles.
class GridParticles {
  GridParticles({
    required this.width,
    required this.height,
    this.columns = 40,
    this.rows = 70,
    this.rotation = 0,
    this.color = 0xFFFFFFFF,
    this.waveAmplitude = 60,
    this.waveSpeed = 0.6,
    this.waveFrequency = 1.5,
    this.pulsePeriod = 4,
    this.pulseWidth = 0.18,
    this.baseOpacity = 0.12,
    this.baseSize = 1,
    this.pulseSizeBoost = 0.8,
  }) : system = ParticleSystem(
         maxParticles: columns * rows,
         customChannels: 1,
       ) {
    system.behaviors.add(
      GridWaveBehavior(
        amplitude: waveAmplitude,
        speed: waveSpeed,
        frequency: waveFrequency,
        pulsePeriod: pulsePeriod,
        pulseWidth: pulseWidth,
        baseOpacity: baseOpacity,
        baseSize: baseSize,
        pulseSizeBoost: pulseSizeBoost,
        rgb: color & 0x00FFFFFF,
      ),
    );
    _populate();
  }

  final ParticleSystem system;
  final double width, height;
  final int columns, rows;

  /// Grid rotation around the origin in radians; the pulse stays screen-aligned.
  final double rotation;

  /// Particle colour; the alpha byte is overwritten by the pulse.
  final int color;

  /// Peak z displacement in world units.
  final double waveAmplitude;

  /// Wave travel speed in noise cycles per second.
  final double waveSpeed;

  /// Noise cycles across 1000 world units.
  final double waveFrequency;

  /// Seconds between pulse launches.
  final double pulsePeriod;

  /// Pulse half-width as a fraction of the diagonal sweep (0..1).
  final double pulseWidth;

  /// Opacity outside the pulse.
  final double baseOpacity;

  final double baseSize;

  /// Extra size multiplier at the pulse peak.
  final double pulseSizeBoost;

  void _populate() {
    final b = system.buffers;
    final cosR = cos(rotation), sinR = sin(rotation);
    // Bounding box of the rotated grid, so the pulse still spans 0..1.
    final extentX = cosR.abs() * width + sinR.abs() * height;
    final extentY = sinR.abs() * width + cosR.abs() * height;
    for (var r = 0; r < rows; r++) {
      for (var c = 0; c < columns; c++) {
        final u = columns == 1 ? 0.5 : c / (columns - 1);
        final v = rows == 1 ? 0.5 : r / (rows - 1);
        final gx = (u - 0.5) * width;
        final gy = (v - 0.5) * height;
        final x = gx * cosR - gy * sinR;
        final y = gx * sinR + gy * cosR;
        final i = system.spawn(
          x: x,
          y: y,
          life: double.infinity,
          size: baseSize,
          color: color,
        );
        // Diagonal position: 0 at bottom-left, 1 at top-right (+y is down).
        b.custom[0][i] = (x / extentX - y / extentY + 1) / 2;
      }
    }
  }
}

/// Drives z with cheap layered-sine noise and alpha/size with a diagonal pulse.
///
/// Expects `custom[0]` to hold each particle's diagonal position in `[0, 1]`.
class GridWaveBehavior extends ParticleBehavior {
  const GridWaveBehavior({
    required this.amplitude,
    required this.speed,
    required this.frequency,
    required this.pulsePeriod,
    required this.pulseWidth,
    required this.baseOpacity,
    required this.baseSize,
    required this.pulseSizeBoost,
    required this.rgb,
  });

  final double amplitude, speed, frequency;
  final double pulsePeriod, pulseWidth, baseOpacity;
  final double baseSize, pulseSizeBoost;
  final int rgb;

  @override
  void update(ParticleBuffers b, int count, double dt, double time) {
    // Front travels from just before the first corner to just past the far one.
    final span = 1 + 2 * pulseWidth;
    final front = (time % pulsePeriod) / pulsePeriod * span - pulseWidth;
    final phase = time * speed * 2 * pi;
    final k = frequency * 2 * pi / 1000;
    final diag = b.custom[0];

    for (var i = 0; i < count; i++) {
      final x = b.px[i] * k;
      final y = b.py[i] * k;
      // Three non-aligned sines approximate smooth noise cheaply.
      final n =
          sin(x + phase) * 0.5 +
          sin(y * 1.3 - phase * 0.8 + x * 0.4) * 0.3 +
          sin((x + y) * 0.7 + phase * 1.7) * 0.2;
      b.pz[i] = n * amplitude;

      final d = (diag[i] - front) / pulseWidth;
      final pulse = exp(-d * d);
      final alpha = baseOpacity + (1 - baseOpacity) * pulse;
      b.color[i] = ((alpha * 255).round() << 24) | rgb;
      b.size[i] = baseSize * (1 + pulseSizeBoost * pulse);
    }
  }
}
