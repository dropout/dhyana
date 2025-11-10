// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_statistics_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileStatisticsReport _$ProfileStatisticsReportFromJson(
  Map<String, dynamic> json,
) => _ProfileStatisticsReport(
  consecutiveDays: json['consecutiveDays'] == null
      ? const ConsecutiveDays()
      : ConsecutiveDays.fromJson(
          json['consecutiveDays'] as Map<String, dynamic>,
        ),
  milestoneProgress: json['milestoneProgress'] == null
      ? const MilestoneProgress()
      : MilestoneProgress.fromJson(
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

Map<String, dynamic> _$ProfileStatisticsReportToJson(
  _ProfileStatisticsReport instance,
) => <String, dynamic>{
  'consecutiveDays': instance.consecutiveDays.toJson(),
  'milestoneProgress': instance.milestoneProgress.toJson(),
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
