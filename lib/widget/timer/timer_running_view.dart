import 'package:dhyana/service/wakelock_service.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/widget/app_theme_data.dart';
import 'package:dhyana/widget/timer/running/all.dart';

class TimerRunningView extends StatefulWidget {

  final TimerState timerState;
  final WakelockService wakelockService;

  const TimerRunningView({
    required this.timerState,
    required this.wakelockService,
    super.key,
  });

  @override
  State<TimerRunningView> createState() => _TimerRunningViewState();
}

class _TimerRunningViewState extends State<TimerRunningView>
  with WidgetsBindingObserver {

  @override
  initState() {
    widget.wakelockService.enable();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  void _onBackground(BuildContext context) {
    BlocProvider.of<TimerBloc>(context).add(TimerEvent.paused());
  }

  @override
  Widget build(BuildContext context) {
    if (widget.timerState.timerStatus == TimerStatus.error) {
      return AppErrorDisplay(
        onButtonTap: () => GoRouter.of(context).pop(),
      );
    } else {
      return buildLayout(context);
    }
  }

  Widget buildLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppThemeData.spacingMd),
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: constraints.constrainHeight() / 2 - 88,
                width: constraints.maxWidth,
                child: TimerRunningTitle(
                  timerState: widget.timerState,
                  positionOffset: Offset(0.0,constraints.constrainHeight() / 2 - 88),
                )
              ),
              Center(
                child: TimerRunningTime(
                  timerState: widget.timerState
                )
              ),
              Align(
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
        _onBackground(context);
      default:
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    widget.wakelockService.disable();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

}
