import 'package:timer/src/domain/enum/playback_status.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'playback_state_entity.freezed.dart';
part 'playback_state_entity.g.dart';

/// Domain-owned snapshot of audio playback, decoupled from any audio package.
@freezed
sealed class PlaybackStateEntity with _$PlaybackStateEntity {
  const factory PlaybackStateEntity({
    required PlaybackStatus status,
    required Duration position,
  }) = _PlaybackStateEntity;

  factory PlaybackStateEntity.fromJson(Map<String, Object?> json) =>
      _$PlaybackStateEntityFromJson(json);
}
