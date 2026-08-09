import 'package:dhyana/core/data/converter/date_time_or_null_converter.dart';
import 'package:dhyana/modules/profile/public/model/consecutive_days.dart';
import 'package:dhyana/modules/profile/public/model/milestone_progress.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_stats_report.freezed.dart';

// When editing profile make sure to check the profile model
// in firebase functions, because thats where the
// initial profile db record is created.

@freezed
sealed class ProfileStatsReport with _$ProfileStatsReport {

  const factory ProfileStatsReport({
    @Default(ConsecutiveDays()) ConsecutiveDays consecutiveDays,
    @Default(MilestoneProgress()) MilestoneProgress milestoneProgress,
    @Default(0) int milestoneCount,
    @Default(0) int completedMinutesCount,
    @Default(0) int completedSessionsCount,
    @Default(0) int completedDaysCount,
    @DateTimeOrNullConverter() DateTime? firstSessionDate,
    @DateTimeOrNullConverter() DateTime? lastSessionDate,
  }) = _ProfileStatsReport;

}
