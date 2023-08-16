import 'package:flutter/material.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';

class TimerStageDisplay extends StatefulWidget {

  final TimerState timerState;

  const TimerStageDisplay({
    required this.timerState,
    super.key
  });

  @override
  State<TimerStageDisplay> createState() => _TimerStageDisplayState();
}

class _TimerStageDisplayState extends State<TimerStageDisplay> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: buildText(context, widget.timerState),
    );
  }

  Widget buildText(BuildContext context, TimerState timerState) {

    TextStyle style = Theme.of(context).textTheme.titleLarge!.copyWith(
      fontFamily: 'RobotoCondensed',
      fontWeight: FontWeight.bold,
      color: Colors.white,
    );

    switch (timerState.timerStage) {
      case TimerStage.warmup:
        return Text('Warmup',
          textAlign: TextAlign.center,
          style: style,
        );
      case TimerStage.timer:
        return Text('Timer',
          textAlign: TextAlign.center,
          style: style,
        );
    }
  }
}
