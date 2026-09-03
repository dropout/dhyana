import 'package:chanting/src/domain/enum/cache_download_state.dart';
import 'package:chanting/src/domain/enum/cached_asset_type.dart';
import 'package:core/core.dart';
import 'package:chanting/src/drift/chant_cache_database.dart';
import 'package:chanting/src/data/datasource/chant_cache_data_provider.dart';
import 'package:chanting/src/data/service/chant_cache_file_system.dart';
import 'package:chanting/src/domain/repository/chant_cache_data_repository.dart';
import 'package:firebase_provider/firebase_provider.dart';

class DefaultChantCacheDataRepository 
  with LoggerMixin 
  implements ChantCacheRepository {

  final ChantCacheDataProvider chantCacheDataProvider;
  final StorageDataProvider storageDataProvider;
  final ChantCacheFileSystem chantCacheFileSystem;
  
  DefaultChantCacheDataRepository({
    required this.chantCacheDataProvider,
    required this.storageDataProvider,
    required this.chantCacheFileSystem,
  });

  @override
  Future<ChantCacheEntryRow?> readEntry(
    String contentId,
    CachedAssetType type,
  ) async => chantCacheDataProvider.readEntry(contentId, type);

  @override
  Future<void> upsertEntry(ChantCacheEntryRow row) async =>
      chantCacheDataProvider.upsertEntry(row);

  @override
  Future<void> markState({
    required String contentId,
    required CachedAssetType assetType,
    required CacheDownloadState state,
    String? lastError,
  }) async {
    await chantCacheDataProvider.markState(
      contentId: contentId,
      assetType: assetType,
      state: state,
      lastError: lastError,
    );
  }

  @override
  Future<void> deleteEntry(String contentId, CachedAssetType type) async =>
    await chantCacheDataProvider.deleteEntry(contentId, type);

  @override
  Future<void> deleteAllEntries() async =>
    await chantCacheDataProvider.deleteAllEntries();


  @override
  Future<void> ensureCacheDirectories() async =>
    chantCacheFileSystem.ensureCacheDirectories();

  @override
  Future<String> buildCacheFilePath({
    required String contentId,
    required CachedAssetType assetType,
    required int version,
  }) async => chantCacheFileSystem.buildCacheFilePath(
    contentId: contentId,
    assetType: assetType,
    version: version,
  );

  @override
  Future<DownloadTask> downloadToFile({
    required String storagePath,
    required String localDestinationPath,
  }) async {
    return storageDataProvider.downloadFile(
      storagePath: storagePath,
      destinationPath: localDestinationPath,
    );
  }

  @override
  Future<void> clearCache() async => chantCacheFileSystem.clearCache();
}
