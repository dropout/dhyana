import 'dart:async';

import 'package:audio_service/audio_service.dart' as audio_service;
import 'package:audio_session/audio_session.dart';
import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/audio/audio_session_configuration.dart';
import 'package:dhyana/audio/timer_audio_handler.dart';
import 'package:dhyana/audio/chanting_audio_handler.dart';
import 'package:dhyana/bloc/profile/profile_cubit.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/data_provider/firebase/firebase_profile_data_provider.dart';
import 'package:dhyana/data_provider/firebase/firebase_storage_data_provider.dart';
import 'package:dhyana/init/repositories.dart';
import 'package:dhyana/repository/stub/stubbed_presence_repository.dart';
import 'package:dhyana/repository/stub/stubbed_statistics_repository.dart';
import 'package:dhyana/service/firebase/firebase_remote_settings_service.dart';
import 'package:dhyana/service/profile_stats_report_updater.dart';
import 'package:dhyana/util/assets.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/init/services.dart';
import 'package:dhyana/util/logger_mixin.dart';

import 'init_result.dart';

/// Manages the initialization process.
/// Creates and configures providers, repositories,
/// services and all the necessary objects required
/// at the start of the application.
class Initializer with LoggerMixin {
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

    // TODO: Remove stubbed repositories and replace with real implementations
    final repos = repoBuilder
      .presenceRepository(StubbedPresenceRepository())
      .statisticsRepository(StubbedStatisticsRepository())
      .build();

    // Build services
    logger.t('Create services');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await FirebaseRemoteSettingsService.configureDefaults(
      firebaseProvider.remoteConfig,
    );

    logger.t('Initialize audio handler');
    final audioHandler = await audio_service.AudioService.init(
      builder: () => AppAudioHandler(
        TimerAudioHandler(),
        ChantingAudioHandler(),
      ),
      config: const audio_service.AudioServiceConfig(
        androidNotificationChannelId: 'com.dhyana.audio',
        androidNotificationChannelName: 'Dhyana',
        androidNotificationOngoing: true,
      ),
    );
    
    logger.t('Initialize audio session');
    final audioSession = await AudioSession.instance;
    await audioSession.configure(getAudioSessionConfiguration());
    await audioSession.setActive(true);

    final services = ServicesBuilder(
      firebaseProvider: firebaseProvider,
      storageDataProvider: storageDataProvider,
      sharedPreferences: sharedPreferences,
      audioHandler: audioHandler,
    ).build();

    logger.t('Fetch remote settings');
    final remoteSettings = await services.remoteSettingsService
      .fetchRemoteSettings();

    logger.t('Preload shaders');
    await services.shaderService.loadShader(Assets.shaderLinearGradientMask);
    await services.shaderService.loadShader(Assets.shaderGradientFlow);

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
      logger.t(
        'User is already signed in, initiate profile loading for user: ${user.uid}',
      );
      profileCubit.loadProfile(user.uid);
    } else {
      logger.t('User not signed in');
    }

    return InitResult(
      user: user,
      services: services,
      repositories: repos,
      profileCubit: profileCubit,
      remoteSettings: remoteSettings,
    );
  }
  
}
