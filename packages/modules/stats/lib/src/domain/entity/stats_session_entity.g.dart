// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats_session_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StatsSessionEntity _$StatsSessionEntityFromJson(Map<String, dynamic> json) =>
    _StatsSessionEntity(
      id: json['id'] as String,
      type: $enumDecode(_$StatsSessionEntityTypeEnumMap, json['type']),
      startTime: const DateTimeConverter().fromJson(
        (json['startTime'] as num).toInt(),
      ),
      endTime: const DateTimeConverter().fromJson(
        (json['endTime'] as num).toInt(),
      ),
      duration: const DurationConverter().fromJson(
        (json['duration'] as num).toInt(),
      ),
    );

Map<String, dynamic> _$StatsSessionEntityToJson(_StatsSessionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$StatsSessionEntityTypeEnumMap[instance.type]!,
      'startTime': const DateTimeConverter().toJson(instance.startTime),
      'endTime': const DateTimeConverter().toJson(instance.endTime),
      'duration': const DurationConverter().toJson(instance.duration),
    };

const _$StatsSessionEntityTypeEnumMap = {
  StatsSessionEntityType.sitting: 'sitting',
  StatsSessionEntityType.chanting: 'chanting',
};
