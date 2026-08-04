import 'package:dhyana/core/domain/entity/converter/date_time_converter.dart';
import 'package:dhyana/core/domain/entity/converter/date_time_or_null_converter.dart';
import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dto.freezed.dart';
part 'dto.g.dart';

@freezed
sealed class ConsecutiveDaysDto with _$ConsecutiveDaysDto {
	const factory ConsecutiveDaysDto({
		@Default(0) int current,
		@Default(0) int longest,
		@DateTimeOrNullConverter() DateTime? startedAt,
		@DateTimeOrNullConverter() DateTime? lastChecked,
	}) = _ConsecutiveDaysDto;

	factory ConsecutiveDaysDto.fromJson(Map<String, dynamic> json) =>
			_$ConsecutiveDaysDtoFromJson(json);
}

@freezed
sealed class MilestoneProgressDto with _$MilestoneProgressDto {
	const factory MilestoneProgressDto({
		@Default(0) int completedDaysCount,
		@Default(7) int targetDaysCount,
		@Default([]) List<Session> sessions,
	}) = _MilestoneProgressDto;

	factory MilestoneProgressDto.fromJson(Map<String, dynamic> json) =>
			_$MilestoneProgressDtoFromJson(json);
}

@freezed
sealed class ProfileSettingsDto with _$ProfileSettingsDto {
	const factory ProfileSettingsDto({
		@Default(true) bool showStatsOnFinishScreen,
		@Default(true) bool usePresenceFeature,
	}) = _ProfileSettingsDto;

	factory ProfileSettingsDto.fromJson(Map<String, dynamic> json) =>
			_$ProfileSettingsDtoFromJson(json);
}

@freezed
sealed class ProfileStatsReportDto with _$ProfileStatsReportDto {
	const factory ProfileStatsReportDto({
		@Default(ConsecutiveDaysDto()) ConsecutiveDaysDto consecutiveDays,
		@Default(MilestoneProgressDto()) MilestoneProgressDto milestoneProgress,
		@Default(0) int milestoneCount,
		@Default(0) int completedMinutesCount,
		@Default(0) int completedSessionsCount,
		@Default(0) int completedDaysCount,
		@DateTimeOrNullConverter() DateTime? firstSessionDate,
		@DateTimeOrNullConverter() DateTime? lastSessionDate,
	}) = _ProfileStatsReportDto;

	factory ProfileStatsReportDto.fromJson(Map<String, dynamic> json) =>
			_$ProfileStatsReportDtoFromJson(json);
}

@freezed
sealed class ProfileDto with _$ProfileDto {
	const factory ProfileDto({
		required String id,
		required String firstName,
		required String lastName,
		required String email,
		required String? photoUrl,
		required String? photoBlurhash,
		@Default(ProfileSettingsDto()) ProfileSettingsDto settings,
		@DateTimeConverter() required DateTime signupDate,
		required ProfileStatsReportDto statsReport,
		required bool completed,
		Location? location,
	}) = _ProfileDto;

	factory ProfileDto.fromJson(Map<String, dynamic> json) =>
			_$ProfileDtoFromJson(json);
}
