// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_state_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaybackStateEntity _$PlaybackStateEntityFromJson(Map<String, dynamic> json) =>
    _PlaybackStateEntity(
      status: $enumDecode(_$PlaybackStatusEnumMap, json['status']),
      position: Duration(microseconds: (json['position'] as num).toInt()),
    );

Map<String, dynamic> _$PlaybackStateEntityToJson(
  _PlaybackStateEntity instance,
) => <String, dynamic>{
  'status': _$PlaybackStatusEnumMap[instance.status]!,
  'position': instance.position.inMicroseconds,
};

const _$PlaybackStatusEnumMap = {
  PlaybackStatus.idle: 'idle',
  PlaybackStatus.playing: 'playing',
  PlaybackStatus.paused: 'paused',
};
