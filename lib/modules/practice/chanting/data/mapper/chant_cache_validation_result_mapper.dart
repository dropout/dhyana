import 'package:dhyana/modules/practice/chanting/data/mapper/chant_cache_mapper.dart';
import 'package:dhyana/modules/practice/chanting/data/service/chant_cache_validator.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/cache_validation_result_entity.dart';

extension ChantCacheValidationResultMapper on ChantCacheValidationResult {
  CacheValidationResultEntity toDomain() {
    return CacheValidationResultEntity(
      chant: chant,
      isAudioCacheValid: isAudioCacheValid,
      isLyricsCacheValid: isLyricsCacheValid,
      audioCachePath: audioCachePath,
      lyricsCachePath: lyricsCachePath,
      audioCacheEntry: audioCacheEntry?.toDomain(),
      lyricsCacheEntry: lyricsCacheEntry?.toDomain(),
    );
  }
}
