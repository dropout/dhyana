import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/presence/presence_cubit.dart';
import 'package:dhyana/bloc/timer/timer_cubit.dart';
import 'package:dhyana/bloc/timer_settings_history/timer_settings_history_cubit.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/service/timer_audio_service.dart';
import 'package:dhyana/util/timer_event_scheduler.dart';
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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (BuildContext context, AuthState authState) {
        final bool isSignedIn = (authState is AuthStateSignedIn);
        final String? profileId = (isSignedIn) ? authState.user.uid : null;

        return MultiBlocProvider(
          providers: [

            BlocProvider<TimerCubit>(
              create: (context) {
                final timerCubit = TimerCubit(
                  timerSettings: timerSettings,
                  audioService: TimerAudioService(services.audioHandler),
                  eventScheduler: TimerEventScheduler(
                    source: TimerAudioServiceElapsedTimeSource(
                      TimerAudioService(services.audioHandler),
                    ),
                  ),
                  crashlyticsService: services.crashlyticsService,
                );

                timerCubit.start();

                return timerCubit;
              },
              lazy: false,                         
            ),

            BlocProvider<PresenceCubit>(
              create: (_) {

                // Create the presence bloc
                final presenceBloc = PresenceCubit(
                  presenceRepository: repos.presenceRepository,
                  profileRepository: repos.profileRepository,
                  crashlyticsService: services.crashlyticsService,
                );

                // Show the presence if user is signed in
                if (isSignedIn && profileId != null) {
                  presenceBloc.showPresence(profileId);
                }

                return presenceBloc;
              },
              lazy: false,
            ),

            BlocProvider<TimerSettingsHistoryCubit>(
              create: (_) {

                // Create the timer settings history bloc
                final timerSettingsHistoryCubit =
                  TimerSettingsHistoryCubit(
                    timerSettingsHistoryRepository: repos.timerSettingsHistoryRepository,
                    timerSettingsSharedPrefsService: services.timerSettingsSharedPrefsService,
                    crashlyticsService: services.crashlyticsService
                  );

                // Save the timer settings if user is signed in
                if (isSignedIn) {

                  timerSettingsHistoryCubit.saveSettings(
                    profileId!, timerSettings
                  );
                }
                return timerSettingsHistoryCubit;
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
