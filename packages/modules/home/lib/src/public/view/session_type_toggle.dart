
import 'package:core/core.dart';
import 'package:home/src/public/enum/home_screen_view_state.dart';
import 'package:material_ui/material_ui.dart';

/// Toggle button that switches the home screen between the timer settings view
/// and the chanting settings view. The widget uses callback pattern to notify
/// parent of mode changes.
class SessionTypeToggle extends StatelessWidget {
  final HomeScreenViewState activeMode;
  final ValueChanged<HomeScreenViewState> onModeChanged;
  final EdgeInsetsGeometry? padding;

  const SessionTypeToggle({
    required this.activeMode,
    required this.onModeChanged,
    super.key,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {        
        HomeScreenViewState newMode = (activeMode == HomeScreenViewState.sitting)
            ? HomeScreenViewState.chanting
            : HomeScreenViewState.sitting;
        onModeChanged(newMode);
        context.hapticsTap();
      },
      child: AnimatedSwitcher(
        duration: Durations.medium2,
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        transitionBuilder: (child, animation) {
          return ScaleTransition(
            scale: animation,
            child: FadeTransition(
              opacity: animation,
              child: child,
            ),
          );
        },
        child: _builder(context, activeMode),
      ),
    );
  }

  Widget _builder(BuildContext context, HomeScreenViewState item) {
    return DecoratedBox(
      key: ValueKey(item.name),
      decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.buttonBackground,
      ),
      child: Padding(
        padding: const EdgeInsets.all(DesignSpec.paddingMd),
        child: Icon(
          (item == HomeScreenViewState.sitting) ? Icons.music_note : Icons.timer_outlined,
          color: AppColors.buttonForeground,
        ),
      ),
    );
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
