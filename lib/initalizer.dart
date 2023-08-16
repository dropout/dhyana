import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/data_provider/auth/all.dart';
import 'package:dhyana/data_provider/firebase_presence_data_provider.dart';
import 'package:dhyana/data_provider/firebase_session_data_provider.dart';
import 'package:dhyana/data_provider/firebase_storage_data_provider.dart';
import 'package:dhyana/repositories.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/firebase_auth_repository.dart';
import 'package:dhyana/repository/firebase_presence_repository.dart';
import 'package:dhyana/repository/firebase_profile_repository.dart';
import 'package:dhyana/repository/firebase_session_repository.dart';
import 'package:dhyana/repository/presence_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/repository/session_repository.dart';
import 'package:dhyana/service/default_resource_resolver.dart';
import 'package:dhyana/service/resource_resolver.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/services.dart';
import 'package:dhyana/util/logger_factory.dart';

import 'model/timer_settings.dart';

/*
  Manages the initialization process.
  Creates and configures providers, services and all the necessary objects used
  in the application.
 */
class Initializer {

  Logger logger = getLogger('Initializer');

  Future<InitResult> init() async {
    logger.v('Starting initialization sequence');

    // Data providers
    logger.v('Initialize data providers');
    FirebaseProfileDataProvider fbProfileDataProvider =
      FirebaseProfileDataProvider(FirebaseFirestore.instance);
    FirebaseStorageDataProvider fbStorageDataProvider =
      FirebaseStorageDataProvider(FirebaseStorage.instance);

    logger.v('Initialize services');
    AnalyticsService analyticsService = FirebaseAnalyticsService(FirebaseAnalytics.instance);
    CrashlyticsService crashlyticsService = FirebaseCrashlyticsService(FirebaseCrashlytics.instance);
    ResourceResolver resourceResolver = DefaultResourceResolver(
        storageDataProvider: fbStorageDataProvider
    );
    Services services = Services(
      analyticsService: analyticsService,
      crashlyticsService: crashlyticsService,
      resourceResolver: resourceResolver,
      timerSettingsSharedPrefsService: TimerSettingsSharedPrefsService(
        crashlyticsService: crashlyticsService,
        sharedPrefs: SharedPreferences.getInstance()
      ),
    );

    logger.v('Initialize repositories');
    AuthRepository authRepository = FirebaseAuthRepository(
      authDataProvider: FirebaseAuthProvider(fb_auth.FirebaseAuth.instance),
      profileDataProvider: fbProfileDataProvider,
    );
    ProfileRepository profileRepository = FirebaseProfileRepository(
      profileDataProvider: fbProfileDataProvider,
      storageDataProvider: fbStorageDataProvider,
    );
    PresenceRepository presenceRepository = FirebasePresenceRepository(
      presenceDataProvider: FirebasePresenceDataProvider(
        FirebaseFirestore.instance
      )
    );

    SessionRepository sessionRepository = FirebaseSessionRepository(
      sessionDataProvider: FirebaseSessionDataProvider(
        fireStore: FirebaseFirestore.instance,
      )
    );

    Repositories repos = Repositories(
      authRepository: authRepository,
      profileRepository: profileRepository,
      presenceRepository: presenceRepository,
      sessionRepository: sessionRepository,
    );

    logger.v('Initialize providers');
    List<Provider> providers = createProviders(
      services,
      repos,
    );

    logger.v('Parsing timer settings from shared prefs');
    TimerSettings timerSettings = await services.timerSettingsSharedPrefsService.getTimerSettings();

    logger.v('Checking if the user has already signed in');
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
