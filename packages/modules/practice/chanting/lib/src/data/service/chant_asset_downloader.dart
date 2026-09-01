import 'dart:io';

import 'package:chanting/src/domain/enum/cache_download_state.dart';
import 'package:chanting/src/domain/enum/cached_asset_type.dart';
import 'package:core/core.dart';
import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:chanting/src/data/service/chant_cache_file_system.dart';
import 'package:chanting/src/data/service/chant_cache_validator.dart';
import 'package:chanting/src/data/service/file_validation_extension.dart';
import 'package:chanting/src/domain/entity/chant_entity.dart';
import 'package:chanting/src/domain/repository/chant_cache_data_repository.dart';
import 'package:drift/drift.dart';
import 'package:firebase_provider/firebase_provider.dart';

/// Downloads a single chant asset and keeps its cache entry in sync with the download state.
class ChantAssetDownloader with LoggerMixin {

  final ChantCacheRepository chantCacheRepo;
  final ChantCacheFileSystem chantCacheFileSystem;
  final StorageDataProvider storageDataProvider;

  ChantAssetDownloader({
    required this.chantCacheRepo,
    required this.chantCacheFileSystem,
    required this.storageDataProvider,
  });

  /// Takes a chant and breaks it down into its audio and lyrics assets,
  /// caching them if necessary.
  Future<List<({DownloadTask downloadTask, ChantCacheEntryRow pendingEntry})>>
  cacheChantAssets(ChantCacheValidationResult validationResult) async {
    if (validationResult.isValid) {
      logger.t(
        'Chant ${validationResult.chant.id} is already cached and valid. No caching needed.',
      );
      return [];
    }
    final chant = validationResult.chant;
    final List<({DownloadTask downloadTask, ChantCacheEntryRow pendingEntry})>
    tasks = [];
    if (!validationResult.isAudioCacheValid) {
      tasks.add(
        await cacheChantAsset(chant, .audio, validationResult.audioCacheEntry),
      );
    }
    if (!validationResult.isLyricsCacheValid) {
      tasks.add(
        await cacheChantAsset(
          chant,
          .lyrics,
          validationResult.lyricsCacheEntry,
        ),
      );
    }
    return tasks;
  }

  /// Actual caching of a chant asset, including downloading the file
  /// and creating/updating the cache entry in the database
  Future<({DownloadTask downloadTask, ChantCacheEntryRow pendingEntry})>
  cacheChantAsset(
    ChantEntity chant,
    CachedAssetType assetType,
    ChantCacheEntryRow? existing,
  ) async {
    // Collect data required for the caching operation
    final storagePath = chant.metaData.getStoragePath(assetType);
    final version = chant.metaData.getVersion(assetType);
    final hash = chant.metaData.getHash(assetType);
    final bytes = chant.metaData.getBytes(assetType);
    final remoteUpdatedAt = chant.metaData.updatedAt.millisecondsSinceEpoch;
    final destinationPath = await chantCacheFileSystem.buildCacheFilePath(
      contentId: chant.id,
      assetType: assetType,
      version: version,
    );

    try {
      // If an entry already exists, delete the existing file to avoid conflicts
      if (existing != null) {
        await File(existing.localFilePath).deleteIfExists();
      }

      // Create a new cache entry in the database to track the download state
      final now = DateTime.now().millisecondsSinceEpoch;
      final pendingEntry = ChantCacheEntryRow(
        id: '${chant.id}:${assetType.name}',
        contentId: chant.id,
        assetType: assetType.name,
        storagePath: storagePath,
        localFilePath: destinationPath,
        cachedVersion: version,
        remoteUpdatedAtEpochMs: remoteUpdatedAt,
        remoteHash: hash,
        remoteBytes: bytes,
        isValid: false,
        downloadState: CacheDownloadState.downloading.name,
        failureCount: existing?.failureCount ?? 0,
        lastError: null,
        lastValidatedAtEpochMs: null,
        createdAtEpochMs: existing?.createdAtEpochMs ?? now,
        updatedAtEpochMs: now,
      );
      await chantCacheRepo.upsertEntry(pendingEntry);

      // Start the download task for the asset
      final downloadTask = await storageDataProvider.downloadFile(
        storagePath: storagePath,
        destinationPath: destinationPath,
      );

      logger.t('Starting downloading chant asset $storagePath to $destinationPath');

      // Listen to the download task's snapshot events to log progress and handle errors
      downloadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
        switch (snapshot.state) {
          case TaskState.running:
            break;
          case TaskState.success:
            logger.t(
              'Download completed for chant ${chant.id} - ${assetType.name}',
            );
            break;
          case _:
            logger.e(
              'Download error for chant ${chant.id} - ${assetType.name}',
            );
            // If the download fails and there was no existing entry,
            // delete the partially downloaded file to avoid leaving corrupted files
            if (existing == null) {
              File(destinationPath).deleteIfExists();
            }

            // Mark the entry as failed in the database and log the error
            _handleDownloadError(
              contentId: chant.id,
              type: assetType,
              destinationPath: destinationPath,
              error: 'Download error occurred - ${snapshot.state.name}',
            );

            break;
        }
      });

