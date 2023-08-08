import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:dhyana/route/app_screen.dart';
import 'package:dhyana/widgets/app_theme_data.dart';

class TimerRunningControls extends StatefulWidget {

  final double iconSize = 80;
  final TimerState timerState;

  const TimerRunningControls({
    required this.timerState,
    super.key,
  });

  @override
  State<TimerRunningControls> createState() => _TimerRunningControlsState();
}

class _TimerRunningControlsState extends State<TimerRunningControls> with SingleTickerProviderStateMixin {

  // Predefined values
  // Update if pause menu change required
  static const int _itemCount = 2;
  static const _itemAnimationTime = Duration(milliseconds: 250);
  static const _staggerTime = Duration(milliseconds: 100);

  // Item stagger timer + item animation time
  // First item doesn't have a stagger delay
  static const _animationDuration = Duration(milliseconds: 100 + 250);

  late AnimationController _animationController;
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

  @override
  void initState() {
    _createAnimationIntervals();
    _animationController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    );
    super.initState();
  }

  @override
  void didUpdateWidget(TimerRunningControls oldWidget) {
    if (oldWidget.timerState.timerStatus != TimerStatus.paused && widget.timerState.timerStatus == TimerStatus.paused) {
      _animationController.forward(from: 0.0);
    }
    if (oldWidget.timerState.timerStatus == TimerStatus.paused && widget.timerState.timerStatus != TimerStatus.paused) {
      _animationController.reverse(from: 1.0);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _onPause(BuildContext context) {
    BlocProvider.of<TimerBloc>(context).add(TimerPaused());
    // Provider.of<AnalyticsService>(context, listen: false).logEvent(
    //   name: 'timer_pause',
    // );
  }

  void _onPlay(BuildContext context) {
    BlocProvider.of<TimerBloc>(context).add(TimerResumed());
    // Provider.of<AnalyticsService>(context, listen: false).logEvent(
    //   name: 'timer_resume',
    // );
  }

  void _onDiscard(BuildContext context) {
    GoRouter.of(context).goNamed(AppScreen.home.name);
    // Provider.of<AnalyticsService>(context, listen: false).logEvent(
    //   name: 'timer_discard',
    // );
  }

  void _onFinish(BuildContext context) {
    BlocProvider.of<TimerBloc>(context).add(FinishTimer());
    // Provider.of<AnalyticsService>(context, listen: false).logEvent(
    //   name: 'timer_finish',
    // );
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
          const SizedBox(height: AppThemeData.spacingMd),
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
    Function(BuildContext context) action,
  ) {
    return TextButton(
      onPressed: () => action(context),
      style: TextButton.styleFrom(
        minimumSize: const Size(160, 0),
        backgroundColor: bgColor,
        foregroundColor: textColor,
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
          Colors.black12,
          _onDiscard
      ),
      _buildMenuItem(
        context,
        AppLocalizations.of(context).timerFinishSessionButtonText.toUpperCase(),
        Colors.black,
        Colors.white,
        _onFinish
      ),
    ];

    final listItems = <Widget>[];
    for (var i = 0; i < items.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            final animationPercent = Curves.linear.transform(
              _itemSlideIntervals[i].transform(_animationController.value),
            );
            final opacity = animationPercent;
            return IgnorePointer(
              ignoring: animationPercent == 0,
              ignoringSemantics: true,
              child: Opacity(
                opacity: opacity,
                child: child,
              ),
            );
          },
          child: items[i],
        )
      );
    }
    return listItems;
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
    switch (timerState.timerStatus) {
      case TimerStatus.idle:
        return IconButton(
          iconSize: widget.iconSize,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () => _onPlay(context),
          icon: const Icon(Icons.play_circle_fill_rounded,
            color: Colors.white,
          )
        );
      case TimerStatus.running:
        return IconButton(
          iconSize: widget.iconSize,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () => _onPause(context),
          icon: const Icon(Icons.pause_circle_rounded,
            color: Colors.white,
          )
        );
      case TimerStatus.paused:
        return IconButton(
          iconSize: widget.iconSize,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () => _onPlay(context),
          icon: const Icon(Icons.play_circle_fill_rounded,
            color: Colors.white,
          )
        );
      case TimerStatus.completed:
        return IconButton(
          iconSize: widget.iconSize,
          padding: EdgeInsets.zero,
          alignment: Alignment.center,
          onPressed: () => _onPlay(context),
          icon: const Icon(Icons.play_circle_fill_rounded,
            color: Colors.white,
          )
        );
      case TimerStatus.error:
        return IconButton(
          iconSize: widget.iconSize,
          padding: EdgeInsets.zero,
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
    _animationController.dispose();
    super.dispose();
  }

}
