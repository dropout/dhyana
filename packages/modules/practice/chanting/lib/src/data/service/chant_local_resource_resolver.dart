import 'package:chanting/src/data/service/chant_cache_file_system.dart';
import 'package:chanting/src/domain/entity/chant_entity.dart';
import 'package:chanting/src/domain/entity/chant_local_resources_entity.dart';

/// Maps chants to their expected local cache file paths.
class ChantLocalResourceResolver {

  final ChantCacheFileSystem chantCacheFileSystem;

  ChantLocalResourceResolver({required this.chantCacheFileSystem});

  Future<({String chantId, ChantLocalResourcesEntity localResources})>
  collectLocalResource(ChantEntity chant) async {
    final metadata = chant.metaData;
    final audioPath = await chantCacheFileSystem.buildCacheFilePath(
      contentId: chant.id,
      assetType: .audio,
      version: metadata.audioVersion,
    );
    final lyricsPath = await chantCacheFileSystem.buildCacheFilePath(
      contentId: chant.id,
      assetType: .lyrics,
      version: metadata.lyricsVersion,
    );
    return (
      chantId: chant.id,
      localResources: ChantLocalResourcesEntity(
        chant: chant,
        audioLocalPath: audioPath,
        lyricsLocalPath: lyricsPath,
        audioVersion: metadata.audioVersion,
        lyricsVersion: metadata.lyricsVersion,
      ),
    );
  }

  Future<List<({String chantId, ChantLocalResourcesEntity localResources})>>
  collectLocalResources(List<ChantEntity> chants) async {
    final localResources =
        <({String chantId, ChantLocalResourcesEntity localResources})>[];
    for (final chant in chants) {
      localResources.add(await collectLocalResource(chant));
    }
    return localResources;
  }
}
