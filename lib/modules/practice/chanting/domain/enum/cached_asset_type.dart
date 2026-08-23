enum CachedAssetType { audio, lyrics, cover }

extension CachedAssetTypePathExtension on CachedAssetType {
  String get defaultFileName {
    switch (this) {
      case CachedAssetType.audio:
        return 'chant.mp3';
      case CachedAssetType.lyrics:
        return 'chant.ass';
      case CachedAssetType.cover:
        return 'cover.jpg';
    }
  }

}
