import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

/// Toggle button that switches the home screen between the timer settings view
/// and the chanting settings view. The widget uses callback pattern to notify
/// parent of mode changes.
class SessionTypeToggle extends StatelessWidget {
  const SessionTypeToggle({
    required this.activeMode,
    required this.onModeChanged,
    super.key,
    this.padding,
  });

  final SessionType activeMode;
  final ValueChanged<SessionType> onModeChanged;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return CustomInkWell(
      onTap: () {
        context.hapticsTap();
        SessionType newMode = (activeMode == SessionType.timer)
          ? SessionType.chanting
          : SessionType.timer;
        onModeChanged(newMode);
      },
      child: Padding(
        padding: padding ?? const EdgeInsets.all(DesignSpec.paddingMd),
        child: Icon(
          (activeMode == SessionType.timer)
            ? Icons.music_note
            : Icons.hourglass_bottom_rounded,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
    );
  }

}


class CustomInkWell extends StatefulWidget {

  final Widget child;
  final VoidCallback? onTap;

  const CustomInkWell({
    required this.child,
    this.onTap,
    super.key,
  });

  @override
  State<CustomInkWell> createState() => _CustomInkWellState();
}

class _CustomInkWellState extends State<CustomInkWell>
  with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;
  late final Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Durations.medium4,
    );

    _progressAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOut,
      ),
    );
  }

  void _onTap() {
    if (widget.onTap != null) {
      widget.onTap!();
      _animationController.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) =>
            CustomPaint(
              painter: _InkRipplePainter(
                endSize: 64,
                progress: _progressAnimation.value,
              ),
              child: widget.child,
            ),
        ),
        GestureDetector(
          onTap: _onTap,
          behavior: HitTestBehavior.translucent,
          child: widget.child,
        )
      ]
    );
  }

}

class _InkRipplePainter extends CustomPainter {

  final double startSize;
  final double endSize;
  final double progress;

  const _InkRipplePainter({
    required this.endSize,
    required this.progress,
    this.startSize = 0.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      startSize + (endSize - startSize) * progress,
      Paint()..color = Colors.black.withValues(alpha: (1.0 - progress) * 0.3),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}











