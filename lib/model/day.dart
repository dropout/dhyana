import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';
import 'session.dart';

part 'day.freezed.dart';
part 'day.g.dart';

@freezed
sealed class Day with _$Day implements Model {

  const Day._();

  const factory Day({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default([]) List<Session> sessions,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
    @Default(0) int consecutiveDaysCount,
  }) = _Day;

  factory Day.fromJson(Map<String, Object?> json) =>
    _$DayFromJson(json);

}
