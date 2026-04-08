part of 'chanting_cubit.dart';

@freezed
sealed class ChantingState with _$ChantingState {

  const ChantingState._();

  const factory ChantingState({

    // settings
    required ChantingSettings chantingSettings,
    
    // playback
    @Default(Duration.zero) Duration elapsedTime,
    @Default(0) int currentIndex,
    @Default(false) bool isLoading,
    @Default(AudioPlaybackState.stopped) AudioPlaybackState playbackState,
    @Default(Duration.zero) Duration duration,
    @Default(Duration.zero) Duration position,
    
    // lyrics
    @Default(0) activeLineIndex,
    LyricsDocument? lyricsDocument,
    
    // session data
    DateTime? startTime,
    DateTime? endTime,  

    // gap
    @Default(Duration.zero) Duration gapRemaining,

  }) = _ChantingState;

  bool get isGapActive => gapRemaining != Duration.zero;
  int get remainingSeconds => isGapActive ? min(gapRemaining.inSeconds + 1, chantingSettings.gapLength.inSeconds) : 0;

}
