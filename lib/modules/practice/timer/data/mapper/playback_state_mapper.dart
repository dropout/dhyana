import 'package:audio_service/audio_service.dart' as audio_service;
import 'package:dhyana/modules/practice/timer/domain/entity/playback_state_entity.dart' as domain;
import 'package:dhyana/modules/practice/timer/domain/enum/playback_status.dart';

/// Maps `audio_service`'s [audio_service.PlaybackState] to the domain model.
/// Only maps necessary fields for now.
extension PlaybackStateToDomain on audio_service.PlaybackState {
  domain.PlaybackStateEntity toDomain() {
    final PlaybackStatus status;
    if (processingState == audio_service.AudioProcessingState.idle) {
      status = PlaybackStatus.idle;
    } else {
      status = playing ? PlaybackStatus.playing : PlaybackStatus.paused;
    }
    return domain.PlaybackStateEntity(status: status, position: position);
  }
}
