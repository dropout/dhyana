import 'package:chanting/src/data/mapper/chant_mapper.dart';
import 'package:chanting/src/domain/repository/chant_cache_data_repository.dart';
import 'package:chanting/src/domain/repository/chant_repository.dart';
import 'package:chanting/src/public/api/chanting_public_api.dart';
import 'package:chanting/src/public/model/chant.dart';

class DefaultChantingPublicApi implements ChantingPublicApi {
  final ChantRepository chantRepository;
  final ChantCacheRepository chantCacheRepository;

  DefaultChantingPublicApi({
    required this.chantRepository,
    required this.chantCacheRepository,
  });

  @override
  Future<List<Chant>> loadChants({bool preferCache = false}) => chantRepository
      .queryAll(preferCache: preferCache)
      .then(
        (chantEntities) =>
            chantEntities.map((entity) => entity.toApi()).toList(),
      );

  @override
  Stream<List<Chant>> get chantsStream => chantRepository.queryAllStream().map(
    (chantEntities) => chantEntities.map((entity) => entity.toApi()).toList(),
  );

  @override
  Future<void> clearCachedChants() => chantCacheRepository.clearCache();
}
