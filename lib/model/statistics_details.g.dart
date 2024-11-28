// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticsDetailsImpl _$$StatisticsDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$StatisticsDetailsImpl(
      totalMinutes: (json['totalMinutes'] as num?)?.toInt() ?? 0,
      averageMinutes: (json['averageMinutes'] as num?)?.toDouble() ?? 0,
      totalSessions: (json['totalSessions'] as num?)?.toInt() ?? 0,
      averageSessions: (json['averageSessions'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$StatisticsDetailsImplToJson(
        _$StatisticsDetailsImpl instance) =>
    <String, dynamic>{
      'totalMinutes': instance.totalMinutes,
      'averageMinutes': instance.averageMinutes,
      'totalSessions': instance.totalSessions,
      'averageSessions': instance.averageSessions,
    };
