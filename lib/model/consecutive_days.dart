import 'package:dhyana/model/converter/date_time_or_null_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'consecutive_days.freezed.dart';
part 'consecutive_days.g.dart';

@freezed
class ConsecutiveDays with _$ConsecutiveDays {

  const ConsecutiveDays._();

  const factory ConsecutiveDays({
    @Default(0) int count,
    @DateTimeOrNullConverter() DateTime? startedAt,
    @DateTimeOrNullConverter() DateTime? lastChecked,
  }) = _ConsecutiveDays;

  factory ConsecutiveDays.fromJson(Map<String, Object?> json) =>
      _$ConsecutiveDaysFromJson(json);

}
