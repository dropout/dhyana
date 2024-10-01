import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/bloc/sessions/sessions_bloc.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/default_audio_service.dart';
import 'package:dhyana/service/default_timer_service.dart';
import 'package:dhyana/service/timer_service_factory.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerRunningBlocProvider extends StatelessWidget {

  final TimerSettings timerSettings;
  final Widget child;

  const TimerRunningBlocProvider({
    required this.timerSettings,
    required this.child,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    Services services = context.services;
    Repositories repos = context.repos;
    return MultiBlocProvider(
      providers: [
        BlocProvider<TimerBloc>(
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
        ),
        BlocProvider<PresenceBloc>(
          create: (_) {
            return PresenceBloc(
              presenceRepository: repos.presenceRepository,
              authRepository: repos.authRepository,
              profileRepository: repos.profileRepository,
              crashlyticsService: services.crashlyticsService,
            );
          },
          lazy: false,
        ),
      ],
      child: child
    );
  }

}
