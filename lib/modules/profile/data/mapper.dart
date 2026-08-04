import 'package:dhyana/core/domain/entity/profile/profile_settings.dart';
import 'package:dhyana/core/domain/entity/profile/profile_statistics_report.dart';
import 'package:dhyana/modules/profile/data/dto.dart';
import 'package:dhyana/modules/profile/domain/entity/consecutive_days_entity.dart';
import 'package:dhyana/modules/profile/domain/entity/milestone_progress_entity.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_settings_entity.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_stats_report_entity.dart';

extension ConsecutiveDaysDtoMapper on ConsecutiveDaysDto {
	ConsecutiveDaysEntity toDomain() {
		return ConsecutiveDaysEntity(
			current: current,
			longest: longest,
			startedAt: startedAt,
			lastChecked: lastChecked,
		);
	}
}

extension ConsecutiveDaysEntityMapper on ConsecutiveDaysEntity {
	ConsecutiveDaysDto toDto() {
		return ConsecutiveDaysDto(
			current: current,
			longest: longest,
			startedAt: startedAt,
			lastChecked: lastChecked,
		);
	}
}

extension MilestoneProgressDtoMapper on MilestoneProgressDto {
	MilestoneProgressEntity toDomain() {
		return MilestoneProgressEntity(
			completedDaysCount: completedDaysCount,
			targetDaysCount: targetDaysCount,
			sessions: sessions,
		);
	}
}

extension MilestoneProgressEntityMapper on MilestoneProgressEntity {
	MilestoneProgressDto toDto() {
		return MilestoneProgressDto(
			completedDaysCount: completedDaysCount,
			targetDaysCount: targetDaysCount,
			sessions: sessions,
		);
	}
}

extension ProfileSettingsDtoMapper on ProfileSettingsDto {
	ProfileSettingsEntity toDomainEntity() {
		return ProfileSettingsEntity(
			showStatsOnFinishScreen: showStatsOnFinishScreen,
			usePresenceFeature: usePresenceFeature,
		);
	}

	ProfileSettings toDomain() {
		return ProfileSettings(
			showStatsOnFinishScreen: showStatsOnFinishScreen,
			usePresenceFeature: usePresenceFeature,
		);
	}
}

extension ProfileSettingsEntityMapper on ProfileSettingsEntity {
	ProfileSettingsDto toDto() {
		return ProfileSettingsDto(
			showStatsOnFinishScreen: showStatsOnFinishScreen,
			usePresenceFeature: usePresenceFeature,
		);
	}
}

extension ProfileSettingsMapper on ProfileSettings {
	ProfileSettingsDto toDto() {
		return ProfileSettingsDto(
			showStatsOnFinishScreen: showStatsOnFinishScreen,
			usePresenceFeature: usePresenceFeature,
		);
	}
}

extension ProfileStatsReportDtoMapper on ProfileStatsReportDto {
	ProfileStatsReportEntity toDomainEntity() {
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

	ProfileStatisticsReport toDomain() {
		return ProfileStatisticsReport(
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

extension ProfileStatsReportEntityMapper on ProfileStatsReportEntity {
	ProfileStatsReportDto toDto() {
		return ProfileStatsReportDto(
			consecutiveDays: consecutiveDays.toDto(),
			milestoneProgress: milestoneProgress.toDto(),
			milestoneCount: milestoneCount,
			completedMinutesCount: completedMinutesCount,
			completedSessionsCount: completedSessionsCount,
			completedDaysCount: completedDaysCount,
			firstSessionDate: firstSessionDate,
			lastSessionDate: lastSessionDate,
		);
	}
}

extension ProfileStatisticsReportMapper on ProfileStatisticsReport {
	ProfileStatsReportDto toDto() {
		return ProfileStatsReportDto(
			consecutiveDays: consecutiveDays.toDto(),
			milestoneProgress: milestoneProgress.toDto(),
			milestoneCount: milestoneCount,
			completedMinutesCount: completedMinutesCount,
			completedSessionsCount: completedSessionsCount,
			completedDaysCount: completedDaysCount,
			firstSessionDate: firstSessionDate,
			lastSessionDate: lastSessionDate,
		);
	}
}

extension ProfileDtoMapper on ProfileDto {
	ProfileEntity toDomain() {
		return ProfileEntity(
			id: id,
			firstName: firstName,
			lastName: lastName,
			email: email,
			photoUrl: photoUrl,
			photoBlurhash: photoBlurhash,
			settings: settings.toDomain(),
			signupDate: signupDate,
			statsReport: statsReport.toDomain(),
			completed: completed,
			location: location,
		);
	}
}

extension ProfileEntityMapper on ProfileEntity {
	ProfileDto toDto() {
		return ProfileDto(
			id: id,
			firstName: firstName,
			lastName: lastName,
			email: email,
			photoUrl: photoUrl,
			photoBlurhash: photoBlurhash,
			settings: settings.toDto(),
			signupDate: signupDate,
			statsReport: statsReport.toDto(),
			completed: completed,
			location: location,
		);
	}
}
