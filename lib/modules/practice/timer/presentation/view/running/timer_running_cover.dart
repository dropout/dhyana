import 'package:flutter/material.dart';

class TimerRunningCover extends StatefulWidget {

  static const Key tapTargetKey = Key('timer_running_cover_tap_target');
  static const Key animatedContainerKey = Key('timer_running_cover_animated_container');

  final Color overlayColor;
  final Widget? child;

  const TimerRunningCover({
    this.overlayColor = Colors.black,
    this.child,
    super.key,
  });

  @override
  State<TimerRunningCover> createState() => _TimerRunningCoverState();
}

class _TimerRunningCoverState extends State<TimerRunningCover> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.extralong3,
    );
    _opacityAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onShowOverlayClickTargetTapped() {
    _animationController.forward();
  }

  void _onOverlayTapped() {
    _animationController.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        buildShowOverlayClickTarget(context),
        widget.child ?? const SizedBox.shrink(),
        buildOverlay(context),
      ]
    );
  }

  Widget buildShowOverlayClickTarget(BuildContext context) {
    return GestureDetector(
      onTap: _onShowOverlayClickTargetTapped,
      child: SizedBox.expand(
        child: DecoratedBox(
          key: TimerRunningCover.tapTargetKey,
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
        ),
      ),
    );
  }

  Widget buildOverlay(BuildContext context) {
    return AnimatedBuilder(
      animation: _opacityAnimation,
      builder: (context, child) {

        if (_opacityAnimation.value == 0.0) {
          return const SizedBox.shrink();
        }

        return GestureDetector(
          onTap: _onOverlayTapped,
          child: IgnorePointer(
            ignoring: (_animationController.value < 1.0),
            child: SizedBox.expand(
              child: Container(
                key: TimerRunningCover.animatedContainerKey,
                color: widget.overlayColor.withValues(
                  alpha: _animationController.value
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
