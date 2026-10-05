import 'package:chanting/src/domain/entity/chant_metadata_entity.dart';
import 'package:chanting/src/public/model/chant_meta_data.dart';

extension ChantMetaDataEntityMapper on ChantMetaDataEntity {
  ChantMetaData toApi() {
    return ChantMetaData(
      id: id,
      audioVersion: audioVersion,
      lyricsVersion: lyricsVersion,
      coverVersion: coverVersion,
      audioSha256: audioSha256,
      lyricsSha256: lyricsSha256,
      coverSha256: coverSha256,
      audioBytes: audioBytes,
      lyricsBytes: lyricsBytes,
      coverBytes: coverBytes,
      updatedAt: updatedAt,
    );
  }
}

extension ChantMetaDataMapper on ChantMetaData {
  ChantMetaDataEntity toDomain() {
    return ChantMetaDataEntity(
      id: id,
      audioVersion: audioVersion,
      lyricsVersion: lyricsVersion,
      coverVersion: coverVersion,
      audioSha256: audioSha256,
      lyricsSha256: lyricsSha256,
      coverSha256: coverSha256,
      audioBytes: audioBytes,
      lyricsBytes: lyricsBytes,
      coverBytes: coverBytes,
      updatedAt: updatedAt,
    );
  }
}
