import 'dart:async';

import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/audio/audio_session_configuration.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audio_service/audio_service.dart' as audio_service;
import 'package:audio_session/audio_session.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:home/home.dart';
import 'package:profile/profile.dart';
import 'package:timer/timer.dart';
import 'package:chanting/chanting.dart';
import 'package:session/session.dart';
import 'package:social/social.dart';
import 'package:stats/stats.dart';

import 'init_result.dart';
import 'app_di.dart';


/// Manages the initialization process.
class Initializer with LoggerMixin {
  Future<InitResult> init(FirebaseProvider firebaseProvider) async {
    logger.t('Starting initialization process...');


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
        ...$homeRoutes,
        ...$profileRoutes, 
        ...$timerRoutes,
        ...$chantingRoutes,
        ...$sessionRoutes,
        ...$socialRoutes, 
        ...$statsRoutes,      
      ],
      // errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
    );
    

    logger.t('Configuring dependency injection');
    GetIt.I.registerSingleton<FirebaseProvider>(FirebaseProvider());
    GetIt.I.registerSingleton<GoRouter>(router);
    GetIt.I.registerSingleton<AppAudioHandler>(audioHandler);    
    GetIt.I.registerSingleton<AppEventBus>(DefaultAppEventBus());    
    await GetIt.I.registerDependencies();


    logger.t('Configuring BuildContext services shortcuts');
    final services = ServicesBuilder().build();    


    logger.t('Preloading shaders');
    await services.shaderService.loadShader(Assets.shaderLinearGradientMask);
    await services.shaderService.loadShader(Assets.shaderGradientFlow);


    logger.t('Fetching remote settings');    
    await FirebaseRemoteSettingsService.configureDefaults(
      firebaseProvider.remoteConfig,
    );
    final remoteSettings = await services.remoteSettingsService
      .fetchRemoteSettings();


    logger.t('Fetching user ID');
    String? userId = (await GetIt.I<AuthPublicApi>().authSessionStream.first).userId;


    return InitResult(
      userId: userId,
      services: services,
      remoteSettings: remoteSettings,
    );
  }

}
