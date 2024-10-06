// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_statistics_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileStatisticsReportImpl _$$ProfileStatisticsReportImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileStatisticsReportImpl(
      consecutiveDays: json['consecutiveDays'] == null
          ? const ConsecutiveDays()
          : ConsecutiveDays.fromJson(
              json['consecutiveDays'] as Map<String, dynamic>),
      completedMinutesCount:
          (json['completedMinutesCount'] as num?)?.toInt() ?? 0,
      completedSessionsCount:
          (json['completedSessionsCount'] as num?)?.toInt() ?? 0,
      completedDaysCount: (json['completedDaysCount'] as num?)?.toInt() ?? 0,
      firstSessionDate: const DateTimeOrNullConverter()
          .fromJson((json['firstSessionDate'] as num?)?.toInt()),
      lastSessionDate: const DateTimeOrNullConverter()
          .fromJson((json['lastSessionDate'] as num?)?.toInt()),
    );

Map<String, dynamic> _$$ProfileStatisticsReportImplToJson(
        _$ProfileStatisticsReportImpl instance) =>
    <String, dynamic>{
      'consecutiveDays': instance.consecutiveDays.toJson(),
      'completedMinutesCount': instance.completedMinutesCount,
      'completedSessionsCount': instance.completedSessionsCount,
      'completedDaysCount': instance.completedDaysCount,
      'firstSessionDate':
          const DateTimeOrNullConverter().toJson(instance.firstSessionDate),
      'lastSessionDate':
          const DateTimeOrNullConverter().toJson(instance.lastSessionDate),
    };
