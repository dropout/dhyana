import 'package:dhyana/enum/cached_asset_type.dart';
import 'package:dhyana/model/converter/date_time_converter.dart';
import 'package:dhyana/model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chant_asset_metadata.freezed.dart';
part 'chant_asset_metadata.g.dart';

@freezed
sealed class ChantMetaData with _$ChantMetaData implements Model {
  const ChantMetaData._();

  const factory ChantMetaData({
    required String id,
    required int audioVersion,
    required int lyricsVersion,
    required int coverVersion,
    required String audioSha256,
    required String lyricsSha256,
    required String coverSha256,
    required int audioBytes,
    required int lyricsBytes,
    required int coverBytes,
    @DateTimeConverter() required DateTime updatedAt,
  }) = _ChantMetaData;

  factory ChantMetaData.fromJson(Map<String, Object?> json) =>
    _$ChantMetaDataFromJson(json);

  String getStoragePath(CachedAssetType type) {
    switch (type) {
      case CachedAssetType.audio:
        return '/chants/$id/${type.defaultFileName}';
      case CachedAssetType.lyrics:
        return '/chants/$id/${type.defaultFileName}';
      case CachedAssetType.cover:
        return '/chants/$id/${type.defaultFileName}';
    }
  }

  int getVersion(CachedAssetType type) {
    switch (type) {
      case CachedAssetType.audio:
        return audioVersion;
      case CachedAssetType.lyrics:
        return lyricsVersion;
      case CachedAssetType.cover:
        return coverVersion;
    }
  }

  String getHash(CachedAssetType type) {
    switch (type) {
      case CachedAssetType.audio:
        return audioSha256;
      case CachedAssetType.lyrics:
        return lyricsSha256;
      case CachedAssetType.cover:
        return coverSha256;
    }
  }

  int getBytes(CachedAssetType type) {
    switch (type) {
      case CachedAssetType.audio:
        return audioBytes;
      case CachedAssetType.lyrics:
        return lyricsBytes;
      case CachedAssetType.cover:
        return coverBytes;
    }
  }

}
