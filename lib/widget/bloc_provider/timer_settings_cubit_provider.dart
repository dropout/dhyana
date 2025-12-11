import 'package:dhyana/init/services.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/bloc/timer_settings/timer_settings_cubit.dart';

class TimerSettingsCubitProvider extends StatelessWidget {

  final Widget child;
  final Function(TimerSettingsCubit)? onCreate;

  const TimerSettingsCubitProvider({
    required this.child,
    this.onCreate,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Services services = context.services;
    return BlocProvider<TimerSettingsCubit>(
      create: (context) {
        final timerSettingsBloc = TimerSettingsCubit(
          crashlyticsService: services.crashlyticsService,
          timerSettingsSharedPrefsService: services.timerSettingsSharedPrefsService
        );
        onCreate?.call(timerSettingsBloc);
        return timerSettingsBloc;
      },
      child: child,
    );
  }

}
