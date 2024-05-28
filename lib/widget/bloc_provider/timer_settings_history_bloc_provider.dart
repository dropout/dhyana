import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class TimerSettingsHistoryBlocProvider extends StatelessWidget {

  final Widget child;
  final TimerSettingsHistoryEvent? initialEvent;

  const TimerSettingsHistoryBlocProvider({
    required this.child,
    this.initialEvent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    CrashlyticsService crashlyticsService =
      Provider.of<CrashlyticsService>(context);
    TimerSettingsHistoryRepository timerSettingsHistoryRepository =
      Provider.of<TimerSettingsHistoryRepository>(context);
    return BlocProvider<TimerSettingsHistoryBloc>(
      create: (context) {
        TimerSettingsHistoryBloc timerSettingsHistoryBloc = TimerSettingsHistoryBloc(
          timerSettingsHistoryRepository: timerSettingsHistoryRepository,
          crashlyticsService: crashlyticsService
        );
        if (initialEvent != null) {
          timerSettingsHistoryBloc.add(initialEvent!);
        }
        return timerSettingsHistoryBloc;
      }
    );
  }
}
