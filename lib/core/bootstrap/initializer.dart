import 'dart:async';

import 'package:audio_service/audio_service.dart' as audio_service;
import 'package:audio_session/audio_session.dart';
import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/core/audio/audio_session_configuration.dart';
import 'package:dhyana/core/audio/so_chanting_audio_handler.dart';
import 'package:dhyana/core/audio/so_timer_audio_handler.dart';
import 'package:dhyana/core/bootstrap/dependency_injection.dart';
import 'package:dhyana/core/core_routes.dart';
import 'package:dhyana/core/service/module/auth_service.dart';
import 'package:dhyana/core/presentation/app_keys.dart';
import 'package:dhyana/modules/auth/auth_routes.dart';
import 'package:dhyana/modules/insights/insights_routes.dart';
import 'package:dhyana/modules/practice/session/session_routes.dart';
import 'package:dhyana/modules/practice/timer/timer_routes.dart';
import 'package:dhyana/core/data/datasource/storage/firebase_storage_data_provider.dart';
import 'package:dhyana/core/di/repositories.dart';
import 'package:dhyana/core/infrastructure/firebase/firebase_remote_settings_service.dart';
import 'package:dhyana/modules/profile/profile_routes.dart';
import 'package:dhyana/core/util/assets.dart';
import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/modules/social/social_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/core/util/logger_mixin.dart';

import 'init_result.dart';

/// Manages the initialization process.
/// Creates and configures providers, repositories,
/// services and all the necessary objects required
/// at the start of the application.
class Initializer with LoggerMixin {
  Future<InitResult> init(FirebaseProvider firebaseProvider) async {
    logger.t('Starting initialization process');

    logger.t('Configuring HydratedBloc storage');
    HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: HydratedStorageDirectory(
        (await getApplicationDocumentsDirectory()).path,
      ),
    );

    logger.t('Configuring application audio library');
    await SoLoud.instance.init();
    final audioHandler = await audio_service.AudioService.init(
      builder: () => AppAudioHandler(
        SoTimerAudioHandler(soloud: SoLoud.instance),
        SoLoudChantingAudioHandler(soloud: SoLoud.instance),
      ),
      config: const audio_service.AudioServiceConfig(
        androidNotificationChannelId: 'com.dhyana.audio',
        androidNotificationChannelName: 'Dhyana',
        androidNotificationOngoing: true,
      ),
    );

    logger.t('Configuring audio session');
    final audioSession = await AudioSession.instance;
    await audioSession.configure(getAudioSessionConfiguration());
    await audioSession.setActive(true);

    logger.t('Configuring app router');
    final router = GoRouter(
      debugLogDiagnostics: kDebugMode,
      navigatorKey: AppWidgetKeys.rootNavigatorKey,
      initialLocation: '/',
      routes: [
        ...$authRoutes,
        ...$coreRoutes,
        ...$profileRoutes, 
        ...$timerRoutes,
        ...$sessionRoutes,
        ...$socialRoutes, 
        ...$insightsRoutes,      
      ],
      // errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
    );
    GetIt.I.registerSingleton<GoRouter>(router);

    logger.t('Configuring dependency injection');
    GetIt.I.registerSingleton<AppAudioHandler>(audioHandler);
    initializeDependencies();

    // Create data providers shared between builders
    logger.t('Create data providers');
    FirebaseStorageDataProvider storageDataProvider =
        FirebaseStorageDataProvider(firebaseProvider.storage);

    // Build repositories
    logger.t('Create repositories');    
    final repos = RepositoriesBuilder().build();

    // Build services
    logger.t('Create services');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await FirebaseRemoteSettingsService.configureDefaults(
      firebaseProvider.remoteConfig,
    );

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

    logger.t('');
    String? userId = await GetIt.I<AuthService>().userIdStream.first;
  
    return InitResult(
      userId: userId,
      services: services,
      repositories: repos,
      remoteSettings: remoteSettings,
    );
  }
}
