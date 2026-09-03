import 'package:chanting/src/domain/enum/cache_download_state.dart';
import 'package:chanting/src/domain/enum/cached_asset_type.dart';
import 'package:chanting/src/drift/chant_cache_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract interface class ChantCacheRepository {

  // ---------------------------------------------------------------------------
  // Local database operations
  // ---------------------------------------------------------------------------

  /// Reads a cache entry from the local database for the given content ID and asset type.
  Future<ChantCacheEntryRow?> readEntry(String contentId, CachedAssetType type);

  Future<void> markState({
    required String contentId,
    required CachedAssetType assetType,
    required CacheDownloadState state,
    String? lastError,
  });

  /// Upserts a cache entry in the local database.
  Future<void> upsertEntry(ChantCacheEntryRow row);

  /// Deletes a cache entry from the local database for the given content ID and asset type.
  Future<void> deleteEntry(String contentId, CachedAssetType type);

  /// Deletes all cache entries from the local database.
  Future<void> deleteAllEntries();

  // ---------------------------------------------------------------------------
  // File system operations
  // ---------------------------------------------------------------------------

  /// Builds the file path for a cached asset.
  Future<String> buildCacheFilePath({
    required String contentId,
    required CachedAssetType assetType,
    required int version,
  });

  /// Ensures that the root cache directory exists.
  Future<void> ensureCacheDirectories();

  /// Downloads a file from the given storage path
  /// to the specified local destination path.
  Future<DownloadTask> downloadToFile({
    required String storagePath,
    required String localDestinationPath,
  });

  /// Clears all cached files and directories.
  Future<void> clearCache();  
}

