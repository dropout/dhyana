// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cache_validation_result_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CacheValidationResultEntity _$CacheValidationResultEntityFromJson(
  Map<String, dynamic> json,
) => _CacheValidationResultEntity(
  chant: ChantEntity.fromJson(json['chant'] as Map<String, dynamic>),
  isAudioCacheValid: json['isAudioCacheValid'] as bool,
  isLyricsCacheValid: json['isLyricsCacheValid'] as bool,
  audioCachePath: json['audioCachePath'] as String?,
  lyricsCachePath: json['lyricsCachePath'] as String?,
  audioCacheEntry: json['audioCacheEntry'] == null
      ? null
      : ChantCacheEntity.fromJson(
          json['audioCacheEntry'] as Map<String, dynamic>,
        ),
  lyricsCacheEntry: json['lyricsCacheEntry'] == null
      ? null
      : ChantCacheEntity.fromJson(
          json['lyricsCacheEntry'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$CacheValidationResultEntityToJson(
  _CacheValidationResultEntity instance,
) => <String, dynamic>{
  'chant': instance.chant,
  'isAudioCacheValid': instance.isAudioCacheValid,
  'isLyricsCacheValid': instance.isLyricsCacheValid,
  'audioCachePath': instance.audioCachePath,
  'lyricsCachePath': instance.lyricsCachePath,
  'audioCacheEntry': instance.audioCacheEntry,
  'lyricsCacheEntry': instance.lyricsCacheEntry,
};
