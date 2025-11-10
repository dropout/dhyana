import 'package:dhyana/data_provider/auth/firebase_auth_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_data_provider_factory.dart';
import 'package:dhyana/data_provider/firebase/firebase_presence_data_provider.dart';
import 'package:dhyana/data_provider/profile_data_provider.dart';
import 'package:dhyana/data_provider/storage_data_provider.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/util/firebase_provider.dart';

/// Container class for all repositories used in the application.
/// Injected as a dependency with Provider, and accessible via BuildContext
/// extension convenience methods.
class Repositories {

  final AuthRepository authRepository;
  final ProfileRepository profileRepository;
  final PresenceRepository presenceRepository;
  final StatisticsRepository statisticsRepository;
  final TimerSettingsHistoryRepository timerSettingsHistoryRepository;

  const Repositories({
    required this.authRepository,
    required this.profileRepository,
    required this.presenceRepository,
    required this.statisticsRepository,
    required this.timerSettingsHistoryRepository,
  });

}

/// Builder class for Repositories to improve init code structure and
/// allow customization of individual repositories to improve
/// developer experience by providing easy way to stub data.
class RepositoriesBuilder {

  late AuthRepository _authRepository;
  late ProfileRepository _profileRepository;
  late PresenceRepository _presenceRepository;
  late StatisticsRepository _statisticsRepository;
  late TimerSettingsHistoryRepository _timerSettingsHistoryRepository;

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

    _profileRepository = FirebaseProfileRepository(
      profileDataProvider: profileDataProvider,
      storageDataProvider: storageDataProvider,
    );

    _presenceRepository = FirebasePresenceRepository(
      presenceDataProvider: FirebasePresenceDataProvider(
        firebaseProvider.firestore
      )
    );

    _statisticsRepository = FirebaseStatisticsRepository(
      dataProviderFactory: FirebaseDataProviderFactory(
        fireStore: firebaseProvider.firestore
      )
    );

    _timerSettingsHistoryRepository =
      FirebaseTimerSettingsHistoryRepository(firebaseProvider.firestore);

  }

  // Convenience methods to override default repositories
  // to improve developer experience and testability
  RepositoriesBuilder authRepository(AuthRepository repo) {
    _authRepository = repo;
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
    TimerSettingsHistoryRepository repo
  ) {
    _timerSettingsHistoryRepository = repo;
    return this;
  }

  // Build the final Repositories object
  Repositories build() {
    return Repositories(
      authRepository: _authRepository,
      presenceRepository: _presenceRepository,
      profileRepository: _profileRepository,
      statisticsRepository: _statisticsRepository,
      timerSettingsHistoryRepository: _timerSettingsHistoryRepository,
    );
  }

}
