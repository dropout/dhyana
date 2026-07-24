import 'package:dhyana/modules/practice/chanting/infrastructure/chant_cache_validator.dart';
import 'package:dhyana/core/data/datasource/auth/firebase_auth_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/drift_chant_cache_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/firebase_chants_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider_factory.dart';
import 'package:dhyana/modules/social/data/datasource/firebase_presence_data_provider.dart';
import 'package:dhyana/core/data/datasource/profile_data_provider.dart';
import 'package:dhyana/core/data/datasource/storage_data_provider.dart';
import 'package:dhyana/core/domain/repository/auth_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_playback_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chants_repository.dart';
import 'package:dhyana/modules/practice/chanting/data/default_chant_playback_repository.dart';
import 'package:dhyana/core/data/repository/firebase_auth_repository.dart';
import 'package:dhyana/modules/practice/chanting/data/firebase_chants_repository.dart';
import 'package:dhyana/core/data/repository/firebase_profile_repository.dart';
import 'package:dhyana/modules/insights/data/repository/firebase_statistics_repository.dart';
import 'package:dhyana/modules/practice/timer/data/firebase_timer_settings_history_repository.dart';
import 'package:dhyana/modules/social/data/repository/firebase_presence_repository.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/practice/timer/domain/repository/timer_settings_history_repository.dart';
import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:dhyana/modules/practice/chanting/infrastructure/default_chant_cache_manager_service.dart';
import 'package:dhyana/util/firebase_provider.dart';

/// Container class for all repositories used in the application.
/// Injected as a dependency with Provider, and accessible via BuildContext
/// extension convenience methods.
class Repositories {
  final AuthRepository authRepository;
  final ChantsRepository chantsRepository;
  final ProfileRepository profileRepository;
  final PresenceRepository presenceRepository;
  final StatisticsRepository statisticsRepository;
  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;
  final ChantPlaybackRepository chantPlaybackRepository;

  const Repositories({
    required this.authRepository,
    required this.chantsRepository,
    required this.profileRepository,
    required this.presenceRepository,
    required this.statisticsRepository,
    required this.timerSettingsHistoryRepository,
    required this.chantPlaybackRepository,
  });
}

/// Builder class for Repositories to improve init code structure and
/// allow customization of individual repositories to improve
/// developer experience by providing easy way to stub data.
class RepositoriesBuilder {
  late AuthRepository _authRepository;
  late ChantsRepository _chantsRepository;
  late ProfileRepository _profileRepository;
  late PresenceRepository _presenceRepository;
  late StatisticsRepository _statisticsRepository;
  late TimerSettingsHistoryRepository _timerSettingsHistoryRepository;
  late ChantPlaybackRepository _chantPlaybackRepository;

  // Default constructor initializing with Firebase implementations
  RepositoriesBuilder({
    required FirebaseProvider firebaseProvider,
    required ProfileDataProvider profileDataProvider,
    required StorageDataProvider storageDataProvider,
  }) {
    _authRepository = FirebaseAuthRepository(
      authDataProvider: FirebaseAuthProvider(firebaseProvider.auth),
      profileDataProvider: profileDataProvider,
    );

    _chantsRepository = FirebaseChantsRepository(
      chantsDataProvider: FirebaseChantsDataProvider(
        firebaseProvider.firestore,
      ),
    );

    _profileRepository = FirebaseProfileRepository(
      profileDataProvider: profileDataProvider,
      storageDataProvider: storageDataProvider,
    );

    _presenceRepository = FirebasePresenceRepository(
      presenceDataProvider: FirebasePresenceDataProvider(
        firebaseProvider.firestore,
      ),
    );

    _statisticsRepository = FirebaseStatisticsRepository(
      dataProviderFactory: FirebaseDataProviderFactory(
        fireStore: firebaseProvider.firestore,
      ),
    );

    _timerSettingsHistoryRepository = FirebaseTimerSettingsHistoryRepository(
      firebaseProvider.firestore,
    );

    final cacheManager = DefaultChantCacheManagerService(
      storageDataProvider: storageDataProvider,
    );
    final cacheDataProvider = DriftChantCacheDataProvider(ChantCacheDatabase());

    _chantPlaybackRepository = DefaultChantPlaybackRepository(
      chantsDataProvider: FirebaseChantsDataProvider(
        firebaseProvider.firestore,
      ),
      cacheDataProvider: cacheDataProvider,
      storageDataProvider: storageDataProvider,
      cacheManager: cacheManager,
      cacheValidator: ChantCacheValidator(
        cacheManager: cacheManager, 
        cacheDataProvider: cacheDataProvider
      ),
    );
  }

  // Convenience methods to override default repositories
  // to improve developer experience and testability
  RepositoriesBuilder authRepository(AuthRepository repo) {
    _authRepository = repo;
    return this;
  }

  RepositoriesBuilder chantsRepository(ChantsRepository repo) {
    _chantsRepository = repo;
    return this;
  }

  RepositoriesBuilder profileRepository(ProfileRepository repo) {
    _profileRepository = repo;
    return this;
  }

  RepositoriesBuilder presenceRepository(PresenceRepository repo) {
    _presenceRepository = repo;
    return this;
  }

  RepositoriesBuilder statisticsRepository(StatisticsRepository repo) {
    _statisticsRepository = repo;
    return this;
  }

  RepositoriesBuilder timerSettingsHistoryRepository(
    TimerSettingsHistoryRepository repo,
  ) {
    _timerSettingsHistoryRepository = repo;
    return this;
  }

  RepositoriesBuilder chantPlaybackRepository(ChantPlaybackRepository repo) {
    _chantPlaybackRepository = repo;
    return this;
  }

  // Build the final Repositories object
  Repositories build() {
    return Repositories(
      authRepository: _authRepository,
      chantsRepository: _chantsRepository,
      presenceRepository: _presenceRepository,
      profileRepository: _profileRepository,
      statisticsRepository: _statisticsRepository,
      timerSettingsHistoryRepository: _timerSettingsHistoryRepository,
      chantPlaybackRepository: _chantPlaybackRepository,
    );
  }
}
