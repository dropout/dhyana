import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:dhyana/core/domain/enum/cached_asset_type.dart';
import 'package:dhyana/core/domain/entity/chant/chant.dart';
import 'package:dhyana/modules/practice/chanting/domain/entity/chant_asset_metadata.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_cache_data_repository.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:drift/drift.dart';

class ChantCacheValidationResult {
  final Chant chant;

  final bool isAudioCacheValid;
  final bool isLyricsCacheValid;

  final String? audioCachePath;
  final String? lyricsCachePath;

  final ChantCacheEntryRow? audioCacheEntry;
  final ChantCacheEntryRow? lyricsCacheEntry;

  ChantCacheValidationResult({
    required this.chant,
    required this.isAudioCacheValid,
    required this.isLyricsCacheValid,
    this.audioCachePath,
    this.lyricsCachePath,
    this.audioCacheEntry,
    this.lyricsCacheEntry,
  });

  bool get isValid => isAudioCacheValid && isLyricsCacheValid;

  bool getAssetValidity(CachedAssetType type) => switch (type) {
    .audio => isAudioCacheValid,
    .lyrics => isLyricsCacheValid,
    _ => false,
  };

  ChantCacheEntryRow? getCacheEntryForType(CachedAssetType type) =>
    switch (type) {
      .audio => audioCacheEntry,
      .lyrics => lyricsCacheEntry,
      _ => null,
    };

  String? getCachePathForType(CachedAssetType type) => switch (type) {
    .audio => audioCachePath,
    .lyrics => lyricsCachePath,
    _ => null,
  };
}

typedef AssetValidationResult = ({
  bool isValid,
  String? localAssetPath,
  ChantCacheEntryRow? entry,
});

class ChantCacheValidator with LoggerMixin {
  final ChantCacheDataRepository chantCacheRepository;

  ChantCacheValidator({
    required this.chantCacheRepository,
  });

  Future<ChantCacheValidationResult> validateChantCache(Chant chant) async {
    logger.t('Validating cache for chant: ${chant.id} - ${chant.name}');

    final audioAssetValidation = await validateChantAssetCache(
      metadata: chant.metaData,
      contentId: chant.id,
      type: .audio,
    );

    final lyricsAssetValidation = await validateChantAssetCache(
      metadata: chant.metaData,
      contentId: chant.id,
      type: .lyrics,
    );

    return ChantCacheValidationResult(
      chant: chant,
      isAudioCacheValid: audioAssetValidation.isValid,
      isLyricsCacheValid: lyricsAssetValidation.isValid,
      audioCachePath: audioAssetValidation.localAssetPath,
      lyricsCachePath: lyricsAssetValidation.localAssetPath,
    );
  }

  Future<AssetValidationResult> validateChantAssetCache({
    required ChantMetaData metadata,
    required String contentId,
    required CachedAssetType type,
  }) async {
    // Collecting metadata for the asset from remote source
    final version = metadata.getVersion(type);
    final hash = metadata.getHash(type);
    final bytes = metadata.getBytes(type);
    final remoteUpdatedAt = metadata.updatedAt.millisecondsSinceEpoch;

    // Collecting existing cache entry from local database
    final existing = await chantCacheRepository.readEntry(contentId, type);

    // If the existing entry is valid and usable, return its local file path
    if (existing != null &&
        await isCacheDataEntryUsable(existing, version, hash, bytes)) {
      await chantCacheRepository.upsertEntry(
        existing.copyWith(
          lastValidatedAtEpochMs: Value(DateTime.now().millisecondsSinceEpoch),
          remoteUpdatedAtEpochMs: remoteUpdatedAt,
        ),
      );
      return (isValid: true, localAssetPath: existing.localFilePath, entry: existing);
    }

    return (isValid: false, localAssetPath: null, entry: existing);
  }

  Future<bool> isCacheDataEntryUsable(
    ChantCacheEntryRow row,
    int expectedVersion,
    String? expectedHash,
    int? expectedBytes,
  ) async {
    if (!row.isValid) {
      logger.t('Cache entry ${row.id} is marked as invalid.');
      return false;
    }

    if (row.cachedVersion != expectedVersion) {
      logger.t(
        'Cache entry ${row.id} version mismatch: expected $expectedVersion, found ${row.cachedVersion}.',
      );
      return false;
    }

    final fileExists = await chantCacheRepository.fileExists(row.localFilePath);
    if (!fileExists) {
      logger.t(
        'Cache entry ${row.id} file does not exist at path ${row.localFilePath}.',
      );
      return false;
    }

    if (expectedHash != null && expectedHash.isNotEmpty) {
      final localHash = await chantCacheRepository.sha256FromFile(row.localFilePath);
      if (localHash != expectedHash) {
        logger.t(
          'Cache entry ${row.id} hash mismatch: expected $expectedHash, found $localHash.',
        );
        return false;
      }
    }

    if (expectedBytes != null) {
      final localBytes = await chantCacheRepository.fileSize(row.localFilePath);
      if (localBytes != expectedBytes) {
        logger.t(
          'Cache entry ${row.id} size mismatch: expected $expectedBytes, found $localBytes.',
        );
        return false;
      }
    }

    return true;
  }
}
