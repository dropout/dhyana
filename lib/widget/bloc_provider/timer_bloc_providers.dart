import 'package:dhyana/bloc/all.dart';
import 'package:dhyana/model/timer_settings.dart';
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
    final services = context.services;
    final repos = context.repos;
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (BuildContext context, AuthState authState) {
        final bool isSignedIn = (authState is AuthStateSignedIn);
        final String? profileId = (isSignedIn) ? authState.user.uid : null;

        return MultiBlocProvider(
          providers: [

            BlocProvider<TimerBloc>(
              create: (BuildContext context) {

                // Create the timer bloc with the provided timer settings
                final TimerBloc timerBloc = TimerBloc(
                  // timerSettings: timerSettings,
                  timerSettings: timerSettings.copyWith(
                    duration: Duration(seconds: 3),
                  ),
                  timerServiceFactory: TimerServiceFactory<DefaultTimerService>(
                    DefaultTimerService.new
                  ),
                  audioService: services.audioService,
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

                // Create the presence bloc
                final PresenceBloc presenceBloc = PresenceBloc(
                  presenceRepository: repos.presenceRepository,
                  profileRepository: repos.profileRepository,
                  crashlyticsService: services.crashlyticsService,
                );

                // Show the presence if user is signed in
                if (isSignedIn && profileId != null) {
                  presenceBloc.add(
                    PresenceEvent.showPresence(profileId: profileId)
                  );
                }

                return presenceBloc;
              },
              lazy: false,
            ),

            BlocProvider<TimerSettingsHistoryBloc>(
              create: (_) {

                // Create the timer settings history bloc
                final TimerSettingsHistoryBloc timerSettingsHistoryBloc =
                  TimerSettingsHistoryBloc(
                    timerSettingsHistoryRepository: repos.timerSettingsHistoryRepository,
                    crashlyticsService: services.crashlyticsService
                  );

                // Save the timer settings if user is signed in
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
          child: child,
        );
      },
    );
  }

}
