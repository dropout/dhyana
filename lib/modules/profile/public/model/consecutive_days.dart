import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dhyana/core/data/converter/date_time_or_null_converter.dart';

part 'consecutive_days.freezed.dart';

@freezed
sealed class ConsecutiveDays with _$ConsecutiveDays {

  const factory ConsecutiveDays({
    @Default(0) int current,
    @Default(0) int longest,
    @DateTimeOrNullConverter() DateTime? startedAt,
    @DateTimeOrNullConverter() DateTime? lastChecked,
  }) = _ConsecutiveDays;

}