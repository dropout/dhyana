import 'package:chanting/src/domain/repository/chant_cache_data_repository.dart';
import 'package:core/core.dart';

class ChantingCacheClearCapability implements ClearCacheCapability {
  final ChantCacheRepository chantCacheRepository;

  const ChantingCacheClearCapability({required this.chantCacheRepository});

  @override
  Future<void> call() => chantCacheRepository.clearCache();
}
