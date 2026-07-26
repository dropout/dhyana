import 'dart:typed_data';

abstract interface class StorageRepository {

  Future<void> uploadProfileImage(String profileId, Uint8List imageData);
  
}