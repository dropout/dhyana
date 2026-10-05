import 'package:profile/src/data/mapper/consecutive_days_mapper.dart';
import 'package:profile/src/data/mapper/milestone_progress_mapper.dart';
import 'package:profile/src/domain/entity/profile_stats_report_entity.dart';
import 'package:profile/src/public/model/profile_stats_report.dart';

extension ProfileStatsReportEntityMapper on ProfileStatsReportEntity {
	ProfileStatsReport toApi() {
		return ProfileStatsReport(
			consecutiveDays: consecutiveDays.toApi(),
			milestoneProgress: milestoneProgress.toApi(),
			milestoneCount: milestoneCount,
			completedMinutesCount: completedMinutesCount,
			completedSessionsCount: completedSessionsCount,
			completedDaysCount: completedDaysCount,
			firstSessionDate: firstSessionDate,
			lastSessionDate: lastSessionDate,
		);
	}
}

extension ProfileStatsReportMapper on ProfileStatsReport {
	ProfileStatsReportEntity toDomain() {
		return ProfileStatsReportEntity(
			consecutiveDays: consecutiveDays.toDomain(),
			milestoneProgress: milestoneProgress.toDomain(),
			milestoneCount: milestoneCount,
			completedMinutesCount: completedMinutesCount,
			completedSessionsCount: completedSessionsCount,
			completedDaysCount: completedDaysCount,
			firstSessionDate: firstSessionDate,
			lastSessionDate: lastSessionDate,
		);
	}
}