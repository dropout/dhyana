import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/intersperse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/widget/design_spec.dart';


/// Controls displayed when the timer is running or paused
/// Includes the main play/pause button and the pause menu
/// with animated appearance/disappearance of menu items
class TimerRunningControls extends StatefulWidget {

  final double iconSize = 64;
  final TimerState timerState;

  const TimerRunningControls({
    required this.timerState,
    super.key,
  });

  @override
  State<TimerRunningControls> createState() => TimerRunningControlsState();
}

class TimerRunningControlsState extends State<TimerRunningControls> with SingleTickerProviderStateMixin {

  // Predefined values
  // Update if pause menu item count change required
  static const int _itemCount = 2;
  static const _itemAnimationTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 100);

  // Item stagger timer + item animation time
  // First item doesn't have a stagger delay
  static const _animationDuration = Duration(milliseconds: 100 + 250);

  late AnimationController animationController;
  final List<Interval> _itemSlideIntervals = [];

  // For now it only loops through 2 items
  void _createAnimationIntervals() {
    for (var i = 0; i < _itemCount; i++) {
      final startTime = _staggerTime * i;
      final endTime = startTime + _itemAnimationTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }
  }

  bool get shouldShowFinishButton  {
    return widget.timerState.timerStage == TimerStage.timer && widget.timerState.elapsedTime > const Duration(minutes: 1);
  }

  @override
  void initState() {
    _createAnimationIntervals();
    animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(TimerRunningControls oldWidget) {
    if (oldWidget.timerState.timerStatus != TimerStatus.paused && widget.timerState.timerStatus == TimerStatus.paused) {
      animationController.forward(from: 0.0);
    }
    if (oldWidget.timerState.timerStatus == TimerStatus.paused && widget.timerState.timerStatus != TimerStatus.paused) {
      animationController.reverse(from: 1.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onPause(BuildContext context) {
    BlocProvider.of<TimerBloc>(context).add(TimerEvent.paused());
    context.logEvent(name: 'timer_pause');
    context.hapticsTap();
  }

  void _onResume(BuildContext context) {
    BlocProvider.of<TimerBloc>(context).add(TimerEvent.resumed());
    context.logEvent(name: 'timer_resume');
    context.hapticsTap();
  }

  void _onDiscard(BuildContext context) {
    context.pop();
    context.logEvent(name: 'timer_discard');
    context.hapticsTap();
  }

  void _onFinish(BuildContext context) {
    BlocProvider.of<TimerBloc>(context).add(TimerEvent.finished());
    context.logEvent(name: 'timer_finish');
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildPauseMenu(context, widget.timerState),
          const SizedBox(height: DesignSpec.spacingXl),
          _buildMainButton(context, widget.timerState),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    BuildContext context,
    String text,
    Color textColor,
    Color bgColor,
    Function(BuildContext context) action, {
      Key? key,
    }
  ) {
    return TextButton(
      key: key,
      onPressed: () => action(context),
      style: TextButton.styleFrom(
        minimumSize: const Size(160, 0),
        backgroundColor: bgColor,
        foregroundColor: textColor,
        padding: const EdgeInsets.symmetric(
          horizontal: DesignSpec.spacingLg,
          vertical: DesignSpec.spacingMd,
        )
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: textColor,
          fontWeight: FontWeight.bold,
        )
      ),
    );
  }

  List<Widget> _buildAnimatedPauseMenuItems(BuildContext context) {
    final List<Widget> items = [
      _buildMenuItem(
        context,
        AppLocalizations.of(context).timerDiscardSessionButtonText.toUpperCase(),
        Colors.white,
        Colors.grey.shade800,
        _onDiscard,
        key: const Key('timer_running_controls_discard_button'),
      ),
      if (shouldShowFinishButton) _buildMenuItem(
        context,
        AppLocalizations.of(context).timerFinishSessionButtonText.toUpperCase(),
        Colors.black,
        Colors.white,
        _onFinish,
        key: const Key('timer_running_controls_finish_button'),
      ),
    ];

    final listItems = <Widget>[];
    for (var i = 0; i < items.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: animationController,
          builder: (context, child) {
            final animationPercent = Curves.linear.transform(
              _itemSlideIntervals[i].transform(animationController.value),
            );
            final opacity = animationPercent;
            return ExcludeSemantics(
              child: IgnorePointer(
                ignoring: (animationPercent <= 0),
                child: Opacity(
                  opacity: opacity,
                  child: child,
                ),
              ),
            );
          },
          child: items[i],
        )
      );
    }

    return listItems.intersperse(
      const SizedBox(height: DesignSpec.spacingMd)
    );
  }

  Widget _buildPauseMenu(BuildContext context, TimerState timerState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: _buildAnimatedPauseMenuItems(context),
    );
  }

  Widget _buildMainButton(BuildContext context, TimerState timerState) {
    final EdgeInsets padding = const EdgeInsets.all(
      DesignSpec.paddingLg,
    );
    final Key key = const Key('timer_running_controls_main_button');
    switch (timerState.timerStatus) {
      case TimerStatus.idle:
        return IconButton(
          key: key,
          iconSize: widget.iconSize,
          padding: padding,
          alignment: Alignment.center,
          onPressed: () => _onResume(context),
          icon: const Icon(Icons.play_arrow_rounded,
            color: Colors.white,
          )
        );
      case TimerStatus.running:
        return IconButton(
          key: key,
          iconSize: widget.iconSize,
          padding: padding,
          alignment: Alignment.center,
          onPressed: () => _onPause(context),
          icon: const Icon(Icons.pause_rounded,
            color: Colors.white,
          )
        );
      case TimerStatus.paused:
        return IconButton(
          key: key,
          iconSize: widget.iconSize,
          padding: padding,
          alignment: Alignment.center,
          onPressed: () => _onResume(context),
          icon: const Icon(Icons.play_arrow_rounded,
            color: Colors.white,
          )
        );
      case TimerStatus.completed:
        return IconButton(
          key: key,
          iconSize: widget.iconSize,
          padding: padding,
          alignment: Alignment.center,
          onPressed: () => _onResume(context),
          icon: const Icon(Icons.play_arrow_rounded,
            color: Colors.white,
          )
        );
      case TimerStatus.error:
        return IconButton(
          key: key,
          iconSize: widget.iconSize,
          padding: padding,
          alignment: Alignment.center,
          onPressed: () => _onDiscard(context),
          icon: const Icon(Icons.close,
            color: Colors.white,
          )
        );
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

}
