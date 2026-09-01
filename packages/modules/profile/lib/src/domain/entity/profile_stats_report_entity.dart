import 'package:core/core.dart';
import 'package:profile/src/domain/entity/consecutive_days_entity.dart';
import 'package:profile/src/domain/entity/milestone_progress_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'profile_stats_report_entity.freezed.dart';
part 'profile_stats_report_entity.g.dart';

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

  factory ProfileStatsReportEntity.fromJson(Map<String, Object?> json) =>
    _$ProfileStatsReportEntityFromJson(json);

}
