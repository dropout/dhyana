import 'dart:typed_data';

import 'package:dhyana/data_provider/storage_data_provider.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseStorageDataProvider implements StorageDataProvider {

  final FirebaseStorage storage;

  const FirebaseStorageDataProvider(this.storage);

  @override
  UploadTask uploadFile({
    required String path,
    required String fileName,
    required Uint8List data,
    SettableMetadata? metaData,
  }) {
    Reference ref = storage.ref().child(path).child(fileName);
    return ref.putData(data, metaData);
  }

  @override
  Future<String> getDownloadURL(String path) {
    Reference ref = storage.ref().child(path);
    return ref.getDownloadURL();
  }

  @override
  Future<List<Reference>> deleteFolder(String path) async {
    ListResult result = await storage.ref(path).listAll();
    for(var item in result.items) {
      await item.delete();
    }
    return result.items;
  }

  @override
  Future<void> deleteFile(String path) {
    return storage.ref('path').delete();
  }

}
