import 'package:dhyana/bloc/presence/presence_bloc.dart';
import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/bloc/timer/timer_bloc.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/default_audio_service.dart';
import 'package:dhyana/service/default_timer_service.dart';
import 'package:dhyana/service/timer_service_factory.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/signed_in.dart';
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
    return SignedIn(
      yes: (context, user) {
        return buildBlocProviders(context, onTimerCompleted: (timerState) {
          ProfileBloc profileBloc = ProfileBloc(
            profileRepository: repos.profileRepository,
            statisticsRepository: repos.statisticsRepository,
            crashlyticsService: services.crashlyticsService
          );
          profileBloc.add(ProfileEvent.logSession(
            profileId: user.uid,
            startTime: timerState.startTime ?? DateTime.now().subtract(timerState.timerSettings.duration),
            endTime: timerState.endTime ?? DateTime.now(),
            duration: timerState.timerSettings.duration,
            timerSettings: timerSettings
          ));
        });
      },
      no: buildBlocProviders(context),
    );
  }

  Widget buildBlocProviders(BuildContext context, {
    Function(TimerState timerState)? onTimerCompleted,
  }) {
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
                  onComplete: (TimerState state) async {
                    onTimerCompleted?.call(state);
                  }
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
