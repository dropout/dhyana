import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'stats_session_entity.freezed.dart';
part 'stats_session_entity.g.dart';

enum StatsSessionEntityType {
  sitting,
  chanting,
}

@freezed
sealed class StatsSessionEntity with _$StatsSessionEntity implements SerializableEntity {

  const StatsSessionEntity._();

  const factory StatsSessionEntity({
    required String id,
    required StatsSessionEntityType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _StatsSessionEntity;

  factory StatsSessionEntity.fromJson(Map<String, Object?> json) =>
    _$StatsSessionEntityFromJson(json);

}
