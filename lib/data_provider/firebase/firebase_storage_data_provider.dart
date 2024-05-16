import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

import '../storage_data_provider.dart';

class FirebaseStorageDataProvider implements StorageDataProvider {

  final FirebaseStorage storage;

  const FirebaseStorageDataProvider(this.storage);

  @override
  UploadTask uploadFile({
    required String fileName,
    required String path,
    required Uint8List data
  }) {
    Reference ref = storage.ref().child(path).child(fileName);
    UploadTask uploadTask = _uploadData(
      ref: ref,
      data: data,
    );
    return uploadTask;
  }

  @override
  Future<String> getDownloadURL(String path) {
    Reference ref = storage.ref().child(path);
    return ref.getDownloadURL();
  }

  UploadTask _uploadData({
    required Reference ref,
    required Uint8List data,
    SettableMetadata? metadata,
  }) {
    return ref.putData(data, metadata);
  }

}
