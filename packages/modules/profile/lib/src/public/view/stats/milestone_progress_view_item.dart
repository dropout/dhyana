import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';
import 'package:particle_field/particle_field.dart' hide BoxShape;

enum MilestoneProgressViewItemMode { incomplete, completed, animate }

class MilestoneProgressViewItem extends StatefulWidget {
  final MilestoneProgressViewItemMode mode;
  final Color completedColor;
  final Color incompleteColor;

  const MilestoneProgressViewItem({
    this.mode = MilestoneProgressViewItemMode.completed,
    this.completedColor = Colors.green,
    this.incompleteColor = Colors.grey,
    super.key,
  });

  @override
  State<MilestoneProgressViewItem> createState() =>
      _MilestoneProgressViewItemState();
}

class _MilestoneProgressViewItemState extends State<MilestoneProgressViewItem>
    with TickerProviderStateMixin {
  // main animation controller
  late final AnimationController animationController;

  // circle and tick shape animations
  late final Animation<double> _circleAnimation;
  late final Animation<double> _shapeAnimation;

  // particle system
  late final ShrinkingBurst _fireworks;
  late final ParticleController particleController;
  AtlasRenderer? _renderer;
  ui.Image? _sprite;
  final _random = Random();
  Timer? _burstTimer;

  static const _burstCount = 3;

  @override
  void initState() {
    _fireworks = ShrinkingBurst(
      random: _random,
      maxParticles: 512,
      radius: 16,
      palette: [
        AppColors.appWhite.toARGB32(),
        AppColors.crimsonRed.toARGB32(),
        Colors.blue.toARGB32(),
        AppColors.gold.toARGB32(),      
      ],
    );
    createSoftCircleImage(diameter: 16, hardness: 0.5).then((image) {
      if (!mounted) {
        image.dispose();
        return;
      }
      setState(() {
        _sprite = image;
        // spriteSize is the diameter of the burst's 16px radius.
        _renderer = AtlasRenderer(image: image, spriteSize: 6);
      });
    });
    particleController = ParticleController(
      vsync: this,
      system: _fireworks.system,
    );

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    if (widget.mode == MilestoneProgressViewItemMode.animate) {
      Future.delayed(const Duration(milliseconds: 256), () {
        if (mounted) {
          animationController.forward();
          _startBursts();
        }
      });
    }

    _circleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(.0, 1.0, curve: Curves.elasticOut),
      ),
    );

    _shapeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: animationController,
        curve: const Interval(0.5, 1.0),
      ),
    );

    super.initState();
  }

  // Schedules a few bursts at random intervals.
  void _startBursts([int remaining = _burstCount]) {
    _burstTimer?.cancel();
    if (remaining == 0) return;
    _burstTimer = Timer(Duration(milliseconds: 100 + _random.nextInt(225)), () {
      if (!mounted) return;
      final x = (_random.nextDouble() - 0.5) * 12;
      // _fireworks.launch(x, 0, apexY: -(20 + _random.nextDouble() * 30));
      _fireworks.emit(x: x, y: x, count: 48);
      _startBursts(remaining - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Actual animation and particle system only built in animate mode.
        // For performance reasons.
        if (widget.mode == MilestoneProgressViewItemMode.animate) {
          animationController.forward(from: 0.0);
          particleController.clear();
          _startBursts();
        }
      },
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (widget.mode) {
      case MilestoneProgressViewItemMode.incomplete:
        return _buildIncomplete();
      case MilestoneProgressViewItemMode.completed:
        return _buildCompleted();
      case MilestoneProgressViewItemMode.animate:
        return _buildAnimated();
    }
  }

  Widget _buildIncomplete() {
    return DecoratedBox(
      key: const Key('milestone_progress_view_item_incomplete'),
      decoration: BoxDecoration(
        color: widget.incompleteColor,
        shape: BoxShape.circle,
        border: Border.all(
          color: Color.lerp(widget.incompleteColor, Colors.white, 0.2)!,
          width: 2.0,
        ),
      ),
    );
  }

  Widget _buildCompleted() {
    return DecoratedBox(
      key: const Key('milestone_progress_view_item_completed'),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Color.lerp(widget.completedColor, Colors.white, 0.2)!,
          width: 2.0,
        ),
        gradient: RadialGradient(
          colors: [
            Color.lerp(widget.completedColor, Colors.black, 0.15)!,
            widget.completedColor,
          ],
          stops: const [0.33, 1.0],
        ),
      ),
      child: CustomPaint(painter: CheckShapePainter()),
    );
  }

  Widget _buildAnimated() {
    return Stack(
      key: const Key('milestone_progress_view_item_animated'),
      fit: StackFit.expand, // re-expand to fill the parent
      children: [
        _buildIncomplete(),

        ParticleField(
          controller: particleController,
          renderer: _renderer,
          clip: false,
        ),

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
        ),
      ],
    );
  }

  @override
  void dispose() {
    _burstTimer?.cancel();
    animationController.dispose();
    particleController.dispose();
    _sprite?.dispose();
    super.dispose();
  }
}

class CirclePainter extends CustomPainter {
  final double animation;
  final Color color;

  CirclePainter({this.animation = 0.0, this.color = Colors.grey});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final gradient = RadialGradient(
      colors: [Color.lerp(color, Colors.black, 0.15)!, color],
      stops: const [0.33, 1.0],
    );

    gradient.createShader(
      Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2,
      ),
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.width / 2 * animation,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CirclePainter oldDelegate) {
    return (oldDelegate.animation != animation || oldDelegate.color != color);
  }
}

class CheckShapePainter extends CustomPainter {
  // Center in 32x32 box
  static const List<double> checkShape = [9, 17, 13.5, 21.5, 23, 12];

  final Color color;
  final double animation;
  late final Paint p;

  CheckShapePainter({this.color = Colors.white, this.animation = 1.0}) {
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
    return (oldDelegate.color != color || oldDelegate.animation != animation);
  }
}

Path createAnimatedPath(Path originalPath, double animationPercent) {
  // ComputeMetrics can only be iterated once!
  final totalLength = originalPath.computeMetrics().fold(
    0.0,
    (double prev, ui.PathMetric metric) => prev + metric.length,
  );
  final currentLength = totalLength * animationPercent;
  return extractPathUntilLength(originalPath, currentLength);
}

Path extractPathUntilLength(Path originalPath, double length) {
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
