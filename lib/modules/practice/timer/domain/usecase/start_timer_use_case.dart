import 'package:clock/clock.dart';

import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/core/util/timer_event_scheduler.dart';
import 'package:dhyana/modules/practice/timer/timer_module.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_state_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_stage.dart';
import 'package:dhyana/modules/practice/timer/domain/repository/timer_settings_history_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_audio_service.dart';

import 'package:dhyana/modules/auth/public/api/auth_public_api.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:dhyana/modules/social/public/api/social_public_api.dart';


/// A use case that starts the timer:
/// - 1. Setup the timer audio service and play the starting sound.
/// - 2. Setup the timer event scheduler and schedule the timer events.,
class StartTimerUseCase with LoggerMixin {

  /// Used to check if the user is authenticated and get the user's ID.
  final AuthPublicApi authPublicApi;

  /// Used to read the user's profile and get the user's settings.
  final ProfilePublicApi profilePublicApi;

  /// Used to show the user's presence when the timer starts.
  final SocialPublicApi socialPublicApi;

  /// Used to start the timer audio service and play sounds.
  final TimerAudioService timerAudioService;

  /// Used to schedule timer events such as warmup completion and interval events.
  final TimerEventScheduler eventScheduler;

  /// Used to save the current timer settings to the history when the timer starts.
  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;

  /// Used to log errors and exceptions that occur during the execution of this use case.
  final CrashlyticsService crashlyticsService;

  StartTimerUseCase({
    required this.authPublicApi,
    required this.profilePublicApi,
    required this.socialPublicApi,
    required this.timerAudioService,
    required this.eventScheduler,
    required this.timerSettingsHistoryRepository,
    required this.crashlyticsService,
  });

  Future<TimerStateEntity> execute(TimerStateEntity state) async {
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
    _executeAdditionalTasks(state.timerSettings);

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
  /// Move to a business logic service if used in multiple use cases?
  Future<void> _executeAdditionalTasks(TimerSettings timerSettings) async {
    try {
      final authData = await authPublicApi.authSessionStream.first;
      if (!authData.isAuthenticated) {
        logger.t('User is not authenticated, skipping presence, history');
        return;
      }

      if (authData.userId == null) {
        logger.t('User is authenticated but userId is null, skipping presence, history');
        return;
      }

      final profileId = authData.userId!;
      final profile = await profilePublicApi.getProfile(profileId, preferCache: true);

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
      await socialPublicApi.showPresence(
        profileId: profile.id,
        firstName: profile.firstName,
        lastName: profile.lastName,
        photoBlurhash: profile.photoBlurhash,
        location: profile.location,
        startedAt: clock.now(),
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
