import 'package:dhyana/modules/practice/chanting/domain/enum/cache_download_state.dart';
import 'package:dhyana/modules/practice/chanting/domain/enum/cached_asset_type.dart';
import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_cache_entity.dart';

extension ChantCacheEntryRowMapper on ChantCacheEntryRow {
  ChantCacheEntity toDomain() {
    return ChantCacheEntity(
      id: id,
      contentId: contentId,
      assetType: CachedAssetType.values.byName(assetType),
      storagePath: storagePath,
      localFilePath: localFilePath,
      cachedVersion: cachedVersion,
      remoteUpdatedAtEpochMs: remoteUpdatedAtEpochMs,
      remoteHash: remoteHash,
      remoteBytes: remoteBytes,
      isValid: isValid,
      downloadState: CacheDownloadState.values.byName(downloadState),
      failureCount: failureCount,
      lastError: lastError,
      lastValidatedAtEpochMs: lastValidatedAtEpochMs,
      createdAtEpochMs: createdAtEpochMs,
      updatedAtEpochMs: updatedAtEpochMs,
    );
  }
}

extension ChantCacheEntityMapper on ChantCacheEntity {
  ChantCacheEntryRow toRow() {
    return ChantCacheEntryRow(
      id: id,
      contentId: contentId,
      assetType: assetType.name,
      storagePath: storagePath,
      localFilePath: localFilePath,
      cachedVersion: cachedVersion,
      remoteUpdatedAtEpochMs: remoteUpdatedAtEpochMs,
      remoteHash: remoteHash,
      remoteBytes: remoteBytes,
      isValid: isValid,
      downloadState: downloadState.name,
      failureCount: failureCount,
      lastError: lastError,
      lastValidatedAtEpochMs: lastValidatedAtEpochMs,
      createdAtEpochMs: createdAtEpochMs,
      updatedAtEpochMs: updatedAtEpochMs,
    );
  }
}
