import 'package:dhyana/util/remap_range.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';

class AppLoadingIndicator extends StatefulWidget {

  final double size;
  final Duration duration;
  final Curve curve;

  const AppLoadingIndicator({
    this.size = DesignSpec.spacingMd,
    this.duration = const Duration(milliseconds: 512),
    this.curve = Curves.easeInOutSine,
    super.key
  });

  @override
  State<AppLoadingIndicator> createState() => _AppLoadingIndicatorState();
}

class _AppLoadingIndicatorState extends State<AppLoadingIndicator>
    with SingleTickerProviderStateMixin {

  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat(reverse: true);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.scale(
        scale: widget.curve.transform(controller.value).remapAndClamp(0.0, 1.0, 0.25, 0.55).toDouble(),
        child: child,
      ),
      child: Container(
        width: widget.size,
        height: widget.size,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
