import 'package:dhyana/core/domain/model/converter/date_time_or_null_converter.dart';
import 'package:dhyana/modules/insights/domain/model/consecutive_days.dart';
import 'package:dhyana/modules/insights/domain/model/milestone_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile_statistics_report.freezed.dart';
part 'profile_statistics_report.g.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

@freezed
sealed class ProfileStatisticsReport with _$ProfileStatisticsReport {

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
