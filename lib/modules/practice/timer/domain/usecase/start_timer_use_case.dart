import 'package:clock/clock.dart';
import 'package:dhyana/core/data/datasource/auth/model/user.dart';
import 'package:dhyana/core/domain/entity/presence/presence.dart';
import 'package:dhyana/core/domain/repository/auth_repository.dart';
import 'package:dhyana/core/domain/repository/presence_repository.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_stage.dart';
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

  /// Used to show the user's presence when the timer starts.
  final PresenceRepository presenceRepository;

  StartTimerUseCase({
    required this.authRepository,
    required this.profileRepository,
    required this.timerAudioService,
    required this.eventScheduler,
    required this.presenceRepository,
  });

  Future<void> execute({
    required TimerSettings timerSettings,
    required void Function(Duration) onWarmupCompleted,
    required void Function(Duration) onInterval,
    required void Function(Duration) onTimerCompleted,
  }) async {
    logger.t('Starting timer - ${clock.now()}');
    final startFuture = timerAudioService.start(timerSettings);

    // Reset the event scheduler and configure it with the provided callbacks
    eventScheduler.reset();
    _configureEventScheduler(
      timerSettings: timerSettings,
      onWarmupCompleted: onWarmupCompleted,
      onInterval: onInterval,
      onTimerCompleted: onTimerCompleted,
    );

    TimerStage initialStage = timerSettings.hasWarmupTime
      ? TimerStage.warmup
      : TimerStage.timer;

    // Play starting sound immediately if there is no warmup time
    // otherwise, it will be played when the warmup is completed
    Future playSoundFuture = Future.value(null);
    if (initialStage == .timer) {
      playSoundFuture = timerAudioService.playSound(
        timerSettings.startingSound,
      );
    }

    // Start the event scheduler
    eventScheduler.start();

    // Wait for the audio service to finish setting up the timer session
    await startFuture;
    logger.t('Timer session is ready and started - ${clock.now()}');

    // TODO: Show presence if the user is authenticated
    // User? user = await authRepository.authStateChange.first;

    // if (user != null) {
    //   await presenceRepository.showPresence(
    //     Presence(

    //     );
    //   );
    // }

    // Return the play sound future so that the caller can await it if needed
    return playSoundFuture;
  }

  /// Configures the event scheduler with the appropriate timer 
  /// events based on the provided [timerSettings]. 
  void _configureEventScheduler({
    required TimerSettings timerSettings,
    required void Function(Duration) onWarmupCompleted,
    required void Function(Duration) onInterval,
    required void Function(Duration) onTimerCompleted,
  }) {

  }
}
