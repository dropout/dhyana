import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/timer/running/timer_running_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/timer/timer_completed_view.dart';
import 'package:dhyana/widget/timer/timer_running_view.dart';

class TimerScreen extends StatefulWidget {

  final TimerSettings timerSettings;

  const TimerScreen({
    required this.timerSettings,
    super.key,
  });

  @override
  State<TimerScreen> createState() => _TimerScreenState();
}

class _TimerScreenState extends State<TimerScreen> {

  bool showOverlay = false;

  // Handle going into background
  void Function() _onBackground(BuildContext context) {
    TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
    return () {
      timerBloc.add(TimerEvent.paused());
    };
  }

  // Handle resuming from background
  void Function() _onResume(BuildContext context) {
    TimerBloc timerBloc = BlocProvider.of<TimerBloc>(context);
    return () {
      timerBloc.add(TimerEvent.resumed());
    };
  }

  // Show black overlay
  void _onOverlayTargetTapped(BuildContext context) {
    setState(() {
      showOverlay = false;
    });
  }

  // Hide black overlay
  void _onOverlayClickTargetTapped(BuildContext context) {
    setState(() {
      showOverlay = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TimerBlocProviders(
      timerSettings: widget.timerSettings,
      child: buildScaffolding(context),
    );
  }

  Widget buildScaffolding(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
      builder: (BuildContext context, TimerState timerState) {
        return Scaffold(
          backgroundColor: Colors.black,
          extendBodyBehindAppBar: true,
          body: Stack(
            fit: StackFit.expand,
            clipBehavior: Clip.none,
            children: [
              buildContent(context, timerState),
              buildOverlay(context, timerState),
            ],
          ),
        );
      },
    );
  }

  Widget buildContent(BuildContext context, TimerState timerState) {
    final bool isCompleted = (timerState.timerStatus == TimerStatus.completed);
    return Stack(
      clipBehavior: Clip.none,
      children: [
        buildOverlayClickTarget(context),
        AnimatedSwitcher(
          duration: Durations.extralong4,
          switchInCurve: Curves.easeOutCubic,
          switchOutCurve: Curves.easeInCubic,
          child: isCompleted
            ? TimerCompletedView(
                timerSettings: widget.timerSettings,
                timerState: timerState,
              )
            : TimerRunningView(
                timerState: timerState,
                onBackground: _onBackground(context),
                onResume: _onResume(context),
              ),
        ),
      ],
    );
  }

  Widget buildOverlayClickTarget(BuildContext context) {
    return GestureDetector(
      onTap: () => _onOverlayClickTargetTapped(context),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
      )
    );
  }

  Widget buildOverlay(BuildContext context, TimerState timerState) {
    // If the timer is completed, this should be false anyway
    final bool shouldShowOverlay =
      showOverlay && timerState.timerStatus != TimerStatus.completed;
    return GestureDetector(
      onTap: () => _onOverlayTargetTapped(context),
      child: TimerRunningOverlay(
        isEnabled: shouldShowOverlay
      ),
    );
  }

}
