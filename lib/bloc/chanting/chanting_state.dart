part of 'chanting_cubit.dart';

@freezed
sealed class ChantingState with _$ChantingState {

  const ChantingState._();

  const factory ChantingState({
    required ChantingSettings chantingSettings,
    @Default(Duration.zero) Duration elapsedTime,
    @Default(0) int currentIndex,
    @Default(PlaybackState.stopped) PlaybackState playbackState,
    @Default(Duration.zero) Duration duration,
    @Default(Duration.zero) Duration position,
    @Default(0) activeLineIndex,
    LyricsDocument? lyricsDocument,     
  }) = _ChantingState;

}
