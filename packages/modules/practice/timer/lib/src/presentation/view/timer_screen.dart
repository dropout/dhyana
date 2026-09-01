import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'package:core/core.dart';
import 'package:timer/src/presentation/viewmodel/timer_cubit.dart';
import 'package:timer/src/presentation/view/timer/timer_running_cover.dart';
import 'package:timer/src/timer_module.dart';
import 'package:timer/src/presentation/view/timer/timer_running_view.dart';


class TimerScreen extends StatelessWidget {
  final TimerSettings timerSettings;

  const TimerScreen({required this.timerSettings, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerCubit>(
      create: (context) {
        final timerCubit = GetIt.instance.get<TimerCubit>(param1: timerSettings);
        timerCubit.start();
        return timerCubit;
      },
      child: buildScaffolding(context),
    );
  }

  Widget buildScaffolding(BuildContext context) {
    return BlocBuilder<TimerCubit, TimerStateEntity>(
      builder: (BuildContext context, TimerStateEntity timerState) {
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
    );
  }
}
