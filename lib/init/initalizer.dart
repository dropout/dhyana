import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/all.dart';
import 'package:dhyana/data_provider/auth/all.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/repository/firebase/firebase_timer_settings_history_repository.dart';
import 'package:dhyana/repository/timer_settings_history_repository.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/util/logger_factory.dart';

/*
  Manages the initialization process.
  Creates and configures providers, services and all the necessary objects used
  at the start of the application.
 */
class Initializer {

  Logger logger = getLogger('Initializer');

  Future<InitResult> init(FirebaseProvider firebaseProvider) async {
    logger.t('Starting initialization sequence');

    // Data providers
    logger.t('Initialize data providers');
    FirebaseProfileDataProvider profileDataProvider =
      FirebaseProfileDataProvider(firebaseProvider.firestore);
    FirebaseStorageDataProvider storageDataProvider =
      FirebaseStorageDataProvider(firebaseProvider.storage);

    logger.t('Initialize services');
    AnalyticsService analyticsService = FirebaseAnalyticsService(firebaseProvider.analytics);
    CrashlyticsService crashlyticsService = FirebaseCrashlyticsService(firebaseProvider.crashlytics);
    ResourceResolver resourceResolver = DefaultResourceResolver(
        storageDataProvider: storageDataProvider
    );
    TimerSettingsSharedPrefsService timerSettingsSharedPrefsService =
      TimerSettingsSharedPrefsService(
        crashlyticsService: crashlyticsService,
        sharedPrefs: SharedPreferences.getInstance()
      );
    Services services = Services(
      analyticsService: analyticsService,
      crashlyticsService: crashlyticsService,
      resourceResolver: resourceResolver,
      timerSettingsSharedPrefsService: timerSettingsSharedPrefsService,
    );

    logger.t('Initialize repositories');
    AuthRepository authRepository = FirebaseAuthRepository(
      authDataProvider: FirebaseAuthProvider(firebaseProvider.auth),
      profileDataProvider: profileDataProvider,
    );


    ProfileRepository profileRepository = FirebaseProfileRepository(
      profileDataProvider: profileDataProvider,
      storageDataProvider: storageDataProvider,
    );
    PresenceRepository presenceRepository = FirebasePresenceRepository(
      presenceDataProvider: FirebasePresenceDataProvider(
        FirebaseFirestore.instance
      )
    );
    DayRepository dayRepository = FirebaseDayRepository(
      fireStore: firebaseProvider.firestore,
    );
    SessionRepository sessionRepository = FirebaseSessionRepository(
      fireStore: firebaseProvider.firestore,
      profileDataProvider: profileDataProvider,
    );
    TimerSettingsHistoryRepository timerSettingsHistoryRepository =
      FirebaseTimerSettingsHistoryRepository(firebaseProvider.firestore);

    Repositories repos = Repositories(
      authRepository: authRepository,
      profileRepository: profileRepository,
      presenceRepository: presenceRepository,
      sessionRepository: sessionRepository,
      dayRepository: dayRepository,
      timerSettingsHistoryRepository: timerSettingsHistoryRepository,
    );

    logger.t('Initialize providers');
    List<Provider> providers = createProviders(
      services,
      repos,
    );

    logger.t('Parsing timer settings from shared prefs');
    TimerSettings timerSettings = await services
      .timerSettingsSharedPrefsService
      .getTimerSettings();

    logger.t('Checking if the user has already signed in');
    User? user = await repos.authRepository.authStateChange.first;

    return InitResult(
      user: user,
      timerSettings: timerSettings,
      services: services,
      repositories: repos,
      providers: providers,
    );
  }

  /*
    Create a list of providers that will be used
    throughout the application.
   */
  List<Provider> createProviders(
    Services srvcs,
    Repositories repos,
  ) {
    return [
      Provider<AnalyticsService>(create: (_) => srvcs.analyticsService),
      Provider<CrashlyticsService>(create: (_) => srvcs.crashlyticsService),
      Provider<ResourceResolver>(create: (_) => srvcs.resourceResolver),

      Provider<AuthRepository>(create: (_) => repos.authRepository),
      Provider<ProfileRepository>(create: (_) => repos.profileRepository),
      Provider<PresenceRepository>(create: (_) => repos.presenceRepository),
      Provider<SessionRepository>(create: (_) => repos.sessionRepository),
      Provider<DayRepository>(create: (_) => repos.dayRepository),
    ];
  }

}

class InitResult {

  final TimerSettings timerSettings;
  final Services services;
  final Repositories repositories;
  final List<Provider> providers;
  final User? user;

  InitResult({
    required this.timerSettings,
    required this.services,
    required this.repositories,
    required this.providers,
    this.user
  });

}
