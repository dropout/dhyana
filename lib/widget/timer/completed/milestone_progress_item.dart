import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:particle_field/particle_field.dart';
import 'package:rnd/rnd.dart';
import 'package:vector_math/vector_math.dart' as vm;

enum MilestoneProgressItemMode {
  incomplete,
  completed,
  animate,
}

class MilestoneProgressItem extends StatefulWidget {

  final MilestoneProgressItemMode mode;
  final Color completedColor;
  final Color incompleteColor;

  const MilestoneProgressItem({
    this.mode = MilestoneProgressItemMode.completed,
    this.completedColor = Colors.green,
    this.incompleteColor = Colors.grey,
    super.key,
  });

  @override
  State<MilestoneProgressItem> createState() => _MilestoneProgressItemState();
}

class _MilestoneProgressItemState extends State<MilestoneProgressItem>
    with TickerProviderStateMixin {

  // main animation controller
  late final AnimationController animationController;

  // circle and tick shape animations
  late final Animation<double> _circleAnimation;
  late final Animation<double> _shapeAnimation;

  // particle system
  late final ParticleController particleController;
  int lastEmit = 0;
  int emitGap = 1;
  int particleCount = 2;

  @override
  void initState() {

    particleController = ParticleController(
        vsync: this,
        autoStart: false,
        onTick: (controller, elapsedTime) {
          List<Particle> particles = controller.particles;

          bool freeToEmit = elapsedTime.inMilliseconds - lastEmit > emitGap;
          bool particlesLeft = particleCount > 0;
          // print('freeToEmit: $freeToEmit, particlesLeft: $particlesLeft, elapsedTime: ${elapsedTime.inMilliseconds}, lastEmit: $lastEmit');
          if (freeToEmit && particlesLeft) {
            controller.start(); // in case its stopped

            vm.Vector2 velocity = vm.Vector2(
              rnd.getDouble(-1, 1),
              rnd.getDouble(-1, 1),
            );

            velocity = velocity * rnd.getDouble(2.0, 4.0);

            particles.add(Particle(
              vx: velocity.x,
              vy: velocity.y,
              lifespan: 60,
              color: Colors.green,
            ));
            setState(() {
              lastEmit = elapsedTime.inMilliseconds;
              particleCount--;
            });
          }

          for (int i = particles.length - 1; i >= 0; i--) {
            Particle p = particles[i];
            p.vx = p.vx * 0.97;
            p.vy = p.vy * 0.97;
            p.update();

            if (p.age >= p.lifespan) {
              particles.removeAt(i);
            }
          }

          if (particlesLeft == false && particles.isEmpty) {
            controller.stop();
          }

        }
    );

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    if (widget.mode == MilestoneProgressItemMode.animate) {
      Future.delayed(const Duration(milliseconds: 500), () {
        animationController.forward();
        timeParticles();
      });
    }

    _circleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(
          .0,
          1.0,
          curve: Curves.elasticOut,
        ),
      )
    );

    _shapeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
        CurvedAnimation(
          parent: animationController,
          curve: const Interval(
            0.5,
            1.0,
          ),
        )
    );

    super.initState();
  }

  void resetParticles() {
    setState(() {
      lastEmit = 0;
      particleCount = 48;
    });
  }

  void timeParticles() {
    Future.delayed(const Duration(milliseconds: 210), () {
      resetParticles();
      particleController.start();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.mode == MilestoneProgressItemMode.animate) {
          animationController.forward(from: 0.0);
          resetParticles();
          timeParticles();
        }
      },
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (widget.mode) {
      case MilestoneProgressItemMode.incomplete:
        return _buildIncomplete();
      case MilestoneProgressItemMode.completed:
        return _buildCompleted();
      case MilestoneProgressItemMode.animate:
        return _buildAnimated();
    }
  }

  Widget _buildIncomplete() {
    return DecoratedBox(
        decoration: BoxDecoration(
          color: widget.incompleteColor,
          shape: BoxShape.circle,
        )
    );
  }

  Widget _buildCompleted() {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.completedColor,
        shape: BoxShape.circle,
      ),
      child: CustomPaint(
        painter: CheckShapePainter(),
      ),
    );
  }

  Widget _buildAnimated() {
    return Stack(
      fit: StackFit.expand, // re-expand to fill the parent
      children: [
        _buildIncomplete(),
        ParticleField(controller: particleController),

        AnimatedBuilder(
          animation: _circleAnimation,
          builder: (BuildContext context, Widget? child) {
            return CustomPaint(
              painter: CirclePainter(
                color: widget.completedColor,
                animation: _circleAnimation.value,
              ),
              foregroundPainter: CheckShapePainter(
                color: Colors.white,
                animation: _shapeAnimation.value,
              ),
              child: child,
            );
          },
        )
      ],
    );

  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}

class CirclePainter extends CustomPainter {

  final double animation;
  final Color color;

  CirclePainter({
    this.animation = 0.0,
    this.color = Colors.grey,
  });

  @override
  void paint(Canvas canvas, Size size) {

    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width/2, size.height/2),
        size.width/2 * animation,
        paint
    );
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) {
    return (
        oldDelegate.animation != animation ||
            oldDelegate.color != color
    );
  }

}

class CheckShapePainter extends CustomPainter {

  // Center in 32x32 box
  static const List<double> checkShape = [
    9, 17,
    13.5, 21.5,
    23, 12,
  ];

  final Color color;
  final double animation;
  late final Paint p;

  CheckShapePainter({
    this.color = Colors.white,
    this.animation = 1.0,
  }) {
    p = Paint()
      ..color = color
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;
  }

  @override
  void paint(Canvas canvas, Size size) {

    Path path = createAnimatedPath(createCheckShapePath(size), animation);

    canvas.drawPath(path, p);
  }

  Path createCheckShapePath(Size size) {
    double xScaleRatio = size.width / 32;
    double yScaleRatio = size.height / 32;

    Path path = Path();
    path.moveTo(checkShape[0] * xScaleRatio, checkShape[1] * yScaleRatio);
    path.lineTo(checkShape[2] * xScaleRatio, checkShape[3] * yScaleRatio);
    path.lineTo(checkShape[4] * xScaleRatio, checkShape[5] * yScaleRatio);

    return path;
  }

  @override
  bool shouldRepaint(covariant CheckShapePainter oldDelegate) {
    return (
        oldDelegate.color != color ||
            oldDelegate.animation != animation
    );
  }

}

Path createAnimatedPath(
    Path originalPath,
    double animationPercent,
    ) {
  // ComputeMetrics can only be iterated once!
  final totalLength = originalPath
      .computeMetrics()
      .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);
  final currentLength = totalLength * animationPercent;
  return extractPathUntilLength(originalPath, currentLength);
}

Path extractPathUntilLength(
    Path originalPath,
    double length,
    ) {
  var currentLength = 0.0;

  final path = Path();

  var metricsIterator = originalPath.computeMetrics().iterator;

  while (metricsIterator.moveNext()) {
    var metric = metricsIterator.current;

    var nextLength = currentLength + metric.length;

    final isLastSegment = nextLength > length;
    if (isLastSegment) {
      final remainingLength = length - currentLength;
      final pathSegment = metric.extractPath(0.0, remainingLength);

      path.addPath(pathSegment, Offset.zero);
      break;
    } else {
      // There might be a more efficient way of extracting an entire path
      final pathSegment = metric.extractPath(0.0, metric.length);
      path.addPath(pathSegment, Offset.zero);
    }

    currentLength = nextLength;
  }

  return path;
}
