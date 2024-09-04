import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/default_audio_service.dart';
import 'package:dhyana/service/default_timer_service.dart';
import 'package:dhyana/service/timer_service_factory.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBlocProvider extends StatelessWidget {

  final TimerSettings timerSettings;
  final Widget child;

  const TimerBlocProvider({
    required this.timerSettings,
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Services services = context.services;
    return BlocProvider(
      create: (_) {
        return TimerBloc(
          timerSettings: timerSettings,
          timerServiceFactory: TimerServiceFactory<DefaultTimerService>(
            DefaultTimerService.new
          ),
          audioService: DefaultAudioService(),
          crashlyticsService: services.crashlyticsService,
        );
      },
      lazy: false,
      child: child,
    );
  }

}
