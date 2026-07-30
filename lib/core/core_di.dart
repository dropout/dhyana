import 'package:dhyana/core/data/repository/default_storage_repository.dart';
import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dhyana/core/util/firebase_provider.dart';

import 'package:dhyana/modules/auth/data/datasource/auth/auth_provider.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/firebase_auth_provider.dart';
import 'package:dhyana/core/data/datasource/storage/firebase_storage_data_provider.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/modules/auth/data/repository/default_auth_repository.dart';

import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';
import 'package:dhyana/core/service/analytics_service.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/functions_service.dart';
import 'package:dhyana/core/service/haptics_service.dart';
import 'package:dhyana/core/service/id_generator_service.dart';
import 'package:dhyana/core/service/mindful_minutes_service.dart';
import 'package:dhyana/core/service/overlay_service.dart';
import 'package:dhyana/core/service/remote_settings_service.dart';
import 'package:dhyana/core/service/resource_resolver.dart';
import 'package:dhyana/core/service/shader_service.dart';
import 'package:dhyana/core/service/shared_preferences_service.dart';
import 'package:dhyana/core/service/wakelock_service.dart';

import 'package:dhyana/core/infrastructure/firebase/firebase_id_generator_service.dart';
import 'package:dhyana/core/infrastructure/firebase/firebase_analytics_service.dart';
import 'package:dhyana/core/infrastructure/firebase/firebase_crashlytics_service.dart';
import 'package:dhyana/core/infrastructure/firebase/firebase_functions_service.dart';
import 'package:dhyana/core/infrastructure/firebase/firebase_remote_settings_service.dart';
import 'package:dhyana/core/infrastructure/platform/default_haptics_service.dart';
import 'package:dhyana/core/infrastructure/platform/default_mindful_minutes_service.dart';
import 'package:dhyana/core/infrastructure/platform/default_overlay_service.dart';
import 'package:dhyana/core/infrastructure/platform/default_resource_resolver.dart';
import 'package:dhyana/core/infrastructure/platform/default_shader_service.dart';
import 'package:dhyana/core/infrastructure/platform/default_shared_preferences_service.dart';
import 'package:dhyana/core/infrastructure/platform/default_wakelock_service.dart';

Future<void> configureCoreDependencies() async {
  _registerDataProviders();
  _registerRepositories();
  _registerViewModels();
  await _registerServices();
}

void _registerDataProviders() {
  final firebaseProvider = GetIt.I.get<FirebaseProvider>();
  GetIt.I.registerLazySingleton<AuthProvider>(
    () => FirebaseAuthProvider(firebaseProvider.auth),
  );
  GetIt.I.registerLazySingleton<StorageDataProvider>(
    () => FirebaseStorageDataProvider(firebaseProvider.storage),
  );
}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => DefaultAuthRepository(
      authDataProvider: GetIt.I.get<AuthProvider>(),
    ),
  );
  GetIt.I.registerLazySingleton<StorageRepository>(
    () => DefaultStorageRepository(
      storageDataProvider: GetIt.I.get<StorageDataProvider>(),
    ),
  );
}

Future<void> _registerServices() async {
  GetIt.I.registerLazySingleton<AnalyticsService>(
    () => FirebaseAnalyticsService(GetIt.I.get<FirebaseProvider>().analytics),
  );

  GetIt.I.registerLazySingleton<CrashlyticsService>(
    () => FirebaseCrashlyticsService(GetIt.I.get<FirebaseProvider>().crashlytics),
  );

  GetIt.I.registerLazySingleton<FunctionsService>(
    () => FirebaseFunctionsService(GetIt.I.get<FirebaseProvider>().functions),
  );

  GetIt.I.registerLazySingleton<HapticsService>(DefaultHapticsService.new);
  GetIt.I.registerLazySingleton<OverlayService>(DefaultOverlayService.new);
  GetIt.I.registerLazySingleton<WakelockService>(DefaultWakelockService.new);
  GetIt.I.registerLazySingleton<ShaderService>(DefaultShaderService.new);

  GetIt.I.registerLazySingleton<ResourceResolver>(
    () => DefaultResourceResolver(
      storageDataProvider: GetIt.I.get<StorageDataProvider>(),
    ),
  );

  GetIt.I.registerLazySingleton<IdGeneratorService>(
    () => FirebaseIdGeneratorService(GetIt.I.get<FirebaseProvider>().firestore),
  );

  GetIt.I.registerLazySingleton<MindfulMinutesService>(
    () => DefaultMindfulMinutesService(
      flutterMindfulMinutes: FlutterMindfulMinutes(),
    ),
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  GetIt.I.registerLazySingleton<SharedPreferencesService>(
    () => DefaultSharedPreferencesService(sharedPreferences),
  );

  GetIt.I.registerLazySingleton<RemoteSettingsService>(
    () => FirebaseRemoteSettingsService(GetIt.I.get<FirebaseProvider>().remoteConfig),
  );
}

void _registerViewModels() {


}
