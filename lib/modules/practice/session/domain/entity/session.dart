import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/core/domain/entity/converter/duration_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/core/domain/entity/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
sealed class Session with _$Session implements Entity, AppSession {

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