      return (downloadTask: downloadTask, pendingEntry: pendingEntry);
    } catch (e) {
      // Mark the entry as failed in the database
      _handleDownloadError(
        contentId: chant.id,
        type: assetType,
        destinationPath: destinationPath,
        error: e,
      );
      rethrow;
    }

    // TODO: If there is an old entry available cached, and new version is failed to download, we can use the old entry as a fallback.
    // } on SocketException {
    //   // Network error occurred, check if the existing entry is usable
    //   // If it is, return its local file path; otherwise, rethrow the exception
    //   if (existing != null &&
    //       await cacheManager.fileExists(existing.localFilePath)) {
    //     return existing.localFilePath;
    //   }
    //   rethrow;
    // } catch (e) {
    //   await cacheDataProvider.markState(
    //     contentId: contentId,
    //     assetType: type,
    //     state: CacheDownloadState.failed,
    //     lastError: e.toString(),
    //   );
    //   await cacheManager.deleteIfExists(destinationPath);
    //   rethrow;
    // }

    // return cacheManager.downloadToFile(
    //   storagePath: storagePath,
    //   localDestinationPath: localDestinationPath,
    // );
  }

  /// When a download task completes, validate the downloaded
  /// file and update the cache entry in the database
  Future<void> validateDownload(
    DownloadTask task,
    ChantEntity chant,
    ChantCacheValidationResult validationResult,
    String destinationPath,
    ChantCacheEntryRow pendingEntry,
  ) async {
    await task.whenComplete(() => logger.t(
      'Validating download for chant ${chant.id} - ${pendingEntry.assetType} at $destinationPath',
    ));

    final remoteHash = validationResult.chant.metaData.getHash(
      CachedAssetType.values.byName(pendingEntry.assetType),
    );
    final remoteBytes = validationResult.chant.metaData.getBytes(
      CachedAssetType.values.byName(pendingEntry.assetType),
    );

    final downloadedHash = await File(destinationPath).sha256();
    final downloadedBytes = await File(destinationPath).size();

    if (downloadedHash.isNotEmpty && remoteHash != downloadedHash) {
      throw const FileSystemException('Downloaded file hash mismatch.');
    }
    if (remoteBytes != downloadedBytes) {
      throw const FileSystemException('Downloaded file size mismatch.');
    }

    final completedAt = DateTime.now().millisecondsSinceEpoch;
    await chantCacheRepo.upsertEntry(
      pendingEntry.copyWith(
        isValid: true,
        downloadState: CacheDownloadState.complete.name,
        remoteHash: Value(downloadedHash),
        remoteBytes: Value(downloadedBytes),
        lastValidatedAtEpochMs: Value(completedAt),
        updatedAtEpochMs: completedAt,
      ),
    );
  }

  /// Marks the entry as failed
  void _handleDownloadError({
    required String contentId,
    required CachedAssetType type,
    required String destinationPath,
    required Object? error,
  }) async {
    await chantCacheRepo.markState(
      contentId: contentId,
      assetType: type,
      state: CacheDownloadState.failed,
      lastError: error?.toString(),
    );
  }
}
