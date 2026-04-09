import 'package:dhyana/bloc/simple_timer/cubit/timer_cubit.dart';
import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/bloc_provider/timer_bloc_providers.dart';
import 'package:dhyana/widget/timer/running/timer_running_cover.dart';
import 'package:dhyana/widget/util/app_context.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/widget/timer/timer_running_view.dart';

class TimerScreen extends StatelessWidget {

  final TimerSettings timerSettings;

  const TimerScreen({
    required this.timerSettings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TimerBlocProviders(
      timerSettings: timerSettings,
      child: buildScaffolding(context),
    );
  }

  Widget buildScaffolding(BuildContext context) {
    return BlocConsumer<TimerCubit, TimerCubitState>(
      builder: (BuildContext context, TimerCubitState timerState) {
        return Scaffold(
          backgroundColor: Colors.black,
          extendBodyBehindAppBar: true,
          body: TimerRunningCover(
            child: TimerRunningView(
              timerState: timerState,
              wakelockService: context.services.wakelockService,
            ),
          ),
        );
      },
      listenWhen: (TimerCubitState prevState, TimerCubitState currentState) {
        return prevState.timerStatus != TimerStatus.completed
          && currentState.timerStatus == TimerStatus.completed;
      },
      listener: (BuildContext context, TimerCubitState timerState) {
        Session session = Session(          
          id: context.services.idGeneratorService.sessionId(),
          type: SessionType.timer,
          timerSettings: timerSettings,
          startTime: timerState.startTime ?? DateTime.now().subtract(timerState.elapsedTime),
          endTime: timerState.endTime ?? DateTime.now(),
          duration: timerState.elapsedTime,
        );
        SessionCompletedRoute($extra: session).replace(context);
      },

    );

  }

}
