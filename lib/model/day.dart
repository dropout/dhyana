import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'model.dart';
import 'session.dart';

part 'day.freezed.dart';
part 'day.g.dart';

@freezed
class Day with _$Day implements Model {

  const Day._();

  const factory Day({
    required String id,
    @DateTimeConverter() required DateTime date,
    required List<Session> sessions,
    required int minutes,
    @Default(0) int consecutiveDays,
  }) = _Day;

  factory Day.empty({
    required DateTime day,
  }) {
    return Day(
      id: day.toDayId(),
      date: day,
      sessions: [],
      minutes: 0,
    );
  }

  factory Day.fromJson(Map<String, Object?> json) =>
    _$DayFromJson(json);

}
