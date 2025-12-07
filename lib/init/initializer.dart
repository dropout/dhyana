import 'dart:async';

import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/data_provider/firebase/all.dart';
import 'package:dhyana/data_provider/auth/all.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/util/assets.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/util/logger_factory.dart';

import 'init_result.dart';

/// Manages the initialization process.
/// Creates and configures providers, repositories,
/// services and all the necessary objects required
/// at the start of the application.
class Initializer {

  final Logger logger = getLogger('Initializer');

  Future<InitResult> init(FirebaseProvider firebaseProvider) async {
    logger.t('Starting initialization process');

    // Create data providers shared between builders
    logger.t('Create data providers');
    FirebaseProfileDataProvider profileDataProvider =
      FirebaseProfileDataProvider(firebaseProvider.firestore);
    FirebaseStorageDataProvider storageDataProvider =
      FirebaseStorageDataProvider(firebaseProvider.storage);

    // Build repositories
    logger.t('Create repositories');
    final repoBuilder = RepositoriesBuilder(
      firebaseProvider: firebaseProvider,
      profileDataProvider: profileDataProvider,
      storageDataProvider: storageDataProvider,
    );

    final repos = repoBuilder
      .presenceRepository(StubbedPresenceRepository())
      .statisticsRepository(StubbedStatisticsRepository())
      .build();

    // Build services
    logger.t('Create services');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await FirebaseRemoteSettingsService.configureDefaults(firebaseProvider.remoteConfig);

    final services = ServicesBuilder(
      firebaseProvider: firebaseProvider,
      storageDataProvider: storageDataProvider,
      sharedPreferences: sharedPreferences,
    ).build();

    logger.t('Fetch remote settings');
    final remoteSettings = await services
      .remoteSettingsService
      .fetchRemoteSettings();

    logger.t('Preload shaders');
    await services.shaderService.loadShader(Assets.shaderLinearGradientMask);
    await services.shaderService.loadShader(Assets.shaderGradientFlow);

    logger.t('Parsing timer settings from shared prefs');
    TimerSettings timerSettings = services
      .timerSettingsSharedPrefsService
      .getTimerSettings();

    User? user = await repos.authRepository.authStateChange.first;
    ProfileCubit profileCubit = ProfileCubit(
      profileRepository: repos.profileRepository,
      settingsRepository: repos.settingsRepository,
      statisticsRepository: repos.statisticsRepository,
      idGeneratorService: services.idGeneratorService,
      crashlyticsService: services.crashlyticsService,
      profileStatsUpdater: ProfileStatsReportUpdater(),
    );

    if (user != null) {
      logger.t('User is already signed in, initiate profile loading for user: ${user.uid}');
      profileCubit.loadProfile(user.uid);
    } else {
      logger.t('User not signed in');
    }

    return InitResult(
      user: user,
      timerSettings: timerSettings,
      services: services,
      repositories: repos,
      profileCubit: profileCubit,
      remoteSettings: remoteSettings,
    );
  }

}
