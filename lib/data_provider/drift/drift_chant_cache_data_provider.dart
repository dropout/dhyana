import 'package:drift/drift.dart';
import 'package:dhyana/data_provider/chant_cache_data_provider.dart';
import 'package:dhyana/enum/cache_download_state.dart';
import 'package:dhyana/enum/cached_asset_type.dart';
import 'package:dhyana/drift/chant_cache_database.dart';

class DriftChantCacheDataProvider implements ChantCacheDataProvider {
  final ChantCacheDatabase db;

  const DriftChantCacheDataProvider(this.db);

  @override
  Future<ChantCacheEntryRow?> readEntry(
    String contentId,
    CachedAssetType type,
  ) async {
    final query = db.select(db.chantCacheEntries)
      ..where((tbl) => tbl.contentId.equals(contentId))
      ..where((tbl) => tbl.assetType.equals(type.name))
      ..limit(1);
    return query.getSingleOrNull();
  }

  @override
  Future<void> upsertEntry(ChantCacheEntryRow row) async {
    await db
        .into(db.chantCacheEntries)
        .insertOnConflictUpdate(_toCompanion(row));
  }

  @override
  Future<void> markState({
    required String contentId,
    required CachedAssetType assetType,
    required CacheDownloadState state,
    String? lastError,
  }) async {
    final now = DateTime.now().millisecondsSinceEpoch;
    await (db.update(db.chantCacheEntries)
          ..where((tbl) => tbl.contentId.equals(contentId))
          ..where((tbl) => tbl.assetType.equals(assetType.name)))
        .write(
          ChantCacheEntriesCompanion(
            downloadState: Value(state.name),
            lastError: Value(lastError),
            updatedAtEpochMs: Value(now),
            failureCount: Value.absentIfNull(
              state == CacheDownloadState.failed ? null : 0,
            ),
          ),
        );

    if (state == CacheDownloadState.failed) {
      await db.customStatement(
        'UPDATE chant_cache_entries SET failure_count = failure_count + 1 '
        'WHERE content_id = ? AND asset_type = ?',
        [contentId, assetType.name],
      );
    }
  }

  @override
  Future<void> deleteEntry(String contentId, CachedAssetType type) async {
    await (db.delete(db.chantCacheEntries)
          ..where((tbl) => tbl.contentId.equals(contentId))
          ..where((tbl) => tbl.assetType.equals(type.name)))
        .go();
  }

  ChantCacheEntriesCompanion _toCompanion(ChantCacheEntryRow row) {
    return ChantCacheEntriesCompanion(
      id: Value(row.id),
      contentId: Value(row.contentId),
      assetType: Value(row.assetType),
      storagePath: Value(row.storagePath),
      localFilePath: Value(row.localFilePath),
      cachedVersion: Value(row.cachedVersion),
      remoteUpdatedAtEpochMs: Value(row.remoteUpdatedAtEpochMs),
      remoteHash: Value(row.remoteHash),
      remoteBytes: Value(row.remoteBytes),
      isValid: Value(row.isValid),
      downloadState: Value(row.downloadState),
      failureCount: Value(row.failureCount),
      lastError: Value(row.lastError),
      lastValidatedAtEpochMs: Value(row.lastValidatedAtEpochMs),
      createdAtEpochMs: Value(row.createdAtEpochMs),
      updatedAtEpochMs: Value(row.updatedAtEpochMs),
    );
  }

  @override
  Future<void> deleteAllEntries() async {
    await db.delete(db.chantCacheEntries).go();
  }
  
}
