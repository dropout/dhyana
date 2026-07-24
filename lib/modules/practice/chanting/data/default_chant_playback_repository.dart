import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:dhyana/modules/practice/chanting/infrastructure/chant_cache_validator.dart';
import 'package:dhyana/modules/practice/chanting/domain/chants_data_provider.dart';
import 'package:dhyana/core/data/datasource/tools/batch_download_task.dart';
import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:dhyana/core/domain/enum/cache_download_state.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/caching_progress.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant.dart';
import 'package:dhyana/modules/practice/chanting/domain/model/chant_local_resources.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:dhyana/modules/practice/chanting/domain/chant_cache_data_provider.dart';
import 'package:dhyana/core/data/datasource/storage_data_provider.dart';
import 'package:dhyana/core/domain/enum/cached_asset_type.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_playback_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chant_cache_manager_service.dart';
import 'package:drift/drift.dart';
import 'package:firebase_storage/firebase_storage.dart';

class DefaultChantPlaybackRepository
    with LoggerMixin
    implements ChantPlaybackRepository {
  final ChantsDataProvider chantsDataProvider;
  final ChantCacheDataProvider cacheDataProvider;
  final StorageDataProvider storageDataProvider;
  final ChantCacheManagerService cacheManager;
  final ChantCacheValidator cacheValidator;

  DefaultChantPlaybackRepository({
    required this.chantsDataProvider,
    required this.cacheDataProvider,
    required this.storageDataProvider,
    required this.cacheManager,
    required this.cacheValidator,
  });

  @override
  Stream<CachingProgress> preparePlayableAssets(List<String> chantIds) async* {
    logger.t('Preparing playable assets for ${chantIds.length} chants...');

    await cacheManager.ensureCacheDirectories();

    // Only process unique chant IDs to avoid redundant work
    final uniqueIds = chantIds.toSet().toList(growable: false);

    // Check if chants are already cached and valid
    final List<ChantCacheValidationResult> validationResults = [];
    for (final contentId in uniqueIds) {
      final chant = await chantsDataProvider.read(contentId);
      final validationResult = await cacheValidator.validateChantCache(chant);
      validationResults.add(validationResult);
    }

    // Collect invalid chants that need to be cached
    final invalidChants = validationResults
        .where((validationResult) => (validationResult.isValid == false))
        .toList();

    // If there are no invalid chants, yield a final progress update with all
    // the prepared chant local resources
    if (invalidChants.isEmpty) {
      logger.t('All chant cache entries are valid. No caching needed.');

      // Build the list of local resources for all chants requested
      List<({Chant chant, ChantLocalResources localResources})> results = [];
      for (final chantId in chantIds) {
        final chant = validationResults
            .firstWhere((result) => result.chant.id == chantId)
            .chant;
        results.add((
          chant: chant,
          localResources: (await collectLocalResource(chant)).localResources,
        ));
      }

      yield CachingProgress(
        progress: 1.0,
        totalTasks: results.length,
        completedTasks: results.length,
        results: results,
      );
      return;
    }

    logger.t(
      'Found ${invalidChants.length} chant(s) with invalid cache. Caching chant assets now...',
    );

    // Collect download tasks and validation Futures for all
    // chant assets that need to be cached
    final List<DownloadTask> downloadTasks = [];
    final List<Future<void>> downloadValidationFutures = [];
    for (final invalidResult in invalidChants) {
      final chant = invalidResult.chant;
      final validationResult = invalidResult;

      // Get the download tasks for the invalid chant assets
      final cachingResults = await cacheChantAssets(validationResult);
      downloadTasks.addAll(cachingResults.map((e) => e.downloadTask));

      // Validate the downloaded assets and update the cache entries in the database
      for (final cachingResult in cachingResults) {
        downloadValidationFutures.add(
          _validateDownload(
            cachingResult.downloadTask,
            chant,
            validationResult,
            cachingResult.pendingEntry.localFilePath,
            cachingResult.pendingEntry,
          ),
        );
      }
    }

    // Assemble a BatchDownloadTask to manage the download of all tasks
    final batchDownloadTask = BatchDownloadTask(downloadTasks);


    // Yield progress updates as the batch download progresses
    await for (final progress in batchDownloadTask.progressStream) {
      // Ensure that progress doesn't reach 1.0 until all downloads are validated, 
      // to avoid premature completion
      yield CachingProgress(
        progress: min(progress, 0.99), 
        totalTasks: batchDownloadTask.totalTasks,
        completedTasks: batchDownloadTask.completedTasks,
        results: []
      );
    }

    // Wait for all download validation futures to complete before yielding the final progress update
    await Future.wait(downloadValidationFutures);

    // Yield a final progress update with all the prepared chant local resources,
    List<({Chant chant, ChantLocalResources localResources})> results = [];
    for (final chantId in chantIds) {
      final chant = validationResults
          .firstWhere((result) => result.chant.id == chantId)
          .chant;
      results.add((
        chant: chant,
        localResources: (await collectLocalResource(chant)).localResources,
      ));
    }

    if (results.length != chantIds.length) {
      throw StateError(
        'Mismatch between requested chant IDs and collected local resources. '
        'Requested: ${chantIds.length}, Collected: ${results.length}',
      );
    }

    yield CachingProgress(
      progress: 1.0,
      totalTasks: batchDownloadTask.totalTasks,
      completedTasks: batchDownloadTask.completedTasks,
      results: results
    );
    batchDownloadTask.dispose();
    logger.t('All chant assets have been cached and validated successfully.');
  }

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
    Chant chant,
    CachedAssetType assetType,
    ChantCacheEntryRow? existing,
  ) async {
    // Collect data required for the caching operation
    final storagePath = chant.metaData.getStoragePath(assetType);
    final version = chant.metaData.getVersion(assetType);
    final hash = chant.metaData.getHash(assetType);
    final bytes = chant.metaData.getBytes(assetType);
    final remoteUpdatedAt = chant.metaData.updatedAt.millisecondsSinceEpoch;
    final destinationPath = await cacheManager.buildCacheFilePath(
      contentId: chant.id,
      assetType: assetType,
      version: version,
    );

    try {
      // If an entry already exists, delete the existing file to avoid conflicts
      if (existing != null) {
        await cacheManager.deleteIfExists(existing.localFilePath);
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
      await cacheDataProvider.upsertEntry(pendingEntry);

      // Start the download task for the asset
      final downloadTask = await cacheManager.downloadToFile(
        storagePath: storagePath,
        localDestinationPath: destinationPath,
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
              cacheManager.deleteIfExists(destinationPath);
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

  /// Collects the local resources for a given chant, 
  /// including audio and lyrics file paths.
  Future<({String chantId, ChantLocalResources localResources})>
  collectLocalResource(Chant chant) async {
    final metadata = chant.metaData;
    final audioPath = await cacheManager.buildCacheFilePath(
      contentId: chant.id,
      assetType: CachedAssetType.audio,
      version: metadata.audioVersion,
    );
    final lyricsPath = await cacheManager.buildCacheFilePath(
      contentId: chant.id,
      assetType: CachedAssetType.lyrics,
      version: metadata.lyricsVersion,
    );
    return (
      chantId: chant.id,
      localResources: ChantLocalResources(
        chant: chant,        
        audioLocalPath: audioPath,
        lyricsLocalPath: lyricsPath,
        audioVersion: metadata.audioVersion,
        lyricsVersion: metadata.lyricsVersion,
      ),
    );
  }

  /// Batch collects the local resources for a list of chants, 
  /// returning a list of tuples containing the chant ID and 
  /// its corresponding local resources.
  Future<List<({String chantId, ChantLocalResources localResources})>>
  collectLocalResources(List<Chant> chants) async {
    final localResources =
        <({String chantId, ChantLocalResources localResources})>[];
    for (final chant in chants) {
      localResources.add(await collectLocalResource(chant));
    }
    return localResources;
  }

  @override
  Future<void> clearCache() async {
    await cacheManager.clearCache();
    await cacheDataProvider.deleteAllEntries();
  }

  /// When a download task completes, validate the downloaded 
  /// file and update the cache entry in the database
  Future<void> _validateDownload(
    DownloadTask task,
    Chant chant,
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
    final downloadedHash = await cacheManager.sha256FromFile(destinationPath);
    final downloadedBytes = await cacheManager.fileSize(destinationPath);

    if (downloadedHash.isNotEmpty && remoteHash != downloadedHash) {
      throw const FileSystemException('Downloaded file hash mismatch.');
    }
    if (remoteBytes != downloadedBytes) {
      throw const FileSystemException('Downloaded file size mismatch.');
    }

    final completedAt = DateTime.now().millisecondsSinceEpoch;
    await cacheDataProvider.upsertEntry(
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
    await cacheDataProvider.markState(
      contentId: contentId,
      assetType: type,
      state: CacheDownloadState.failed,
      lastError: error?.toString(),
    );
  }
}
