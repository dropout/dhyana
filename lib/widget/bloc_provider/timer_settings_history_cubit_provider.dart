import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSettingsHistoryCubitProvider extends StatelessWidget {

  final Widget? child;
  final Function(TimerSettingsHistoryCubit)? onCreate;

  const TimerSettingsHistoryCubitProvider({
    this.child,
    this.onCreate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerSettingsHistoryCubit>(
      create: (_) {
        final timerSettingsHistoryCubit = TimerSettingsHistoryCubit(
          timerSettingsHistoryRepository: context.repos.timerSettingsHistoryRepository,
          crashlyticsService: context.services.crashlyticsService
        );
        onCreate?.call(timerSettingsHistoryCubit);
        return timerSettingsHistoryCubit;
      },
      child: child,
    );
  }
}
