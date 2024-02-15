// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileStatsImpl _$$ProfileStatsImplFromJson(Map<String, dynamic> json) =>
    _$ProfileStatsImpl(
      consecutiveDays: json['consecutiveDays'] as int,
      completedMinutesCount: json['completedMinutesCount'] as int,
      completedSessionsCount: json['completedSessionsCount'] as int,
      completedDaysCount: json['completedDaysCount'] as int,
      lastSessionDate: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['lastSessionDate'], const DateTimeConverter().fromJson),
    );

Map<String, dynamic> _$$ProfileStatsImplToJson(_$ProfileStatsImpl instance) =>
    <String, dynamic>{
      'consecutiveDays': instance.consecutiveDays,
      'completedMinutesCount': instance.completedMinutesCount,
      'completedSessionsCount': instance.completedSessionsCount,
      'completedDaysCount': instance.completedDaysCount,
      'lastSessionDate': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.lastSessionDate, const DateTimeConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
