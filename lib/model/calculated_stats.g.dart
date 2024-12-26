// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calculated_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CalculatedStatsImpl _$$CalculatedStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$CalculatedStatsImpl(
      totalMinutes: (json['totalMinutes'] as num?)?.toInt() ?? 0,
      averageMinutes: (json['averageMinutes'] as num?)?.toDouble() ?? 0,
      totalSessions: (json['totalSessions'] as num?)?.toInt() ?? 0,
      averageSessions: (json['averageSessions'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$CalculatedStatsImplToJson(
        _$CalculatedStatsImpl instance) =>
    <String, dynamic>{
      'totalMinutes': instance.totalMinutes,
      'averageMinutes': instance.averageMinutes,
      'totalSessions': instance.totalSessions,
      'averageSessions': instance.averageSessions,
    };
