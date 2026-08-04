import 'package:dhyana/core/domain/entity/converter/date_time_or_null_converter.dart';
import 'package:dhyana/modules/profile/domain/entity/consecutive_days_entity.dart';
import 'package:dhyana/modules/profile/domain/entity/milestone_progress_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile_stats_report_entity.freezed.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

@freezed
sealed class ProfileStatsReportEntity with _$ProfileStatsReportEntity {

  const factory ProfileStatsReportEntity({
    @Default(ConsecutiveDaysEntity()) ConsecutiveDaysEntity consecutiveDays,
    @Default(MilestoneProgressEntity()) MilestoneProgressEntity milestoneProgress,
    @Default(0) int milestoneCount,
    @Default(0) int completedMinutesCount,
    @Default(0) int completedSessionsCount,
    @Default(0) int completedDaysCount,
    @DateTimeOrNullConverter() DateTime? firstSessionDate,
    @DateTimeOrNullConverter() DateTime? lastSessionDate,
  }) = _ProfileStatsReportEntity;

}
