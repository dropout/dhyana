import 'package:get_it/get_it.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:core/src/event_bus/event_bus.dart';
import 'package:core/src/data/datasource/storage/firebase_storage_data_provider.dart';
import 'package:core/src/data/datasource/storage/storage_data_provider.dart';
import 'package:core/src/data/repository/default_storage_repository.dart';
import 'package:core/src/domain/entity/remote_settings.dart';
import 'package:core/src/domain/repository/storage_repository.dart';
import 'package:core/src/presentation/viewmodel/remote_settings_cubit.dart';
import 'package:core/src/service/analytics_service.dart';
import 'package:core/src/service/crashlytics_service.dart';
import 'package:core/src/service/functions_service.dart';
import 'package:core/src/service/haptics_service.dart';
import 'package:core/src/service/id_generator_service.dart';
import 'package:core/src/service/mindful_minutes_service.dart';
import 'package:core/src/service/overlay_service.dart';
import 'package:core/src/service/remote_settings_service.dart';
import 'package:core/src/service/resource_resolver.dart';
import 'package:core/src/service/shader_service.dart';
import 'package:core/src/service/shared_preferences_service.dart';
import 'package:core/src/service/wakelock_service.dart';
import 'package:core/src/infrastructure/firebase/firebase_id_generator_service.dart';
import 'package:core/src/infrastructure/firebase/firebase_analytics_service.dart';
import 'package:core/src/infrastructure/firebase/firebase_crashlytics_service.dart';
import 'package:core/src/infrastructure/firebase/firebase_functions_service.dart';
import 'package:core/src/infrastructure/firebase/firebase_remote_settings_service.dart';
import 'package:core/src/infrastructure/platform/default_haptics_service.dart';
import 'package:core/src/infrastructure/platform/default_mindful_minutes_service.dart';
import 'package:core/src/infrastructure/platform/default_overlay_service.dart';
import 'package:core/src/infrastructure/platform/default_resource_resolver.dart';
import 'package:core/src/infrastructure/platform/default_shader_service.dart';
import 'package:core/src/infrastructure/platform/default_shared_preferences_service.dart';
import 'package:core/src/infrastructure/platform/default_wakelock_service.dart';


extension CoreDependencyInjection on GetIt {

  Future<void> registerCoreDependencies() async {

    // Event bus
    registerLazySingleton<AppEventBus>(DefaultAppEventBus.new);

    // Data providers
    registerLazySingleton<StorageDataProvider>(
      () => FirebaseStorageDataProvider(
        get<FirebaseProvider>().storage
      ),
    );

    // Repos
    registerLazySingleton<StorageRepository>(
      () => DefaultStorageRepository(
        storageDataProvider: get<StorageDataProvider>(),
      ),
    );

    // Services
    registerLazySingleton<AnalyticsService>(
      () => FirebaseAnalyticsService(get<FirebaseProvider>().analytics),
    );

    registerLazySingleton<CrashlyticsService>(
      () => FirebaseCrashlyticsService(get<FirebaseProvider>().crashlytics),
    );

    registerLazySingleton<FunctionsService>(
      () => FirebaseFunctionsService(get<FirebaseProvider>().functions),
    );

    registerLazySingleton<HapticsService>(DefaultHapticsService.new);
    registerLazySingleton<OverlayService>(DefaultOverlayService.new);
    registerLazySingleton<WakelockService>(DefaultWakelockService.new);
    registerLazySingleton<ShaderService>(DefaultShaderService.new);

    registerLazySingleton<ResourceResolver>(
      () => DefaultResourceResolver(
        storageDataProvider: get<StorageDataProvider>(),
      ),
    );

    registerLazySingleton<IdGeneratorService>(
      () => FirebaseIdGeneratorService(get<FirebaseProvider>().firestore),
    );

    registerLazySingleton<MindfulMinutesService>(
      () => DefaultMindfulMinutesService(
        flutterMindfulMinutes: FlutterMindfulMinutes(),
      ),
    );

    final sharedPreferences = await SharedPreferences.getInstance();
    registerLazySingleton<SharedPreferencesService>(
      () => DefaultSharedPreferencesService(sharedPreferences),
    );

    registerLazySingleton<RemoteSettingsService>(
      () => FirebaseRemoteSettingsService(get<FirebaseProvider>().remoteConfig),
    );    

    registerFactoryParam<RemoteSettingsCubit, RemoteSettings, void>(
      (initialRemoteSettings, _) => RemoteSettingsCubit(
        initialRemoteSettings: initialRemoteSettings,
        remoteSettingsService: get<RemoteSettingsService>(),
        crashlyticsService: get<CrashlyticsService>(),
      ),
    );

  }

}
