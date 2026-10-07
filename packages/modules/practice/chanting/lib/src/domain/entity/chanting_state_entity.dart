import 'package:audio_service/audio_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core/core.dart';
import 'package:chanting/src/chanting_module.dart';
import 'package:chanting/src/domain/entity/caching_progress_entity.dart';
import 'package:chanting/src/domain/entity/chant_local_resources_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_document_entity.dart';


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
    @Default(ProcessingState.processing) ProcessingState loadingState,  
    MediaItem? mediaItem,
    @Default(Duration.zero) Duration outputLatency,
    
    // lyrics
    @Default(0) int activeLineIndex,
    @Default(ProcessingState.processing) ProcessingState lyricsLoadingState,
    LyricsDocumentEntity? lyricsDocument,
    
    // session data
    DateTime? startTime,
    DateTime? endTime,
    @Default(Duration.zero) Duration elapsedSessionTime,

  }) = _ChantingStateEntity;

  int get currentIndex => playbackState.queueIndex ?? 0;
  Duration get position => playbackState.position + Duration(milliseconds: 250);
  Duration get latencyCompensatedPosition {
    final compensated = position - outputLatency;
    return compensated.isNegative ? Duration.zero : compensated;
  }
  Duration get currentTrackDuration => mediaItem?.duration ?? Duration.zero;
  Duration get sessionDuration => chantingSettings.selectedChants.fold(Duration.zero, (total, chant) => total + chant.duration);

}
