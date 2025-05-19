import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_bloc.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/default_audio_service.dart';
import 'package:dhyana/service/default_timer_service.dart';
import 'package:dhyana/service/timer_service_factory.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerBlocProviders extends StatelessWidget {

  final Widget child;
  final TimerSettings timerSettings;

  const TimerBlocProviders({
    required this.child,
    required this.timerSettings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Services services = context.services;
    Repositories repos = context.repos;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState authState) {
        final bool isSignedIn = (authState is AuthStateSignedIn);
        final String? profileId = (isSignedIn) ? authState.user.uid : null;

        return MultiBlocProvider(
          providers: [
            BlocProvider<TimerBloc>(
              create: (BuildContext context) {
                final TimerBloc timerBloc = TimerBloc(
                  timerSettings: timerSettings.copyWith(
                    duration: Duration(seconds: 3),
                  ),
                  timerServiceFactory: TimerServiceFactory<DefaultTimerService>(
                      DefaultTimerService.new
                  ),
                  audioService: DefaultAudioService(),
                  crashlyticsService: services.crashlyticsService,
                );

                // Start the timer
                timerBloc.add(TimerEvent.started(
                  startTime: DateTime.now(),
                ));
                return timerBloc;
              },
              lazy: false,
            ),
            BlocProvider<PresenceBloc>(
              create: (_) {
                final PresenceBloc presenceBloc = PresenceBloc(
                  presenceRepository: repos.presenceRepository,
                  profileRepository: repos.profileRepository,
                  crashlyticsService: services.crashlyticsService,
                );

                // Show the presence if user is signed in
                if (isSignedIn) {
                  presenceBloc.add(
                    PresenceEvent.showPresence(profileId: profileId!)
                  );
                }

                return presenceBloc;
              },
              lazy: false,
            ),

            BlocProvider<TimerSettingsHistoryBloc>(
              create: (_) {
                final TimerSettingsHistoryBloc timerSettingsHistoryBloc =
                  TimerSettingsHistoryBloc(
                    timerSettingsHistoryRepository: repos.timerSettingsHistoryRepository,
                    crashlyticsService: services.crashlyticsService
                  );

                if (isSignedIn) {
                  timerSettingsHistoryBloc.add(TimerSettingsHistoryEvent.saveSettings(
                    profileId: profileId!,
                    timerSettings: timerSettings
                  ));
                }
                return timerSettingsHistoryBloc;
              },
              lazy: false,
            ),

          ],
          child: _TimerCompletedListener(child: child),
        );
      },
    );
  }

}

class _TimerCompletedListener extends StatelessWidget {

  final Widget child;

  const _TimerCompletedListener({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (_, ProfileState profileState) {
        return BlocListener<TimerBloc, TimerState>(
          listener: (BuildContext context, TimerState timerState) {
            if (profileState is ProfileLoadedState) {
              BlocProvider.of<PresenceBloc>(context).add(
                PresenceEvent.load(ownProfileId: profileState.profile.id)
              );
            }
          },
          listenWhen: (TimerState prevState, TimerState currentState) {
            return prevState.timerStatus != TimerStatus.completed
              && currentState.timerStatus == TimerStatus.completed;
          },
          child: child,
        );
      },
    );
  }

}
