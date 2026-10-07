import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

/// Progress (0..1) of the line at [index] for the animation time [t] (0..1).
/// Lines at or above [anchor] lead; lines below it trail with a growing delay.
double wormProgress({
  required int index,
  required int anchor,
  required double t,
  double delayPerLine = 0.06,
  double maxDelay = 0.4,
}) {
  final distance = math.max(0, index - anchor);
  final delay = math.min(distance * delayPerLine, maxDelay);
  if (t <= delay) return 0;
  final local = ((t - delay) / (1 - delay)).clamp(0.0, 1.0);
  return Curves.easeInOutQuad.transform(local);
}

/// Visually offsets [child] by the remaining part of a programmatic scroll
/// jump, producing the staggered "worm" motion without rebuilding [child].
class WormLine extends StatelessWidget {
  final int index;
  final Animation<double> animation;
  final ValueGetter<double> delta;
  final ValueGetter<int> anchor;
  final double delayPerLine;
  final double maxDelay;
  final Widget child;

  const WormLine({
    super.key,
    required this.index,
    required this.animation,
    required this.delta,
    required this.anchor,
    required this.delayPerLine,
    required this.maxDelay,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: RepaintBoundary(child: child),
      builder: (context, child) {
        final progress = wormProgress(
          index: index,
          anchor: anchor(),
          t: animation.value,
          delayPerLine: delayPerLine,
          maxDelay: maxDelay,
        );
        return Transform.translate(
          offset: Offset(0, delta() * (1 - progress)),
          child: child,
        );
      },
    );
  }
}
