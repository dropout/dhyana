import 'package:chanting/src/data/mapper/chant_cache_mapper.dart';
import 'package:chanting/src/data/service/chant_cache_validator.dart';
import 'package:chanting/src/domain/entity/cache_validation_result_entity.dart';

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
