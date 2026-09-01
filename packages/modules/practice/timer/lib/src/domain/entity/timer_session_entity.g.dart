// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'timer_session_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TimerSessionEntity _$TimerSessionEntityFromJson(Map<String, dynamic> json) =>
    _TimerSessionEntity(
      id: json['id'] as String,
      type: $enumDecode(_$TimerSessionTypeEnumMap, json['type']),
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

Map<String, dynamic> _$TimerSessionEntityToJson(_TimerSessionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$TimerSessionTypeEnumMap[instance.type]!,
      'startTime': const DateTimeConverter().toJson(instance.startTime),
      'endTime': const DateTimeConverter().toJson(instance.endTime),
      'duration': const DurationConverter().toJson(instance.duration),
    };

const _$TimerSessionTypeEnumMap = {
  TimerSessionEntityType.sitting: 'sitting',
  TimerSessionEntityType.chanting: 'chanting',
};
