import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'converter/duration_converter.dart';
import 'model.dart';
import 'timer_settings.dart';

part 'session.freezed.dart';
part 'session.g.dart';

@freezed
sealed class Session with _$Session implements Model {

  const Session._();

  const factory Session({
    required String id,
    @DateTimeConverter() required DateTime startTime,
    @DateTimeConverter() required DateTime endTime,
    @DurationConverter() required Duration duration,
    required TimerSettings timerSettings,
  }) = _Session;

  factory Session.fromJson(Map<String, Object?> json) =>
    _$SessionFromJson(json);

}
