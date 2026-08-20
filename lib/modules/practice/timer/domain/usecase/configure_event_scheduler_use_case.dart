import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings_entity.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/core/util/timer_event_scheduler.dart';

/// A use case that configures the event scheduler with the appropriate 
/// timer events based on the provided timer settings.
class ConfigureEventSchedulerUseCase with LoggerMixin {
  final TimerEventScheduler eventScheduler;

  ConfigureEventSchedulerUseCase({required this.eventScheduler});

  /// Configures the event scheduler with the appropriate timer
  /// events based on the provided [timerSettings].
  void execute({
    required TimerSettingsEntity timerSettings,
    required void Function(Duration) onWarmupCompleted,
    required void Function(Duration) onInterval,
    required void Function(Duration) onTimerCompleted,    
  }) {
    // Schedule the warmup completion event, if there is a warmup time
    if (timerSettings.hasWarmupTime) {
      eventScheduler.addListener(timerSettings.warmup, onWarmupCompleted);
    }
    logger.t('Event scheduler warmup complete @ ${timerSettings.warmup}');

    // Schedule timer interval events, if there are any intervals
    final sectionDuration = Duration(
      milliseconds:
          (timerSettings.duration.inMilliseconds /
                  (timerSettings.intervalCount + 1))
              .round(),
    );
    for (var i = 0; i < timerSettings.intervalCount; i++) {
      final intervalTime = timerSettings.warmup + (sectionDuration * (i + 1));
      eventScheduler.addListener(
        intervalTime,
        onInterval,
      );
      logger.t('Event scheduler interval @ $intervalTime');
    }

    // Schedule the timer completion event
    eventScheduler.addListener(timerSettings.totalTime, onTimerCompleted);
    logger.t(
      'Event scheduler total time complete @ ${timerSettings.totalTime}',
    );
  }
  
}
