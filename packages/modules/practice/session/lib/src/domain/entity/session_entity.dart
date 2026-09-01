import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'session_entity.freezed.dart';
part 'session_entity.g.dart';

enum SessionEntityType {
  sitting,
  chanting,
}

@freezed
sealed class SessionEntity with _$SessionEntity implements Dto {
  const SessionEntity._();

  const factory SessionEntity({
    required String id,
    required SessionEntityType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _SessionEntity;

  factory SessionEntity.fromJson(Map<String, Object?> json) =>
      _$SessionEntityFromJson(json);
}
