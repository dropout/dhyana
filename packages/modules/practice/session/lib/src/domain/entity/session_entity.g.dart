// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SessionEntity _$SessionEntityFromJson(Map<String, dynamic> json) =>
    _SessionEntity(
      id: json['id'] as String,
      type: $enumDecode(_$SessionEntityTypeEnumMap, json['type']),
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

Map<String, dynamic> _$SessionEntityToJson(_SessionEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$SessionEntityTypeEnumMap[instance.type]!,
      'startTime': const DateTimeConverter().toJson(instance.startTime),
      'endTime': const DateTimeConverter().toJson(instance.endTime),
      'duration': const DurationConverter().toJson(instance.duration),
    };

const _$SessionEntityTypeEnumMap = {
  SessionEntityType.timer: 'timer',
  SessionEntityType.chanting: 'chanting',
};
