import 'package:dhyana/data_provider/storage_data_provider.dart';

abstract class ResourceResolver {

  StorageDataProvider storageDataProvider;

  ResourceResolver({required this.storageDataProvider});

  /// Resolves a storage path to a download URL.
  Future<String> resolveStoragePath(String path) =>
    storageDataProvider.getDownloadURL(path);

  Future<String> getProfileImageUrl(String profileId);
  Future<String> getChantAudioUrl(String chantId);
  Future<String> getChantLyricsUrl(String chantId);

}
