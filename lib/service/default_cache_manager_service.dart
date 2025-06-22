import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'cache_manager_service.dart';

/// A cache manager service that CachedNetworkImage uses by default.
/// This is useful for testing purposes, as you can provide a mock
/// cache manager service to the widget tree.
/// Since network calls will fail with 400 Bad Request in tests.
class DefaultCacheManagerService implements CacheManagerService {

  final BaseCacheManager _cacheManager = DefaultCacheManager();

  @override
  BaseCacheManager get cacheManager => _cacheManager;

}
