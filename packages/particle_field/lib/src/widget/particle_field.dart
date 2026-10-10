import 'package:flutter/widgets.dart';

import '../render/particle_renderer.dart';
import '../render/points_renderer.dart';
import 'particle_controller.dart';

/// Paints a [ParticleController]'s system with a [ParticleRenderer].
///
/// Particle space has its origin at [alignment] inside the widget, +y down.
class ParticleField extends StatefulWidget {
  const ParticleField({
    required this.controller,
    this.renderer,
    this.alignment = Alignment.center,
    this.clip = true,
    this.child,
    super.key,
  });

  final ParticleController controller;

  /// Defaults to a [PointsRenderer].
  final ParticleRenderer? renderer;
  final Alignment alignment;
  final bool clip;

  /// Optional content painted beneath the particles.
  final Widget? child;

  /// Converts a widget-local position to particle space.
  static Offset toParticleSpace(Offset local, Size size, Alignment alignment) =>
      local - alignment.alongSize(size);

  @override
  State<ParticleField> createState() => _ParticleFieldState();
}

class _ParticleFieldState extends State<ParticleField> {
  final ParticleRenderer _fallback = PointsRenderer();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: CustomPaint(
        foregroundPainter: _ParticlePainter(
          controller: widget.controller,
          renderer: widget.renderer ?? _fallback,
          alignment: widget.alignment,
          clip: widget.clip,
        ),
        child: widget.child ?? const SizedBox.expand(),
      ),
    );
  }
}

class _ParticlePainter extends CustomPainter {
  _ParticlePainter({
    required this.controller,
    required this.renderer,
    required this.alignment,
    required this.clip,
  }) : super(
         repaint: renderer.repaint == null
             ? controller
             : Listenable.merge([controller, renderer.repaint]),
       );

  final ParticleController controller;
  final ParticleRenderer renderer;
  final Alignment alignment;
  final bool clip;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    if (clip) canvas.clipRect(Offset.zero & size);
    final o = alignment.alongSize(size);
    canvas.translate(o.dx, o.dy);
    renderer.paint(canvas, size, controller.system.buffers);
    canvas.restore();
  }

  @override
  bool shouldRepaint(_ParticlePainter old) =>
      old.controller != controller ||
      old.renderer != renderer ||
      old.alignment != alignment ||
      old.clip != clip;
}
