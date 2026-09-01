// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chant_playlist_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChantPlaylistItem _$ChantPlaylistItemFromJson(Map<String, dynamic> json) =>
    _ChantPlaylistItem(
      id: json['id'] as String,
      chantId: json['chantId'] as String,
      name: json['name'] as String,
      blurHash: json['blurHash'] as String,
      order: (json['order'] as num).toInt(),
      duration: Duration(microseconds: (json['duration'] as num).toInt()),
    );

Map<String, dynamic> _$ChantPlaylistItemToJson(_ChantPlaylistItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chantId': instance.chantId,
      'name': instance.name,
      'blurHash': instance.blurHash,
      'order': instance.order,
      'duration': instance.duration.inMicroseconds,
    };
