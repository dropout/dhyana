import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/bloc_provider/all.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/overlay_toggle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
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

  @override
  Widget build(BuildContext context) {
    return TimerBlocProviders(
      timerSettings: widget.timerSettings,
      child: buildScaffolding(context),
    );
  }

  Widget buildScaffolding(BuildContext context) {
    return BlocConsumer<TimerBloc, TimerState>(
      builder: (BuildContext context, TimerState timerState) {
        return Scaffold(
          backgroundColor: Colors.black,
          extendBodyBehindAppBar: true,
          body: OverlayToggle(
            child: TimerRunningView(
              timerState: timerState,
            ),
          ),
        );
      },
      listenWhen: (TimerState prevState, TimerState currentState) {
        return prevState.timerStatus != TimerStatus.completed
          && currentState.timerStatus == TimerStatus.completed;
      },
      listener: (BuildContext context, TimerState timerState) {
        Session session = Session(
          id: context.services.idGeneratorService.sessionId(),
          timerSettings: widget.timerSettings,
          startTime: timerState.startTime ?? DateTime.now().subtract(timerState.elapsedTime),
          endTime: timerState.endTime ?? DateTime.now(),
          duration: timerState.elapsedTime,
        );
        SessionCompletedRoute($extra: session).replace(context);
      },

    );

  }



}
