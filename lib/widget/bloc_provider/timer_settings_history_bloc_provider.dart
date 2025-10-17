import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/widget/util/all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerSettingsHistoryBlocProvider extends StatelessWidget {

  final TimerSettingsHistoryEvent? onCreateEvent;
  final Widget? child;

  const TimerSettingsHistoryBlocProvider({
    this.child,
    this.onCreateEvent,
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
        if (onCreateEvent != null) {
          timerSettingsHistoryBloc.add(onCreateEvent!);
        }
        return timerSettingsHistoryBloc;
      },
      child: child,
    );
  }
}
