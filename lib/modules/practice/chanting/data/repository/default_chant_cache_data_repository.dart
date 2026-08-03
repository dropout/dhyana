import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/domain/enum/cache_download_state.dart';
import 'package:dhyana/core/domain/enum/cached_asset_type.dart';
import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/chant_cache_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_cache_data_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class DefaultChantCacheDataRepository implements ChantCacheDataRepository {
  static const _rootFolder = 'chant_cache';

  final ChantCacheDataProvider chantCacheDataProvider;
  final StorageDataProvider storageDataProvider;

  DefaultChantCacheDataRepository({
    required this.chantCacheDataProvider,
    required this.storageDataProvider,
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
  Future<void> ensureCacheDirectories() async {
    final root = await _rootDirectory();
    if (!await root.exists()) {
      await root.create(recursive: true);
    }
  }

  @override
  Future<String> buildCacheFilePath({
    required String contentId,
    required CachedAssetType assetType,
    required int version,
  }) async {
    final root = await _rootDirectory();
    final contentDir = Directory('${root.path}/$contentId');
    if (!await contentDir.exists()) {
      await contentDir.create(recursive: true);
    }

    final extension = switch (assetType) {
      .audio => 'mp3',
      .lyrics => 'ass',
      .cover => 'jpg',
    };
    return '${contentDir.path}/chant_$version.$extension';
  }

  @override
  Future<bool> fileExists(String absolutePath) => File(absolutePath).exists();

  @override
  Future<void> deleteIfExists(String absolutePath) async {
    final file = File(absolutePath);
    if (await file.exists()) {
      await file.delete();
    }
  }

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
  Future<String> sha256FromFile(String absolutePath) async {
    final bytes = await File(absolutePath).readAsBytes();
    return sha256.convert(bytes).toString();
  }

  @override
  Future<int> fileSize(String absolutePath) async {
    final file = File(absolutePath);
    if (!await file.exists()) {
      return 0;
    }
    return file.length();
  }

  Future<Directory> _rootDirectory() async {
    final appDir = await getApplicationDocumentsDirectory();
    return Directory('${appDir.path}/$_rootFolder');
  }

  @override
  Future<void> clearCache() async {
    final root = await _rootDirectory();
    if (await root.exists()) {
      await root.delete(recursive: true);
    }
  }


}
