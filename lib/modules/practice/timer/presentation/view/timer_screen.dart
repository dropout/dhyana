import 'package:dhyana/modules/practice/timer/domain/entity/timer_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/modules/practice/timer/presentation/viewmodel/timer/timer_cubit.dart';
import 'package:dhyana/modules/practice/timer/presentation/view/timer/timer_running_cover.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:dhyana/modules/practice/timer/timer_module.dart';
import 'package:dhyana/modules/practice/timer/presentation/view/timer/timer_running_view.dart';
import 'package:get_it/get_it.dart';

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
    return BlocBuilder<TimerCubit, TimerState>(
      builder: (BuildContext context, TimerState timerState) {
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
