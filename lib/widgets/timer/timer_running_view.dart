import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/timer/timer_running_controls.dart';
import 'package:dhyana/widgets/timer/timer_running_time_display.dart';
import 'package:dhyana/widgets/util/app_error_display.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'timer_stage_display.dart';

class TimerRunningView extends StatefulWidget {

  final TimerState timerState;
  const TimerRunningView({
    required this.timerState,
    super.key,
  });

  @override
  State<TimerRunningView> createState() => _TimerRunningViewState();
}

class _TimerRunningViewState extends State<TimerRunningView> {

  @override
  initState() {
    WakelockPlus.enable();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.timerState.timerStatus == TimerStatus.error) {
      return AppErrorDisplay(
        onButtonTap: () {
          GoRouter.of(context).pop();
        },
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(AppThemeData.spacingMd),
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              fit: StackFit.expand,
              children: [
                Positioned.fill(
                  top: constraints.constrainHeight() / 2 - 75,
                  child: TimerStageDisplay(
                    timerState: widget.timerState,
                  )
                ),
                Center(
                  child: TimerRunningTimeDisplay(
                    timerState: widget.timerState
                  )
                ),
                Container(
                  alignment: const Alignment(0.0, 0.85),
                  child: TimerRunningControls(
                    timerState: widget.timerState
                  ),
                ),
              ],
            );
          }
        ),
      );
    }
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    super.dispose();
  }

}
