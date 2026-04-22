import 'dart:async';

import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flip_board/flip_widget.dart';
import 'package:flutter/material.dart';

/// Toggle button that switches the home screen between the timer settings view
/// and the chanting settings view. The widget uses callback pattern to notify
/// parent of mode changes.
class SessionTypeToggle extends StatefulWidget {
  final SessionType activeMode;
  final ValueChanged<SessionType> onModeChanged;
  final EdgeInsetsGeometry? padding;

  const SessionTypeToggle({
    required this.activeMode,
    required this.onModeChanged,
    super.key,
    this.padding,
  });

  @override
  State<SessionTypeToggle> createState() => _SessionTypeToggleState();
}

class _SessionTypeToggleState extends State<SessionTypeToggle> {
  late final StreamController<SessionType> _modeStreamController;

  @override
  void initState() {
    super.initState();
    _modeStreamController = StreamController<SessionType>();
    _modeStreamController.add(widget.activeMode);
  }

  @override
  void didUpdateWidget(covariant SessionTypeToggle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.activeMode != widget.activeMode) {
      _modeStreamController.add(widget.activeMode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.hapticsTap();
        SessionType newMode = (widget.activeMode == SessionType.timer)
            ? SessionType.chanting
            : SessionType.timer;
        widget.onModeChanged(newMode);
      },
      child: FlipWidget<SessionType>(
        flipDuration: Durations.medium2,
        flipType: .spinFlip,
        flipCurve: FlipWidget.bounceFastFlip,
        itemStream: _modeStreamController.stream,
        itemBuilder: _builder,
        flipDirection: .left,
        initialValue: (widget.activeMode == .timer) ? .chanting : .timer,
      ),
    );
  }

  Widget _builder(BuildContext context, SessionType? item) {
    return DecoratedBox(
      decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.black,
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignSpec.paddingMd),
        child: Icon(
          (item == SessionType.timer) ? Icons.music_note : Icons.timer_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _modeStreamController.close();
    super.dispose();
  }

}


class CustomInkWell extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;

  const CustomInkWell({required this.child, this.onTap, super.key});

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
      CurvedAnimation(parent: _animationController, curve: Curves.easeOut),
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
          builder: (context, child) => CustomPaint(
            painter: _InkRipplePainter(
              endSize: 48,
              progress: _progressAnimation.value,
            ),
            child: widget.child,
          ),
        ),
        GestureDetector(
          onTap: _onTap,
          behavior: HitTestBehavior.translucent,
          child: widget.child,
        ),
      ],
    );
  }
}

class _InkRipplePainter extends CustomPainter {
  final double endSize;
  final double progress;

  const _InkRipplePainter({required this.endSize, required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      endSize * progress,
      Paint()..color = Colors.black.withValues(alpha: (1.0 - progress) * 0.3),
    );

    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      24,
      Paint()..color = Colors.black,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
