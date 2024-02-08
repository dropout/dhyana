import 'package:flutter/material.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';

class TimerRunningTime extends StatelessWidget {

  final TimerState timerState;

  const TimerRunningTime({
    required this.timerState,
    super.key,
  });

  String _getRemainingFormattedTime() {

    late int elapsedSeconds;
    late int totalSeconds;

    switch (timerState.timerStage) {
      case TimerStage.warmup:
        elapsedSeconds = timerState.elapsedWarmupTime.inSeconds;
        totalSeconds = timerState.timerSettings.warmup.inSeconds;
      case TimerStage.timer:
        elapsedSeconds = timerState.elapsedTime.inSeconds;
        totalSeconds = timerState.timerSettings.duration.inSeconds;
    }

    int remainingSeconds = totalSeconds - elapsedSeconds;

    int fullMinutes = (remainingSeconds / 60).floor();
    int remainderSeconds = (remainingSeconds % 60);

    String twoDigitMinutes = fullMinutes.toString().padLeft(2, "0");
    String twoDigitSeconds = remainderSeconds.toString().padLeft(2, "0");

    return '$twoDigitMinutes:$twoDigitSeconds';
  }

  // double _getProgressPercentage() {
  //   double progress = timerState.elapsedTime.inSeconds / timerState.timerSettings.duration.inSeconds;
  //   return progress;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 288,
      height: 288,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Center(
          //   child: SizedBox(
          //     // alignment: Alignment.center,
          //     width: 288,
          //     height: 288,
          //     child: CircularProgressIndicator(
          //       backgroundColor: Colors.pinkAccent,
          //       valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          //       value: _getProgressPercentage(),
          //       strokeWidth: 2.0,
          //     ),
          //   ),
          // ),

          Center(
            child: Text(
              _getRemainingFormattedTime(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w100,
                fontSize: 80.0,
              )
            )
          ),

        ],
      ),
    );
  }

}
