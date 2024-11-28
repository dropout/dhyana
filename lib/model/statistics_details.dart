import 'package:freezed_annotation/freezed_annotation.dart';

import 'day.dart';
import 'week.dart';
import 'month.dart';
import 'year.dart';

part 'statistics_details.freezed.dart';
part 'statistics_details.g.dart';

@freezed
class StatisticsDetails with _$StatisticsDetails {

  const factory StatisticsDetails({
    @Default(0) int totalMinutes,
    @Default(0) double averageMinutes,
    @Default(0) int totalSessions,
    @Default(0) double averageSessions,
  }) = _StatisticsDetails;

  factory StatisticsDetails.fromDays(List<Day> days) {
    return StatisticsDetails(
      totalMinutes: days.fold(0, (sum, day) => sum + day.minutesCount),
      averageMinutes: days.isEmpty ? 0 : days.fold(0, (sum, day) => sum + day.minutesCount) / days.length,
      totalSessions: days.fold(0, (sum, day) => sum + day.sessionCount),
      averageSessions: days.isEmpty ? 0 : days.fold(0, (sum, day) => sum + day.sessionCount) / days.length,
    );
  }

  factory StatisticsDetails.fromWeeks(List<Week> weeks) {
    return StatisticsDetails(
      totalMinutes: weeks.fold(0, (sum, week) => sum + week.minutesCount),
      averageMinutes: weeks.isEmpty ? 0 : weeks.fold(0, (sum, week) => sum + week.minutesCount) / weeks.length,
      totalSessions: weeks.fold(0, (sum, week) => sum + week.sessionCount),
      averageSessions: weeks.isEmpty ? 0 : weeks.fold(0, (sum, week) => sum + week.sessionCount) / weeks.length,
    );
  }

  factory StatisticsDetails.fromMonths(List<Month> months) {
    return StatisticsDetails(
      totalMinutes: months.fold(0, (sum, month) => sum + month.minutesCount),
      averageMinutes: months.isEmpty ? 0 : months.fold(0, (sum, month) => sum + month.minutesCount) / months.length,
      totalSessions: months.fold(0, (sum, month) => sum + month.sessionCount),
      averageSessions: months.isEmpty ? 0 : months.fold(0, (sum, month) => sum + month.sessionCount) / months.length,
    );
  }

  factory StatisticsDetails.fromYears(List<Year> years) {
    return StatisticsDetails(
      totalMinutes: years.fold(0, (sum, year) => sum + year.minutesCount),
      averageMinutes: years.isEmpty ? 0 : years.fold(0, (sum, year) => sum + year.minutesCount) / years.length,
      totalSessions: years.fold(0, (sum, year) => sum + year.sessionCount),
      averageSessions: years.isEmpty ? 0 : years.fold(0, (sum, year) => sum + year.sessionCount) / years.length,
    );
  }

  factory StatisticsDetails.fromJson(Map<String, Object?> json) =>
      _$StatisticsDetailsFromJson(json);
}
