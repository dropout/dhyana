part of 'chanting_cubit.dart';

@freezed
sealed class ChantingState with _$ChantingState {

  const ChantingState._();

  const factory ChantingState({

    // settings
    required ChantingSettings chantingSettings,
    
    // playback
    @Default(Duration.zero) Duration elapsedTime,
    @Default(false) bool isLoading,
    required PlaybackState playbackState,
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
