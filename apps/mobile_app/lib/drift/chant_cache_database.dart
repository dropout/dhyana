import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

part 'chant_cache_database.g.dart';

@DataClassName('ChantCacheEntryRow')
class ChantCacheEntries extends Table {
  @override
  String get tableName => 'chant_cache_entries';

  TextColumn get id => text()();
  TextColumn get contentId => text()();
  TextColumn get assetType => text()();
  TextColumn get storagePath => text()();
  TextColumn get localFilePath => text()();
  IntColumn get cachedVersion => integer()();
  IntColumn get remoteUpdatedAtEpochMs => integer()();
  TextColumn get remoteHash => text().nullable()();
  IntColumn get remoteBytes => integer().nullable()();
  BoolColumn get isValid => boolean().withDefault(const Constant(false))();
  TextColumn get downloadState => text().withDefault(const Constant('pending'))();
  IntColumn get failureCount => integer().withDefault(const Constant(0))();
  TextColumn get lastError => text().nullable()();
  IntColumn get lastValidatedAtEpochMs => integer().nullable()();
  IntColumn get createdAtEpochMs => integer()();
  IntColumn get updatedAtEpochMs => integer()();

  @override
  Set<Column<Object>> get primaryKey => {id};

  @override
  List<Set<Column<Object>>> get uniqueKeys => [
    {contentId, assetType},
  ];

  @override
  List<String> get customConstraints => const [
    'CHECK(asset_type IN (\'audio\', \'lyrics\'))',
  ];
}

@DriftDatabase(tables: [ChantCacheEntries])
class ChantCacheDatabase extends _$ChantCacheDatabase {
  ChantCacheDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbDir = Directory('${appDir.path}/db');
    if (!await dbDir.exists()) {
      await dbDir.create(recursive: true);
    }

    final dbFile = File('${dbDir.path}/chant_cache.sqlite');
    return NativeDatabase.createInBackground(dbFile);
  });
}
