// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Session _$SessionFromJson(Map<String, dynamic> json) => _Session(
  id: json['id'] as String,
  type: $enumDecode(_$SessionTypeEnumMap, json['type']),
  startTime: const DateTimeConverter().fromJson(
    (json['startTime'] as num).toInt(),
  ),
  endTime: const DateTimeConverter().fromJson((json['endTime'] as num).toInt()),
  duration: const DurationConverter().fromJson(
    (json['duration'] as num).toInt(),
  ),
);

Map<String, dynamic> _$SessionToJson(_Session instance) => <String, dynamic>{
  'id': instance.id,
  'type': _$SessionTypeEnumMap[instance.type]!,
  'startTime': const DateTimeConverter().toJson(instance.startTime),
  'endTime': const DateTimeConverter().toJson(instance.endTime),
  'duration': const DurationConverter().toJson(instance.duration),
};

const _$SessionTypeEnumMap = {
  SessionType.timer: 'timer',
  SessionType.chanting: 'chanting',
};
