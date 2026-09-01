// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chant_local_resources_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChantLocalResourcesEntity _$ChantLocalResourcesEntityFromJson(
  Map<String, dynamic> json,
) => _ChantLocalResourcesEntity(
  chant: ChantEntity.fromJson(json['chant'] as Map<String, dynamic>),
  audioLocalPath: json['audioLocalPath'] as String,
  lyricsLocalPath: json['lyricsLocalPath'] as String,
  audioVersion: (json['audioVersion'] as num).toInt(),
  lyricsVersion: (json['lyricsVersion'] as num).toInt(),
  usedStaleCache: json['usedStaleCache'] as bool? ?? false,
);

Map<String, dynamic> _$ChantLocalResourcesEntityToJson(
  _ChantLocalResourcesEntity instance,
) => <String, dynamic>{
  'chant': instance.chant,
  'audioLocalPath': instance.audioLocalPath,
  'lyricsLocalPath': instance.lyricsLocalPath,
  'audioVersion': instance.audioVersion,
  'lyricsVersion': instance.lyricsVersion,
  'usedStaleCache': instance.usedStaleCache,
};
