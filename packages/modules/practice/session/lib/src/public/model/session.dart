import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
sealed class Session with _$Session implements SerializableEntity {

  const Session._();

  const factory Session({
    required String id,
    required SessionType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
  }) = _Session;

  factory Session.fromJson(Map<String, Object?> json) =>
    _$SessionFromJson(json);

}
