import 'package:chanting/src/data/mapper/chant_mapper.dart';
import 'package:chanting/src/domain/entity/chant_local_resources_entity.dart';
import 'package:chanting/src/public/model/chant_local_resources.dart';

extension ChantLocalResourcesEntityMapper on ChantLocalResourcesEntity {
  ChantLocalResources toApi() {
    return ChantLocalResources(
      chant: chant.toApi(),
      audioLocalPath: audioLocalPath,
      lyricsLocalPath: lyricsLocalPath,
      audioVersion: audioVersion,
      lyricsVersion: lyricsVersion,
      usedStaleCache: usedStaleCache,
    );
  }
}

extension ChantLocalResourcesMapper on ChantLocalResources {
  ChantLocalResourcesEntity toDomain() {
    return ChantLocalResourcesEntity(
      chant: chant.toDomain(),
      audioLocalPath: audioLocalPath,
      lyricsLocalPath: lyricsLocalPath,
      audioVersion: audioVersion,
      lyricsVersion: lyricsVersion,
      usedStaleCache: usedStaleCache,
    );
  }
}
