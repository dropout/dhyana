import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/core/data/converter/duration_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'session_entity.freezed.dart';
part 'session_entity.g.dart';

@freezed
sealed class SessionEntity with _$SessionEntity implements Dto {

  const SessionEntity._();

  const factory SessionEntity({
    required String id,
    required SessionType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _SessionEntity;

  factory SessionEntity.fromJson(Map<String, Object?> json) =>
    _$SessionEntityFromJson(json);

}
