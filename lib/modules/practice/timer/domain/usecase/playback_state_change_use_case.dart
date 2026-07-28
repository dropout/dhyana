import 'package:audio_service/audio_service.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_state.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_stage.dart';
import 'package:dhyana/modules/practice/timer/domain/enum/timer_status.dart';
import 'package:dhyana/modules/practice/timer/domain/entity/timer_settings.dart';

class PlaybackStateChangeUseCase {

  TimerState execute(PlaybackState playbackState, TimerState state, TimerSettings timerSettings) {
    final position = playbackState.position;

    // This is important so that on starting, there won't be a
    // brief flash of the paused state before the timer starts running
    late final TimerStatus timerStatus;
    if (playbackState.processingState == AudioProcessingState.idle) {
      timerStatus = TimerStatus.idle;
    } else {
      timerStatus = playbackState.playing
          ? TimerStatus.running
          : TimerStatus.paused;
    }

    return state.copyWith(
      timerStatus: timerStatus,
      elapsedWarmupTime: position >= state.timerSettings.warmup
          ? state.timerSettings.warmup
          : position,
      elapsedTime: state.timerStage == TimerStage.warmup
          ? Duration.zero
          : position - state.timerSettings.warmup,
    );
  }


}