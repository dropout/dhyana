import 'package:clock/clock.dart';
import 'package:dhyana/core/data/datasource/auth/model/user.dart';
import 'package:dhyana/core/domain/entity/presence/presence.dart';
import 'package:dhyana/core/domain/entity/presence/public_profile.dart';
import 'package:dhyana/core/domain/repository/auth_repository.dart';
import 'package:dhyana/core/domain/repository/presence_repository.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_state.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_stage.dart';
import 'package:dhyana/modules/practice/timer/domain/repository/timer_settings_history_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_audio_service.dart';

import 'package:dhyana/util/logger_mixin.dart';
import 'package:dhyana/util/timer_event_scheduler.dart';

/// A use case that starts the timer, initializes the timer audio service,
/// and shows the user's presence if authenticated.
class StartTimerUseCase with LoggerMixin {
  /// Used to check if the user is authenticated and to get the user's
  /// profile ID for presence tracking.
  final AuthRepository authRepository;

  /// Used to get the user's profile for presence tracking.
  final ProfileRepository profileRepository;

  /// Used to start the timer audio service and play sounds.
  final TimerAudioService timerAudioService;

  /// Used to schedule timer events such as warmup completion and interval events.
  final TimerEventScheduler eventScheduler;

  /// Used to save the current timer settings to the history when the timer starts.
  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;

  /// Used to show the user's presence when the timer starts.
  final PresenceRepository presenceRepository;

  /// Used to log errors and exceptions that occur during the execution of this use case.
  final CrashlyticsService crashlyticsService;

  StartTimerUseCase({
    required this.authRepository,
    required this.profileRepository,
    required this.timerAudioService,
    required this.eventScheduler,
    required this.timerSettingsHistoryRepository,
    required this.presenceRepository,
    required this.crashlyticsService,
  });

  Future<TimerState> execute(TimerState state) async {
    logger.t('Starting timer - ${clock.now()}');
    final startFuture = timerAudioService.start(state.timerSettings);

    // Reset the event scheduler and configure it with the provided callbacks
    eventScheduler.reset();

    // Determine he initial stage of the timer based on whether there is a warmup time
    TimerStage initialStage = state.timerSettings.hasWarmupTime
        ? TimerStage.warmup
        : TimerStage.timer;

    // Play starting sound immediately if there is no warmup time
    // otherwise, it will be played when the warmup is completed
    if (initialStage == .timer) {
      timerAudioService.playSound(state.timerSettings.startingSound);
    }

    // Start the event scheduler
    eventScheduler.start();

    // Wait for the audio service to finish setting up the timer session
    await startFuture;

    // Execute additional tasks such as showing presence and 
    // recording timer settings history
    _executeAdditionalTasks();

    logger.t('Timer session is ready and started - ${clock.now()}');
    return state.copyWith(
      startTime: clock.now(),
      timerStatus: .running,
      timerStage: initialStage,
    );
  }

  /// Checks if the user is authenticated, reads the user's profile, 
  /// and does the following:
  /// - Records the current timer settings to the history.
  /// - Shows the user's presence if the user has enabled the presence feature.
  Future<void> _executeAdditionalTasks(TimerSettings timerSettings) async {
    try {
      User? user = await authRepository.authStateChange.first;
      if (user == null) {
        logger.t('User is not authenticated, skipping presence, history}');
        return;
      }
      final profile = await profileRepository.readStream(user.uid).first;

      logger.t('Recording timer settings history');
      timerSettingsHistoryRepository.recordTimerSettingsHistory(
        profile.id,
        timerSettings,
      );

      if (profile.settings.usePresenceFeature == false) {
        logger.t('User has disabled presence feature, skipping showing presence');
        return;
      }

      logger.t('Showing presence}');
      final publicProfile = PublicProfile.fromProfile(profile: profile);
      await presenceRepository.showPresence(
        Presence(
          id: publicProfile.id,
          profile: publicProfile,
          location: publicProfile.location,
          startedAt: clock.now(),
        ),
      );
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to show presence',
      );      
    }
    
  }
}
