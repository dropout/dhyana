import 'dart:typed_data';

import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';


class DefaultStorageRepository implements StorageRepository {
 
  final StorageDataProvider storageDataProvider;

  const DefaultStorageRepository({
    required this.storageDataProvider,
  });
 
  @override
  Future<void> uploadProfileImage(String profileId, Uint8List imageData) async {
    
    UploadTask uploadTask = storageDataProvider.uploadFile(
      fileName: 'photo.jpg',
      path: '/profiles/$profileId',
      data: imageData
    );
    await uploadTask.whenComplete(() => null);

  }
}