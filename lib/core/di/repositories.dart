import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:get_it/get_it.dart';

/// Container class for all repositories used in the application.
/// Injected as a dependency with Provider, and accessible via BuildContext
/// extension convenience methods.
class Repositories {
  // final AuthRepository authRepository;
  late final StatisticsRepository statisticsRepository;
  Repositories() {
    statisticsRepository = GetIt.I.get<StatisticsRepository>();
  }
}

/// Builder class for Repositories to improve init code structure and
/// allow customization of individual repositories to improve
/// developer experience by providing easy way to stub data.
class RepositoriesBuilder {

  // Default constructor initializing with Firebase implementations
  RepositoriesBuilder() {
    // _chantsRepository = FirebaseChantsRepository(
    //   chantsDataProvider: FirebaseChantsDataProvider(
    //     firebaseProvider.firestore,
    //   ),
    // );

    // final cacheManager = DefaultChantCacheManagerService(
    //   storageDataProvider: GetIt.I.get<StorageDataProvider>(),
    // );
    // final cacheDataProvider = DriftChantCacheDataProvider(ChantCacheDatabase());

    // _chantPlaybackRepository = DefaultChantPlaybackRepository(
    //   chantsDataProvider: FirebaseChantsDataProvider(
    //     firebaseProvider.firestore,
    //   ),
    //   cacheDataProvider: cacheDataProvider,
    //   storageDataProvider: GetIt.I.get<StorageDataProvider>(),
    //   cacheManager: cacheManager,
    //   cacheValidator: ChantCacheValidator(
    //     cacheManager: cacheManager, 
    //     cacheDataProvider: cacheDataProvider
    //   ),
    // );
  }

  // Build the final Repositories object
  Repositories build() {
    return Repositories();
  }
}
