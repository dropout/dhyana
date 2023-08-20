// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ProfileStats _$$_ProfileStatsFromJson(Map<String, dynamic> json) =>
    _$_ProfileStats(
      consecutiveDays: json['consecutiveDays'] as int,
      completedMinutesCount: json['completedMinutesCount'] as int,
      completedSessionsCount: json['completedSessionsCount'] as int,
      completedDaysCount: json['completedDaysCount'] as int,
      lastSessionDate: json['lastSessionDate'] == null
          ? null
          : DateTime.parse(json['lastSessionDate'] as String),
    );

Map<String, dynamic> _$$_ProfileStatsToJson(_$_ProfileStats instance) =>
    <String, dynamic>{
      'consecutiveDays': instance.consecutiveDays,
      'completedMinutesCount': instance.completedMinutesCount,
      'completedSessionsCount': instance.completedSessionsCount,
      'completedDaysCount': instance.completedDaysCount,
      'lastSessionDate': instance.lastSessionDate?.toIso8601String(),
    };
