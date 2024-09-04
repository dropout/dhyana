import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_bloc.dart';

class TimerSettingsBlocProvider extends StatelessWidget {

  final Widget child;
  final TimerSettingsEvent? onCreateEvent;

  const TimerSettingsBlocProvider({
    required this.child,
    this.onCreateEvent,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Services services = context.services;
    return BlocProvider<TimerSettingsBloc>(
      create: (context) {
        TimerSettingsBloc timerSettingsBloc = TimerSettingsBloc(
          crashlyticsService: services.crashlyticsService,
          timerSettingsSharedPrefsService: services.timerSettingsSharedPrefsService
        );
        if (onCreateEvent != null) {
          timerSettingsBloc.add(onCreateEvent!);
        }
        return timerSettingsBloc;
      },
      child: child,
    );
  }

}
