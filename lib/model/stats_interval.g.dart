// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_interval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatsIntervalImpl _$$StatsIntervalImplFromJson(Map<String, dynamic> json) =>
    _$StatsIntervalImpl(
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$$StatsIntervalImplToJson(_$StatsIntervalImpl instance) =>
    <String, dynamic>{
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
    };
