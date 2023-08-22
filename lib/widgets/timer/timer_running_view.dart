import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/widgets/app_theme_data.dart';
import 'package:dhyana/widgets/timer/running/all.dart';
import 'package:dhyana/widgets/util/app_error_display.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class TimerRunningView extends StatefulWidget {

  final TimerState timerState;
  final void Function()? onInit;
  final void Function()? onBackground;
  final void Function()? onResume;

  const TimerRunningView({
    required this.timerState,
    this.onInit,
    this.onBackground,
    this.onResume,
    super.key,
  });

  @override
  State<TimerRunningView> createState() => _TimerRunningViewState();
}

class _TimerRunningViewState extends State<TimerRunningView> with WidgetsBindingObserver {

  @override
  initState() {
    WakelockPlus.enable();
    WidgetsBinding.instance.addObserver(this);
    widget.onInit?.call();
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
      return buildLayout(context);
    }
  }

  Widget buildLayout(BuildContext context) {
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

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.paused:
        widget.onBackground?.call();
      case AppLifecycleState.resumed:
        widget.onResume?.call();
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WakelockPlus.disable();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}
