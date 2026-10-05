import 'dart:math';

import 'package:core/core.dart';
import 'package:chanting/src/data/service/chant_asset_downloader.dart';
import 'package:chanting/src/data/service/chant_cache_validator.dart';
import 'package:chanting/src/data/service/chant_local_resource_resolver.dart';
import 'package:chanting/src/domain/entity/caching_progress_entity.dart';
import 'package:chanting/src/domain/entity/chant_entity.dart';
import 'package:chanting/src/domain/entity/chant_local_resources_entity.dart';
import 'package:chanting/src/domain/repository/chant_cache_data_repository.dart';
import 'package:firebase_provider/firebase_provider.dart';

/// Ensures the requested chants are cached locally, 
/// streaming progress as assets are downloaded.
class CacheChantsUseCase with LoggerMixin {

  final ChantCacheRepository chantCacheRepo;
  final ChantCacheValidator chantCacheValidator;
  final ChantAssetDownloader chantAssetDownloader;
  final ChantLocalResourceResolver localResourceResolver;

  CacheChantsUseCase({
    required this.chantCacheRepo,
    required this.chantCacheValidator,
    required this.chantAssetDownloader,
    required this.localResourceResolver,
  });

  Stream<CachingProgressEntity> execute(
    List<String> chantIds,
    List<ChantEntity> availableChants,
  ) async* {
    logger.t('Preparing playable assets for ${chantIds.length} chants...');

    await chantCacheRepo.ensureCacheDirectories();

    // Only process unique chant IDs to avoid redundant work
    final uniqueIds = chantIds.toSet().toList(growable: false);

    // Check if chants are already cached and valid
    final List<ChantCacheValidationResult> validationResults = [];
    for (final contentId in uniqueIds) {
      final chant = availableChants.firstWhere(
        (chant) => chant.id == contentId,
        orElse: () => throw StateError(
          'Chant with ID $contentId not found in available chants.',
        ),
      );
      final localResource = await localResourceResolver.collectLocalResource(chant);
      final validationResult = await chantCacheValidator.validateChantCache(
        chant,
        localResource.localResources,
        chantCacheRepo,
      );
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

      final results = await _buildResults(chantIds, validationResults);
      yield CachingProgressEntity(
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
      final cachingResults = await chantAssetDownloader.cacheChantAssets(validationResult);
      downloadTasks.addAll(cachingResults.map((e) => e.downloadTask));

      // Validate the downloaded assets and update the cache entries in the database
      for (final cachingResult in cachingResults) {
        downloadValidationFutures.add(
          chantAssetDownloader.validateDownload(
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
      yield CachingProgressEntity(
        progress: min(progress, 0.99),
        totalTasks: batchDownloadTask.totalTasks,
        completedTasks: batchDownloadTask.completedTasks,
        results: [],
      );
    }

    // Wait for all download validation futures to complete before yielding the final progress update
    await Future.wait(downloadValidationFutures);

    // Yield a final progress update with all the prepared chant local resources
    final results = await _buildResults(chantIds, validationResults);

    if (results.length != chantIds.length) {
      throw StateError(
        'Mismatch between requested chant IDs and collected local resources. '
        'Requested: ${chantIds.length}, Collected: ${results.length}',
      );
    }

    yield CachingProgressEntity(
      progress: 1.0,
      totalTasks: batchDownloadTask.totalTasks,
      completedTasks: batchDownloadTask.completedTasks,
      results: results,
    );
    batchDownloadTask.dispose();
    logger.t('All chant assets have been cached and validated successfully.');
  }

  /// Builds the local resources for every requested chant ID from already-computed validation results.
  Future<List<({ChantEntity chant, ChantLocalResourcesEntity localResources})>>
  _buildResults(
    List<String> chantIds,
    List<ChantCacheValidationResult> validationResults,
  ) async {
    final results = <({ChantEntity chant, ChantLocalResourcesEntity localResources})>[];
    for (final chantId in chantIds) {
      final chant = validationResults
          .firstWhere((result) => result.chant.id == chantId)
          .chant;
      results.add((
        chant: chant,
        localResources:
            (await localResourceResolver.collectLocalResource(chant)).localResources,
      ));
    }
    return results;
  }
}
