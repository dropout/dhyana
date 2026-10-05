import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';

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