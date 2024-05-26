import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

abstract interface class StorageDataProvider {

  UploadTask uploadFile({
    required String fileName,
    required String path,
    required Uint8List data,
    SettableMetadata? metaData,
  });
  Future<String> getDownloadURL(String path);
  Future<void> deleteFile(String path);
  Future<List<Reference>> deleteFolder(String path);

}
