// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chant_local_resources.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChantLocalResources _$ChantLocalResourcesFromJson(Map<String, dynamic> json) =>
    _ChantLocalResources(
      chant: Chant.fromJson(json['chant'] as Map<String, dynamic>),
      audioLocalPath: json['audioLocalPath'] as String,
      lyricsLocalPath: json['lyricsLocalPath'] as String,
      audioVersion: (json['audioVersion'] as num).toInt(),
      lyricsVersion: (json['lyricsVersion'] as num).toInt(),
      usedStaleCache: json['usedStaleCache'] as bool? ?? false,
    );

Map<String, dynamic> _$ChantLocalResourcesToJson(
  _ChantLocalResources instance,
) => <String, dynamic>{
  'chant': instance.chant,
  'audioLocalPath': instance.audioLocalPath,
  'lyricsLocalPath': instance.lyricsLocalPath,
  'audioVersion': instance.audioVersion,
  'lyricsVersion': instance.lyricsVersion,
  'usedStaleCache': instance.usedStaleCache,
};
