import 'package:freezed_annotation/freezed_annotation.dart';

import 'day.dart';
import 'week.dart';
import 'month.dart';
import 'year.dart';

part 'calculated_stats.freezed.dart';
part 'calculated_stats.g.dart';

@freezed
class CalculatedStats with _$CalculatedStats {

  const factory CalculatedStats({
    @Default(0) int totalMinutes,
    @Default(0) double averageMinutes,
    @Default(0) int totalSessions,
    @Default(0) double averageSessions,
  }) = _CalculatedStats;

  factory CalculatedStats.fromDays(List<Day> days) {
    return CalculatedStats(
      totalMinutes: days.fold(0, (sum, day) => sum + day.minutesCount),
      averageMinutes: days.isEmpty ? 0 : days.fold(0, (sum, day) => sum + day.minutesCount) / days.length,
      totalSessions: days.fold(0, (sum, day) => sum + day.sessionCount),
      averageSessions: days.isEmpty ? 0 : days.fold(0, (sum, day) => sum + day.sessionCount) / days.length,
    );
  }

  factory CalculatedStats.fromWeeks(List<Week> weeks) {
    return CalculatedStats(
      totalMinutes: weeks.fold(0, (sum, week) => sum + week.minutesCount),
      averageMinutes: weeks.isEmpty ? 0 : weeks.fold(0, (sum, week) => sum + week.minutesCount) / weeks.length,
      totalSessions: weeks.fold(0, (sum, week) => sum + week.sessionCount),
      averageSessions: weeks.isEmpty ? 0 : weeks.fold(0, (sum, week) => sum + week.sessionCount) / weeks.length,
    );
  }

  factory CalculatedStats.fromMonths(List<Month> months) {
    return CalculatedStats(
      totalMinutes: months.fold(0, (sum, month) => sum + month.minutesCount),
      averageMinutes: months.isEmpty ? 0 : months.fold(0, (sum, month) => sum + month.minutesCount) / months.length,
      totalSessions: months.fold(0, (sum, month) => sum + month.sessionCount),
      averageSessions: months.isEmpty ? 0 : months.fold(0, (sum, month) => sum + month.sessionCount) / months.length,
    );
  }

  factory CalculatedStats.fromYears(List<Year> years) {
    return CalculatedStats(
      totalMinutes: years.fold(0, (sum, year) => sum + year.minutesCount),
      averageMinutes: years.isEmpty ? 0 : years.fold(0, (sum, year) => sum + year.minutesCount) / years.length,
      totalSessions: years.fold(0, (sum, year) => sum + year.sessionCount),
      averageSessions: years.isEmpty ? 0 : years.fold(0, (sum, year) => sum + year.sessionCount) / years.length,
    );
  }

  factory CalculatedStats.fromJson(Map<String, Object?> json) =>
      _$CalculatedStatsFromJson(json);
}
