import 'package:dhyana/core/service/module/chanting_service.dart';
import 'package:dhyana/core/domain/entity/chant/chant.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_cache_data_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_repository.dart';

class DefaultChantingService implements ChantingService {

  final ChantRepository chantRepository;
  final ChantCacheDataRepository chantCacheRepository;

  DefaultChantingService({
    required this.chantRepository,
    required this.chantCacheRepository,
  });
  
  @override
  Future<List<Chant>> loadChants() async {
    return chantRepository.queryAll();
  }

  @override
  Future<void> clearCache() async => chantCacheRepository.clearCache();

}