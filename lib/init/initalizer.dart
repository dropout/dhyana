import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/firebase/all.dart';
import 'package:dhyana/data_provider/auth/all.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/util/logger_factory.dart';

import 'init_result.dart';

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
    ResourceResolver resourceResolver = DefaultResourceResolver(
      storageDataProvider: storageDataProvider
    );
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    HapticsService hapticsService = await HapticsService.create();
    Services services = Services(
      sharedPreferences: sharedPreferences,
      hapticsService: hapticsService,
      firebaseAnalytics: FirebaseAnalytics.instance,
      firebaseCrashlytics: FirebaseCrashlytics.instance,
      resourceResolver: resourceResolver,
    );

    logger.t('Preload shaders');
    await services.shaderService.loadShader('shaders/linear_gradient_mask.frag');

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

    StatisticsRepository statisticsRepository = FirebaseStatisticsRepository(
      fireStore: FirebaseFirestore.instance,
    );


    TimerSettingsHistoryRepository timerSettingsHistoryRepository =
      FirebaseTimerSettingsHistoryRepository(firebaseProvider.firestore);

    Repositories repos = Repositories(
      authRepository: authRepository,
      profileRepository: profileRepository,
      presenceRepository: presenceRepository,
      statisticsRepository: statisticsRepository,
      timerSettingsHistoryRepository: timerSettingsHistoryRepository,
    );

    logger.t('Initialize providers');
    List<Provider> providers = createProviders(
      services,
      repos,
    );

    logger.t('Parsing timer settings from shared prefs');
    TimerSettings timerSettings = services
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
      Provider<Services>(create: (_) => srvcs),
      Provider<Repositories>(create: (_) => repos),
    ];
  }

}
