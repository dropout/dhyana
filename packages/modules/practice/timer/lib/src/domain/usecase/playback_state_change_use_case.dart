import 'package:timer/src/domain/entity/playback_state_entity.dart';
import 'package:timer/src/domain/entity/timer_state_entity.dart';
import 'package:timer/src/domain/enum/playback_status.dart';
import 'package:timer/src/domain/enum/timer_stage.dart';
import 'package:timer/src/domain/enum/timer_status.dart';

/// A use case that handles changes in the playback state of the audio 
/// service and updates the timer state accordingly.
class PlaybackStateChangeUseCase {

  TimerStateEntity execute(PlaybackStateEntity playbackState, TimerStateEntity state) {
    final position = playbackState.position;

    // This is important so that on starting, there won't be a
    // brief flash of the paused state before the timer starts running
    final TimerStatus timerStatus = switch (playbackState.status) {
      PlaybackStatus.idle => TimerStatus.idle,
      PlaybackStatus.playing => TimerStatus.running,
      PlaybackStatus.paused => TimerStatus.paused,
    };

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