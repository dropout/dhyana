import 'package:dhyana/model/converter/date_time_or_null_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'consecutive_days.dart';
import 'milestone_progress.dart';

part 'profile_statistics_report.freezed.dart';
part 'profile_statistics_report.g.dart';

@freezed
class ProfileStatisticsReport with _$ProfileStatisticsReport {

  const factory ProfileStatisticsReport({
    @Default(ConsecutiveDays()) ConsecutiveDays consecutiveDays,
    @Default(MilestoneProgress()) MilestoneProgress milestoneProgress,
    @Default(0) int milestoneCount,
    @Default(0) int completedMinutesCount,
    @Default(0) int completedSessionsCount,
    @Default(0) int completedDaysCount,
    @DateTimeOrNullConverter() DateTime? firstSessionDate,
    @DateTimeOrNullConverter() DateTime? lastSessionDate,
  }) = _ProfileStatisticsReport;

  factory ProfileStatisticsReport.fromJson(Map<String, Object?> json) =>
      _$ProfileStatisticsReportFromJson(json);

}
