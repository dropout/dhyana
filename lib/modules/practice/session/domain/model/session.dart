import 'package:dhyana/core/domain/enum/session_type.dart';
import 'package:dhyana/core/domain/model/converter/duration_converter.dart';
import 'package:dhyana/core/domain/model/model.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chanting_settings.dart';
import 'package:dhyana/core/domain/model/converter/date_time_converter.dart';
import 'package:dhyana/modules/practice/timer/domain/model/timer_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
sealed class Session with _$Session implements Model {

  const Session._();

  const factory Session({
    required String id,
    required SessionType type,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
    TimerSettings? timerSettings,
    ChantingSettings? chantingSettings,
  }) = _Session;

  factory Session.fromJson(Map<String, Object?> json) =>
    _$SessionFromJson(json);

}
