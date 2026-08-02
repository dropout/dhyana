import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/practice/chanting/infrastructure/chant_cache_validator.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/drift_chant_cache_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/firebase_chants_data_provider.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_playback_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chants_repository.dart';
import 'package:dhyana/modules/practice/chanting/data/repository/default_chant_playback_repository.dart';
import 'package:dhyana/modules/practice/chanting/data/repository/firebase_chants_repository.dart';
import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:dhyana/modules/practice/chanting/infrastructure/default_chant_cache_manager_service.dart';
import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:get_it/get_it.dart';

/// Container class for all repositories used in the application.
/// Injected as a dependency with Provider, and accessible via BuildContext
/// extension convenience methods.
class Repositories {
  // final AuthRepository authRepository;
  final ChantsRepository chantsRepository;
  late final StatisticsRepository statisticsRepository;
  final ChantPlaybackRepository chantPlaybackRepository;

  Repositories({
    required this.chantsRepository,
    required this.chantPlaybackRepository,
  }) {
    statisticsRepository = GetIt.I.get<StatisticsRepository>();
  }
}

/// Builder class for Repositories to improve init code structure and
/// allow customization of individual repositories to improve
/// developer experience by providing easy way to stub data.
class RepositoriesBuilder {
  late ChantsRepository _chantsRepository;
  late ChantPlaybackRepository _chantPlaybackRepository;

  // Default constructor initializing with Firebase implementations
  RepositoriesBuilder({
    required FirebaseProvider firebaseProvider,
  }) {
    _chantsRepository = FirebaseChantsRepository(
      chantsDataProvider: FirebaseChantsDataProvider(
        firebaseProvider.firestore,
      ),
    );

    final cacheManager = DefaultChantCacheManagerService(
      storageDataProvider: GetIt.I.get<StorageDataProvider>(),
    );
    final cacheDataProvider = DriftChantCacheDataProvider(ChantCacheDatabase());

    _chantPlaybackRepository = DefaultChantPlaybackRepository(
      chantsDataProvider: FirebaseChantsDataProvider(
        firebaseProvider.firestore,
      ),
      cacheDataProvider: cacheDataProvider,
      storageDataProvider: GetIt.I.get<StorageDataProvider>(),
      cacheManager: cacheManager,
      cacheValidator: ChantCacheValidator(
        cacheManager: cacheManager, 
        cacheDataProvider: cacheDataProvider
      ),
    );
  }


  RepositoriesBuilder chantsRepository(ChantsRepository repo) {
    _chantsRepository = repo;
    return this;
  }

  RepositoriesBuilder chantPlaybackRepository(ChantPlaybackRepository repo) {
    _chantPlaybackRepository = repo;
    return this;
  }

  // Build the final Repositories object
  Repositories build() {
    return Repositories(
      chantsRepository: _chantsRepository,
      chantPlaybackRepository: _chantPlaybackRepository,
    );
  }
}
