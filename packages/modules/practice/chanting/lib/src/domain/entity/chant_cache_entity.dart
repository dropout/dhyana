import 'package:core/core.dart';
import 'package:chanting/src/domain/enum/cache_download_state.dart';
import 'package:chanting/src/domain/enum/cached_asset_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chant_cache_entity.freezed.dart';
part 'chant_cache_entity.g.dart';

@freezed
sealed class ChantCacheEntity with _$ChantCacheEntity implements SerializableEntity {
  const ChantCacheEntity._();

  const factory ChantCacheEntity({
    required String id,
    required String contentId,
    required CachedAssetType assetType,
    required String storagePath,
    required String localFilePath,
    required int cachedVersion,
    required int remoteUpdatedAtEpochMs,
    String? remoteHash,
    int? remoteBytes,
    @Default(false) bool isValid,
    @Default(CacheDownloadState.pending) CacheDownloadState downloadState,
    @Default(0) int failureCount,
    String? lastError,
    int? lastValidatedAtEpochMs,
    required int createdAtEpochMs,
    required int updatedAtEpochMs,
  }) = _ChantCacheEntity;

  factory ChantCacheEntity.fromJson(Map<String, Object?> json) =>
      _$ChantCacheEntityFromJson(json);
}
