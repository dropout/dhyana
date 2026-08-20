import 'package:clock/clock.dart';
import 'package:dhyana/core/service/id_generator_service.dart';
import 'package:dhyana/core/util/timer_event_scheduler.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_state_entity.dart';
import 'package:dhyana/modules/practice/timer/domain/service/timer_audio_service.dart';


/// A use case that handles the completion of a timer session.
class CompleteTimerUseCase with LoggerMixin {

  /// The service responsible for managing audio playback during the timer session.
  final TimerAudioService timerAudioService;

  /// The scheduler responsible for managing timer events during the session.
  final TimerEventScheduler eventScheduler;

  /// The service responsible for generating unique identifiers for sessions.
  final IdGeneratorService idGeneratorService;

  CompleteTimerUseCase({
    required this.timerAudioService,
    required this.eventScheduler,
    required this.idGeneratorService,
  });

  Future<({SessionEntity session, TimerStateEntity timerState})> execute(TimerStateEntity state, Duration elapsedTime) async {
    // Play ending sound
    // Only stop 'background' player after the ending sound is played,
    // to ensure the ending sound is not cut off while in background, 
    // so that the 'audio' player
    // can keep playing until the ending sound without being cut off.
    final r = timerAudioService.playSound(state.timerSettings.endingSound);  
    r.then((_) => timerAudioService.stop());

    // Stop the event scheduler
    eventScheduler.stop();

    // Assemble the session data to be saved
    SessionEntity session = SessionEntity(
      id: idGeneratorService.sessionId(),
      type: .sitting,
      startTime:
          state.startTime ??
          DateTime.now().subtract(state.elapsedTime),
      endTime: state.endTime ?? DateTime.now(),
      duration: state.elapsedTime,
    );

    logger.t('Timer session completed - ${clock.now()}');
    return (
      session: session, 
      timerState: state.copyWith(
        timerStatus: .completed,
        timerStage: .timer,
        endTime: clock.now(),
      )
    );
  }
}
