import 'package:audio_service/audio_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chanting_state.dart';

class PlaybackStateChangeUseCase with LoggerMixin {
  Future<ChantingState> execute(
    ChantingState currentState,
    PlaybackState newPlaybackState,
  ) async {
    // Update the elapsed session time based on the PlaybackState.updateTime
    // by comparing previous and current PlaybackState.updateTime
    // only when the audio is playing.
    var elapsedSessionTime = currentState.elapsedSessionTime;
    if (currentState.playbackState.playing == true &&
        newPlaybackState.playing == true) {
      final previousUpdateTime = currentState.playbackState.updateTime;
      final currentUpdateTime = newPlaybackState.updateTime;
      elapsedSessionTime += currentUpdateTime.difference(previousUpdateTime);
    }

    ChantingState updatedState = currentState.copyWith(
      playbackState: newPlaybackState,
      elapsedSessionTime: elapsedSessionTime,
    );

    if (newPlaybackState.processingState == AudioProcessingState.completed &&
        newPlaybackState.queueIndex ==
            currentState.chantingSettings.selectedChants.length - 1) {
      logger.t('Chanting session completed $newPlaybackState');
      updatedState = updatedState.copyWith(endTime: DateTime.now());
    } else if (newPlaybackState.processingState ==
        AudioProcessingState.completed) {
      logger.t('Track completed, moving to next track');
    }

    return updatedState;
  }
}
