import 'package:dhyana/enum/cache_download_state.dart';
import 'package:dhyana/enum/cached_asset_type.dart';
import 'package:dhyana/drift/chant_cache_database.dart';

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
