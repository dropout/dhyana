import 'dart:io';

import 'package:dhyana/core/domain/enum/cached_asset_type.dart';

/// Manages the on-disk layout of cached chant assets.
class ChantCacheFileSystem {

  static const _rootFolder = 'chant_cache';

  final Future<Directory> Function() documentsDirectoryProvider;

  ChantCacheFileSystem({required this.documentsDirectoryProvider});

  Future<void> ensureCacheDirectories() async {
    final root = await _rootDirectory();
    if (!await root.exists()) {
      await root.create(recursive: true);
    }
  }

  Future<String> buildCacheFilePath({
    required String contentId,
    required CachedAssetType assetType,
    required int version,
  }) async {
    final root = await _rootDirectory();
    final contentDir = Directory('${root.path}/$contentId');
    if (!await contentDir.exists()) {
      await contentDir.create(recursive: true);
    }

    final extension = switch (assetType) {
      .audio => 'mp3',
      .lyrics => 'ass',
      .cover => 'jpg',
    };
    return '${contentDir.path}/chant_$version.$extension';
  }

  Future<void> clearCache() async {
    final root = await _rootDirectory();
    if (await root.exists()) {
      await root.delete(recursive: true);
    }
  }

  Future<Directory> _rootDirectory() async {
    final documentsDir = await documentsDirectoryProvider();
    return Directory('${documentsDir.path}/$_rootFolder');
  }
}
