// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_statistics_report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileStatisticsReportImpl _$$ProfileStatisticsReportImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileStatisticsReportImpl(
      consecutiveDays: (json['consecutiveDays'] as num).toInt(),
      completedMinutesCount: (json['completedMinutesCount'] as num).toInt(),
      completedSessionsCount: (json['completedSessionsCount'] as num).toInt(),
      completedDaysCount: (json['completedDaysCount'] as num).toInt(),
      lastSessionDate: const DateTimeOrNullConverter()
          .fromJson((json['lastSessionDate'] as num?)?.toInt()),
    );

Map<String, dynamic> _$$ProfileStatisticsReportImplToJson(
        _$ProfileStatisticsReportImpl instance) =>
    <String, dynamic>{
      'consecutiveDays': instance.consecutiveDays,
      'completedMinutesCount': instance.completedMinutesCount,
      'completedSessionsCount': instance.completedSessionsCount,
      'completedDaysCount': instance.completedDaysCount,
      'lastSessionDate':
          const DateTimeOrNullConverter().toJson(instance.lastSessionDate),
    };
