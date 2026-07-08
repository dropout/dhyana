part of 'chanting_cubit.dart';

enum LoadingState {
  loading,
  loaded,
  error,
}

// TODO: Cleanup to remove redundancy with [CachingProgress] and [ChantLoadingProgress]
@freezed
sealed class ChantLoadingProgress with _$ChantLoadingProgress {
  const ChantLoadingProgress._();

  const factory ChantLoadingProgress({
    @Default(0) int targetChants,
    @Default(0) int completedChants,
    @Default(0.0) double progress,    
  }) = _ChantLoadingProgress;

}



@freezed
sealed class ChantingState with _$ChantingState {

  const ChantingState._();

  const factory ChantingState({

    // settings
    required ChantingSettings chantingSettings,

    // loading
    required PlaybackState playbackState,
    @Default(ChantLoadingProgress()) ChantLoadingProgress loadingProgress,
    
    // playback
    @Default(Duration.zero) Duration elapsedTime,
    @Default(LoadingState.loading) LoadingState loadingState,  
    MediaItem? mediaItem,
    @Default(Duration.zero) Duration outputLatency,
    
    // lyrics
    @Default(0) int activeLineIndex,
    @Default(LoadingState.loading) LoadingState lyricsLoadingState,
    LyricsDocument? lyricsDocument,
    
    // session data
    DateTime? startTime,
    DateTime? endTime,

  }) = _ChantingState;

  int get currentIndex => playbackState.queueIndex ?? 0;
  Duration get position => playbackState.position;
  Duration get latencyCompensatedPosition => position - outputLatency;
  Duration get duration => mediaItem?.duration ?? Duration.zero;

}
