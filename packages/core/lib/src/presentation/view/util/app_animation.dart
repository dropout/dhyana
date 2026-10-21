import 'package:material_ui/material_ui.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_animate/flutter_animate.dart';

Curve _curve = Curves.easeOut;
const int _interval = 64; // in ms
const int _duration = 640; // in ms

extension RevealListAnimation on List<Widget> {
  List<Widget> revealListAnimation({
    double delay = 0.0,
    int interval = _interval,
    int duration = _duration,
  }) {
    return animate(
      delay: delay.ms,
      interval: interval.ms,
    ).fadeIn(curve: _curve, duration: duration.ms);
  }
}

extension RevealExtension on Widget {
  
    Widget revealWipe({
      Key? key,
      Duration duration = Durations.extralong4,
      Duration delay = Duration.zero,
      Curve curve = Curves.linear,
    }) {
      return RevealAnimation(
        key: key,
        duration: duration,
        delay: delay,
        curve: curve,
        child: this,
      );
    }

    /// Reveals the widget with a fade-in animation based on its order in the list.
    /// [order] The order of the widget in the list, used to calculate the delay for the reveal animation.
    Widget reveal(int order) {
      return animate(
        delay: Duration(milliseconds: order * _interval),
      ).fadeIn(
        curve: _curve,
        duration: _duration.ms
      );
    }
}

extension RevealWidgetAnimation on Widget {
  Widget loadingReveal() {
    return animate().fadeIn(
      delay: const Duration(milliseconds: 256),
      duration: const Duration(milliseconds: 512),
    );
  }

  Widget gridReveal(int x, int y) {
    return animate().fadeIn(
      curve: Curves.easeOutQuad,
      delay: Duration(milliseconds: (x + y) * 64),
      duration: Duration(milliseconds: 1024),
    );
  }
}

class SpringCurve extends Curve {
  @override
  double transform(double t) {
    // A SpringSimulation that will simulate spring physics.
    final simulation = SpringSimulation(
      const SpringDescription(
        mass: 1,
        stiffness: 120, // Stiffness of the spring
        damping: 30, // Damping to control oscillation
      ),
      0, // Initial position
      1, // Target position
      0, // Initial velocity
    );

    return simulation.x(t); // The position of the spring at time t
  }
}

Widget animatedSwitcherTransition(Widget child, Animation<double> animation) {
  return FadeTransition(
    opacity: Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: animation, curve: Interval(0.5, 1.0))),
    child: child,
  );
}

(double, List<double>) calculateIntervals({
  int intervalCount = 10,
  double overlapFactor = 0.0,
}) {
  double intervalLength =
      1.0 / (intervalCount - overlapFactor * (intervalCount - 1));

  List<double> startTimes = List.generate(intervalCount, (index) {
    return index * intervalLength * (1 - overlapFactor);
  });

  return (intervalLength, startTimes);
}

class RevealAnimation extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Curve curve;

  const RevealAnimation({
    super.key,
    required this.child,
    this.duration = Durations.medium1,
    this.delay = Duration.zero,
    this.curve = Curves.easeIn,
  });

  @override
  State<RevealAnimation> createState() => _RevealAnimationState();
}

class _RevealAnimationState extends State<RevealAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);

    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);

    if (widget.delay == Duration.zero) {
      _controller.forward();
    } else {
      Future.delayed(widget.delay, () {
        if (mounted) _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Calculate gradient stop movement from Top-Right (1, -1) to Bottom-Left (-1, 1)
        final progress = _animation.value;

        // Expand the gradient bounds as it sweeps to ensure a complete transition
        final double head = (progress * 3.0) - 1.0;
        final double tail = head - 0.8;

        return ShaderMask(
          blendMode: BlendMode.dstIn,
          shaderCallback: (bounds) {
            return LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: const [
                Colors.black, // Fully visible
                Colors.transparent, // Fully hidden
              ],
              stops: [tail.clamp(0.0, 1.0), head.clamp(0.0, 1.0)],
            ).createShader(bounds);
          },
          child: child,
        );
      },
      child: widget.child,
    );
  }
}
