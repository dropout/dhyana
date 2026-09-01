// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chant_meta_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChantMetaData _$ChantMetaDataFromJson(Map<String, dynamic> json) =>
    _ChantMetaData(
      id: json['id'] as String,
      audioVersion: (json['audioVersion'] as num).toInt(),
      lyricsVersion: (json['lyricsVersion'] as num).toInt(),
      coverVersion: (json['coverVersion'] as num).toInt(),
      audioSha256: json['audioSha256'] as String,
      lyricsSha256: json['lyricsSha256'] as String,
      coverSha256: json['coverSha256'] as String,
      audioBytes: (json['audioBytes'] as num).toInt(),
      lyricsBytes: (json['lyricsBytes'] as num).toInt(),
      coverBytes: (json['coverBytes'] as num).toInt(),
      updatedAt: const DateTimeConverter().fromJson(
        (json['updatedAt'] as num).toInt(),
      ),
    );

Map<String, dynamic> _$ChantMetaDataToJson(_ChantMetaData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'audioVersion': instance.audioVersion,
      'lyricsVersion': instance.lyricsVersion,
      'coverVersion': instance.coverVersion,
      'audioSha256': instance.audioSha256,
      'lyricsSha256': instance.lyricsSha256,
      'coverSha256': instance.coverSha256,
      'audioBytes': instance.audioBytes,
      'lyricsBytes': instance.lyricsBytes,
      'coverBytes': instance.coverBytes,
      'updatedAt': const DateTimeConverter().toJson(instance.updatedAt),
    };
