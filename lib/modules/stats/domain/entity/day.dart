import 'package:dhyana/core/data/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/entity/entity.dart';
import 'package:dhyana/modules/stats/domain/entity/insights_session_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'day.freezed.dart';
part 'day.g.dart';

@freezed
sealed class Day with _$Day implements Dto {

  const Day._();

  const factory Day({
    required String id,
    @DateTimeConverter() required DateTime startDate,
    @Default([]) List<InsightsSessionEntity> sessions,
    @Default(0) int minutesCount,
    @Default(0) int sessionCount,
    @Default(0) int consecutiveDaysCount,
  }) = _Day;

  factory Day.fromJson(Map<String, Object?> json) =>
    _$DayFromJson(json);

}
