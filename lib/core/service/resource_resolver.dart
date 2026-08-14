import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';

abstract class ResourceResolver {

  StorageDataProvider storageDataProvider;

  ResourceResolver({required this.storageDataProvider});

  /// Resolves a storage path to a download URL.
  Future<String> resolveStoragePath(String path) =>
    storageDataProvider.getDownloadURL(path);

}
