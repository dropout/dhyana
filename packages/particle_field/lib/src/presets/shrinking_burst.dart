import 'dart:math';
import 'dart:ui';

import '../behaviors/behaviors.dart';
import '../core/particle_buffers.dart';
import '../core/particle_system.dart';
import '../emitters/emitter.dart';
import '../emitters/particle_template.dart';
import '../forces/forces.dart';
import '../render/particle_renderer.dart';

/// Port of the original effect: a few dots that drift out, slow down and
/// shrink over one second. Per-frame constants were converted to per-second
/// (drag 0.97/frame @60fps, 60 frames of life).
class ShrinkingBurst {
  ShrinkingBurst({Random? random, int? color, List<int>? palette, this.radius = 6, this.maxParticles = 64})
    : palette = _resolvePalette(color, palette),
      color = color ?? (palette == null ? defaultPalette.first : palette.first),
      system = ParticleSystem(
        maxParticles: maxParticles,
        random: random,
        forces: [
          const Drag(coefficient: 1.5), 
          const Gravity(y: 32),
        ],
        behaviors: [
          FadeOut()
        ],
      );

  final ParticleSystem system;
  final int color;
  final List<int> palette;
  final double radius;
  final int maxParticles;

  static const defaultPalette = [0xFFFF5252, 0xFFFFD740, 0xFF69F0AE, 0xFF40C4FF, 0xFFE040FB, 0xFFFFFFFF];

  static List<int> _resolvePalette(int? color, List<int>? palette) {
    if (color != null) return [color];
    if (palette != null) {
      if (palette.isEmpty) {
        throw ArgumentError.value(palette, 'palette', 'Must not be empty');
      }
      return palette;
    }
    return defaultPalette;
  }

  late final ParticleTemplate template = ParticleTemplate(
    shape: const PointShape(),
    spread: 2 * pi,
    minSpeed: 40,
    maxSpeed: 80,
    minLife: 1,
    maxLife: 3,        
    colorPicker: (random) => palette[random.nextInt(palette.length)],
  );

  /// Emits [count] particles at ([x], [y]) in particle space.
  void emit({int count = 1, double x = 0, double y = 0}) {
    for (var i = 0; i < count; i++) {
      if (template.spawnAt(system, x, y) < 0) break;
    }
  }

  /// Renders shrinking filled circles, matching the original look.
  ParticleRenderer get renderer => _ShrinkingCircleRenderer(radius);
}

class _ShrinkingCircleRenderer extends ParticleRenderer {
  _ShrinkingCircleRenderer(this.radius);
  final double radius;
  final Paint _paint = Paint();

  @override
  void paint(Canvas canvas, Size size, ParticleBuffers b) {
    for (var i = 0; i < b.count; i++) {
      _paint.color = Color(b.color[i]);
      canvas.drawCircle(Offset(b.px[i], b.py[i]), radius * b.size[i], _paint);
    }
  }
}
