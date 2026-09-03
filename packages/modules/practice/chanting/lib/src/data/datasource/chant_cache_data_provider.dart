import 'package:chanting/src/domain/enum/cache_download_state.dart';
import 'package:chanting/src/domain/enum/cached_asset_type.dart';
import 'package:chanting/src/drift/chant_cache_database.dart';

abstract interface class ChantCacheDataProvider {
  Future<ChantCacheEntryRow?> readEntry(String contentId, CachedAssetType type);
  Future<void> upsertEntry(ChantCacheEntryRow row);
  
  Future<void> markState({
    required String contentId,
    required CachedAssetType assetType,
    required CacheDownloadState state,
    String? lastError,
  });

  Future<void> deleteEntry(String contentId, CachedAssetType type);
  Future<void> deleteAllEntries();
}
