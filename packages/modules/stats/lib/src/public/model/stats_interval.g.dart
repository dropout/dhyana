// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_interval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatsInterval _$StatsIntervalFromJson(Map<String, dynamic> json) =>
    _StatsInterval(
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$StatsIntervalToJson(_StatsInterval instance) =>
    <String, dynamic>{
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
    };
