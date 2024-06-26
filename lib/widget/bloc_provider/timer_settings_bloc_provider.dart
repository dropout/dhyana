import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_bloc.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/timer_settings_shared_prefs_service.dart';

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
    CrashlyticsService crashlyticsService =
      Provider.of<CrashlyticsService>(context);
    return BlocProvider<TimerSettingsBloc>(
      create: (context) {
        TimerSettingsBloc timerSettingsBloc = TimerSettingsBloc(
          crashlyticsService: crashlyticsService,
          timerSettingsSharedPrefsService: TimerSettingsSharedPrefsService(
            sharedPrefs: SharedPreferences.getInstance(),
            crashlyticsService: crashlyticsService,
          )
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
