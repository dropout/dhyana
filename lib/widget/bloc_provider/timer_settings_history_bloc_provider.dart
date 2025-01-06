import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSettingsHistoryBlocProvider extends StatelessWidget {

  final TimerSettingsHistoryEvent? initialEvent;
  final Widget? child;

  const TimerSettingsHistoryBlocProvider({
    this.child,
    this.initialEvent,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TimerSettingsHistoryBloc>(
      create: (_) {
        final TimerSettingsHistoryBloc timerSettingsHistoryBloc = TimerSettingsHistoryBloc(
          timerSettingsHistoryRepository: context.repos.timerSettingsHistoryRepository,
          crashlyticsService: context.services.crashlyticsService
        );
        if (initialEvent != null) {
          timerSettingsHistoryBloc.add(initialEvent!);
        }
        return timerSettingsHistoryBloc;
      },
      child: child,
    );
  }
}
