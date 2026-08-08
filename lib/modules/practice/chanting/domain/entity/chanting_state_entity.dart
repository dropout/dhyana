import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:dhyana/core/domain/enum/loading_state.dart';
import 'package:dhyana/modules/practice/chanting/chanting_module.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/caching_progress_entity.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_local_resources_entity.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/lyrics_document_entity.dart';


part 'chanting_state_entity.freezed.dart';

@freezed
sealed class ChantingStateEntity with _$ChantingStateEntity {

  const ChantingStateEntity._();

  const factory ChantingStateEntity({

    // settings
    required ChantingSettings chantingSettings,

    // loading    
    @Default(CachingProgressEntity()) CachingProgressEntity cachingProgress,
    
    // playback
    @Default([]) List<ChantLocalResourcesEntity> chantResources,
    required PlaybackState playbackState,
    @Default(Duration.zero) Duration elapsedTime,
    @Default(LoadingState.loading) LoadingState loadingState,  
    MediaItem? mediaItem,
    @Default(Duration.zero) Duration outputLatency,
    
    // lyrics
    @Default(0) int activeLineIndex,
    @Default(LoadingState.loading) LoadingState lyricsLoadingState,
    LyricsDocumentEntity? lyricsDocument,
    
    // session data
    DateTime? startTime,
    DateTime? endTime,
    @Default(Duration.zero) Duration elapsedSessionTime,

  }) = _ChantingStateEntity;

  int get currentIndex => playbackState.queueIndex ?? 0;
  Duration get position => playbackState.position;
  Duration get latencyCompensatedPosition => position - outputLatency;
  Duration get duration => mediaItem?.duration ?? Duration.zero;

}
