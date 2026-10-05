// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_session_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileSessionEntity _$ProfileSessionEntityFromJson(
  Map<String, dynamic> json,
) => _ProfileSessionEntity(
  id: json['id'] as String,
  type: $enumDecode(_$ProfileSessionEntityTypeEnumMap, json['type']),
  startTime: const DateTimeConverter().fromJson(
    (json['startTime'] as num).toInt(),
  ),
  endTime: const DateTimeConverter().fromJson((json['endTime'] as num).toInt()),
  duration: const DurationConverter().fromJson(
    (json['duration'] as num).toInt(),
  ),
);

Map<String, dynamic> _$ProfileSessionEntityToJson(
  _ProfileSessionEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'type': _$ProfileSessionEntityTypeEnumMap[instance.type]!,
  'startTime': const DateTimeConverter().toJson(instance.startTime),
  'endTime': const DateTimeConverter().toJson(instance.endTime),
  'duration': const DurationConverter().toJson(instance.duration),
};

const _$ProfileSessionEntityTypeEnumMap = {
  ProfileSessionEntityType.sitting: 'sitting',
  ProfileSessionEntityType.chanting: 'chanting',
};
