import 'package:dhyana/enum/cached_asset_type.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract interface class ChantCacheManagerService {
  /// Builds the file path for a cached asset.
  Future<String> buildCacheFilePath({
    required String contentId,
    required CachedAssetType assetType,
    required int version,
  });

  /// Ensures that the root cache directory exists.
  Future<void> ensureCacheDirectories();

  /// Checks if a file exists at the given absolute path.
  Future<bool> fileExists(String absolutePath);

  /// Deletes the file at the given absolute path if it exists.
  Future<void> deleteIfExists(String absolutePath);

  /// Downloads a file from the given storage path
  /// to the specified local destination path.
  Future<DownloadTask> downloadToFile({
    required String storagePath,
    required String localDestinationPath,
  });

  /// Computes the SHA-256 hash of the file at the given absolute path.
  Future<String> sha256FromFile(String absolutePath);

  /// Returns the size of the file at the given absolute path in bytes.
  Future<int> fileSize(String absolutePath);

  /// Clears all cached files and directories.
  Future<void> clearCache();
}
