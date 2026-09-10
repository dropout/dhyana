import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';

LazyDatabase openChantCacheConnection() {
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
