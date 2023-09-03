import 'package:flutter/material.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';

class TimerRunningTitle extends StatefulWidget {

  final TimerState timerState;
  final Offset positionOffset;

  const TimerRunningTitle({
    required this.timerState,
    required this.positionOffset,
    super.key
  });

  @override
  State<TimerRunningTitle> createState() => _TimerRunningTitleState();
}

class _TimerRunningTitleState extends State<TimerRunningTitle> {

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 256),
      switchInCurve: Curves.easeOut,
      child: buildText(context, widget.timerState),
      transitionBuilder: (Widget child, Animation<double> animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0.0, -0.25),
            end: const Offset(0.0, 0.0),
          ).animate(animation),
          child: FadeTransition(
            opacity: Tween<double>(
              begin: 0,
              end: 1,
            ).animate(animation),
            child: child,
          ),
        );
      },
    );
  }

  Widget? buildText(BuildContext context, TimerState timerState) {
    TextStyle style = Theme.of(context).textTheme.titleLarge!.copyWith(
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );
    switch (timerState.timerStage) {
      case TimerStage.timer:
        return null;
      case TimerStage.warmup:
        return Text(
        'Warmup',
        style: style,
        key: const ValueKey<String>('Warmup'),
      );
    }
  }

}
