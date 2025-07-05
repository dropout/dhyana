import 'package:dhyana/bloc/profile/profile_bloc.dart';
import 'package:dhyana/data_provider/firebase/all.dart';
import 'package:dhyana/data_provider/auth/all.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/service/id_generator_service.dart';
import 'package:dhyana/util/assets.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/util/logger_factory.dart';

import 'init_result.dart';


/// Manages the initialization process.
/// Creates and configures providers, services and all the necessary objects used
/// at the start of the application.
class Initializer {

  final Logger logger = getLogger('Initializer');

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
    HapticsService hapticsService = DefaultHapticsService();
    RemoteConfigService remoteConfigService = await RemoteConfigService
      .create(firebaseProvider.remoteConfig, firebaseProvider.crashlytics);

    DefaultServices services = DefaultServices(
      audioService: DefaultAudioService(),
      overlayService: DefaultOverlayService(),
      sharedPreferences: sharedPreferences,
      hapticsService: hapticsService,
      remoteConfigService: remoteConfigService,
      analyticsService: FirebaseAnalyticsService(firebaseProvider.analytics),
      crashlyticsService: FirebaseCrashlyticsService(
        firebaseProvider.crashlytics
      ),
      idGeneratorService: IdGeneratorService(
        FirebaseIdGenerator(firebaseProvider.firestore),
      ),
      resourceResolver: resourceResolver,
      cacheManagerService: DefaultCacheManagerService(),
    );

    logger.t('Preload shaders');
    await services.shaderService.loadShader(Assets.shaderLinearGradientMask);
    await services.shaderService.loadShader(Assets.shaderGradientFlow);

    logger.t('Initialize repositories');
    AuthRepository authRepository = FirebaseAuthRepository(
      authDataProvider: FirebaseAuthProvider(firebaseProvider.auth),
      profileDataProvider: profileDataProvider,
    );

    ProfileRepository profileRepository = FirebaseProfileRepository(
      profileDataProvider: profileDataProvider,
      storageDataProvider: storageDataProvider,
    );

    // PresenceRepository presenceRepository = FirebasePresenceRepository(
    //   presenceDataProvider: FirebasePresenceDataProvider(
    //     FirebaseFirestore.instance
    //   )
    // );

    // StatisticsRepository statisticsRepository = FirebaseStatisticsRepository(
    //   dataProviderFactory: FirebaseDataProviderFactory(
    //     fireStore: firebaseProvider.firestore
    //   )
    // );

    PresenceRepository presenceRepository = StubbedPresenceRepository();
    StatisticsRepository statisticsRepository = StubbedStatisticsRepository();

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
    List<Provider> providers = _createProviders(
      services,
      repos,
    );

    logger.t('Parsing timer settings from shared prefs');
    TimerSettings timerSettings = services
      .timerSettingsSharedPrefsService
      .getTimerSettings();

    logger.t('Checking if the user has already signed in');
    User? user = await repos.authRepository.authStateChange.first;

    ProfileBloc profileBloc = ProfileBloc(
      profileRepository: repos.profileRepository,
      statisticsRepository: repos.statisticsRepository,
      idGeneratorService: services.idGeneratorService,
      crashlyticsService: services.crashlyticsService,
      profileStatsUpdater: ProfileStatsReportUpdater(),
    );

    if (user != null) {
      logger.t('User is already signed in, loading profile: ${user.uid}');
      profileBloc.add(ProfileEvent.loadProfile(profileId: user.uid));
    }

    return InitResult(
      user: user,
      timerSettings: timerSettings,
      services: services,
      repositories: repos,
      providers: providers,
      profileBloc: profileBloc,
    );
  }

  /*
    Create a list of providers that will be used
    throughout the application.
   */
  List<Provider> _createProviders(
    DefaultServices srvcs,
    Repositories repos,
  ) {
    return [
      Provider<Services>(create: (_) => srvcs),
      Provider<Repositories>(create: (_) => repos),
    ];
  }

}
