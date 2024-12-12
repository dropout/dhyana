// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_interval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatsIntervalImpl _$$StatsIntervalImplFromJson(Map<String, dynamic> json) =>
    _$StatsIntervalImpl(
      intervalType:
          $enumDecode(_$StatsIntervalTypeEnumMap, json['intervalType']),
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$$StatsIntervalImplToJson(_$StatsIntervalImpl instance) =>
    <String, dynamic>{
      'intervalType': _$StatsIntervalTypeEnumMap[instance.intervalType]!,
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
    };

const _$StatsIntervalTypeEnumMap = {
  StatsIntervalType.days: 'days',
  StatsIntervalType.weeks: 'weeks',
  StatsIntervalType.months: 'months',
  StatsIntervalType.years: 'years',
};
