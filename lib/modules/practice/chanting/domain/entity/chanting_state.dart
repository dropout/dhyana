import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dhyana/core/domain/entity/chant/chanting_settings.dart';
import 'package:dhyana/core/domain/enum/loading_state.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/caching_progress.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_local_resources.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/lyrics_document.dart';


part 'chanting_state.freezed.dart';

@freezed
sealed class ChantingState with _$ChantingState {

  const ChantingState._();

  const factory ChantingState({

    // settings
    required ChantingSettings chantingSettings,

    // loading    
    @Default(CachingProgress()) CachingProgress cachingProgress,
    
    // playback
    @Default([]) List<ChantLocalResources> chantResources,
    required PlaybackState playbackState,
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
    @Default(Duration.zero) Duration elapsedSessionTime,

  }) = _ChantingState;

  int get currentIndex => playbackState.queueIndex ?? 0;
  Duration get position => playbackState.position;
  Duration get latencyCompensatedPosition => position - outputLatency;
  Duration get duration => mediaItem?.duration ?? Duration.zero;

}
