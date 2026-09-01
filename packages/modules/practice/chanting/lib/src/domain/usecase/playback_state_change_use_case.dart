import 'package:audio_service/audio_service.dart';
import 'package:core/core.dart';
import 'package:chanting/src/domain/entity/chanting_state_entity.dart';

class PlaybackStateChangeUseCase with LoggerMixin {
  Future<ChantingStateEntity> execute(
    ChantingStateEntity currentState,
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

    ChantingStateEntity updatedState = currentState.copyWith(
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
