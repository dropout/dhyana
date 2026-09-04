// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_stats_report_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileStatsReportEntity _$ProfileStatsReportEntityFromJson(
  Map<String, dynamic> json,
) => _ProfileStatsReportEntity(
  consecutiveDays: json['consecutiveDays'] == null
      ? const ConsecutiveDaysEntity()
      : ConsecutiveDaysEntity.fromJson(
          json['consecutiveDays'] as Map<String, dynamic>,
        ),
  milestoneProgress: json['milestoneProgress'] == null
      ? const MilestoneProgressEntity()
      : MilestoneProgressEntity.fromJson(
          json['milestoneProgress'] as Map<String, dynamic>,
        ),
  milestoneCount: (json['milestoneCount'] as num?)?.toInt() ?? 0,
  completedMinutesCount: (json['completedMinutesCount'] as num?)?.toInt() ?? 0,
  completedSessionsCount:
      (json['completedSessionsCount'] as num?)?.toInt() ?? 0,
  completedDaysCount: (json['completedDaysCount'] as num?)?.toInt() ?? 0,
  firstSessionDate: const DateTimeOrNullConverter().fromJson(
    (json['firstSessionDate'] as num?)?.toInt(),
  ),
  lastSessionDate: const DateTimeOrNullConverter().fromJson(
    (json['lastSessionDate'] as num?)?.toInt(),
  ),
);

Map<String, dynamic> _$ProfileStatsReportEntityToJson(
  _ProfileStatsReportEntity instance,
) => <String, dynamic>{
  'consecutiveDays': instance.consecutiveDays,
  'milestoneProgress': instance.milestoneProgress,
  'milestoneCount': instance.milestoneCount,
  'completedMinutesCount': instance.completedMinutesCount,
  'completedSessionsCount': instance.completedSessionsCount,
  'completedDaysCount': instance.completedDaysCount,
  'firstSessionDate': const DateTimeOrNullConverter().toJson(
    instance.firstSessionDate,
  ),
  'lastSessionDate': const DateTimeOrNullConverter().toJson(
    instance.lastSessionDate,
  ),
};
