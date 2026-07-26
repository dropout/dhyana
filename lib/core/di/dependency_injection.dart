import 'package:dhyana/core/data/repository/default_storage_repository.dart';
import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:dhyana/util/firebase_provider.dart';
import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';

import 'package:dhyana/core/data/datasource/auth/auth_provider.dart';
import 'package:dhyana/core/data/datasource/auth/firebase_auth_provider.dart';
import 'package:dhyana/core/data/datasource/storage/firebase_storage_data_provider.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/data/repository/default_auth_repository.dart';

import 'package:dhyana/core/domain/repository/auth_repository.dart';
import 'package:dhyana/core/domain/service/analytics_service.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/core/domain/service/functions_service.dart';
import 'package:dhyana/core/domain/service/haptics_service.dart';
import 'package:dhyana/core/domain/service/id_generator_service.dart';
import 'package:dhyana/core/domain/service/mindful_minutes_service.dart';
import 'package:dhyana/core/domain/service/overlay_service.dart';
import 'package:dhyana/core/domain/service/remote_settings_service.dart';
import 'package:dhyana/core/domain/service/resource_resolver.dart';
import 'package:dhyana/core/domain/service/shader_service.dart';
import 'package:dhyana/core/domain/service/shared_preferences_service.dart';
import 'package:dhyana/core/domain/service/wakelock_service.dart';

import 'package:dhyana/core/infrastructure/firebase/firebase_id_generator.dart';
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

final getIt = GetIt.instance;

Future<void> configureCoreDependencies() async {
  _registerDataProviders();
  _registerRepositories();
  await _registerServices();
}

void _registerDataProviders() {
  final firebaseProvider = getIt<FirebaseProvider>();
  getIt.registerLazySingleton<AuthProvider>(
    () => FirebaseAuthProvider(firebaseProvider.auth),
  );
  getIt.registerLazySingleton<StorageDataProvider>(
    () => FirebaseStorageDataProvider(firebaseProvider.storage),
  );
}

void _registerRepositories() {
  getIt.registerLazySingleton<AuthRepository>(
    () => DefaultAuthRepository(
      authDataProvider: getIt<AuthProvider>(),
      profileDataProvider: getIt<ProfileDataProvider>(),
    ),
  );
  getIt.registerLazySingleton<StorageRepository>(
    () => DefaultStorageRepository(
      storageDataProvider: getIt<StorageDataProvider>(),
    ),
  );

}

Future<void> _registerServices() async {

	if (getIt.isRegistered<AnalyticsService>()) {
		return;
	}

	getIt.registerLazySingleton<AnalyticsService>(
		() => FirebaseAnalyticsService(getIt<FirebaseProvider>().analytics),
	);

	getIt.registerLazySingleton<CrashlyticsService>(
		() => FirebaseCrashlyticsService(getIt<FirebaseProvider>().crashlytics),
	);

	getIt.registerLazySingleton<FunctionsService>(
		() => FirebaseFunctionsService(
			getIt<FirebaseProvider>().functions,
		),
	);

	getIt.registerLazySingleton<HapticsService>(DefaultHapticsService.new);
	getIt.registerLazySingleton<OverlayService>(DefaultOverlayService.new);
	getIt.registerLazySingleton<WakelockService>(DefaultWakelockService.new);
	getIt.registerLazySingleton<ShaderService>(DefaultShaderService.new);

	getIt.registerLazySingleton<ResourceResolver>(
		() => DefaultResourceResolver(
			storageDataProvider: getIt<StorageDataProvider>(),
		),
	);

	getIt.registerLazySingleton<IdGeneratorService>(
		() => IdGeneratorService(
			FirebaseIdGenerator(getIt<FirebaseProvider>().firestore),
		),
	);

	getIt.registerLazySingleton<MindfulMinutesService>(
		() => DefaultMindfulMinutesService(
			flutterMindfulMinutes: FlutterMindfulMinutes(),
		),
	);

  final sharedPreferences = await SharedPreferences.getInstance();
	getIt.registerLazySingleton<SharedPreferencesService>(
		() => DefaultSharedPreferencesService(sharedPreferences),
	);

	getIt.registerLazySingleton<RemoteSettingsService>(
		() => FirebaseRemoteSettingsService(getIt<FirebaseProvider>().remoteConfig),
	);

}
