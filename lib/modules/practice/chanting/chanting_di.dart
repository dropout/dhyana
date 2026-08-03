import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/presentation/viewmodel/chanting_settings_cubit.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/module/chanting_service.dart';
import 'package:dhyana/core/service/shared_preferences_service.dart';
import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/chant_cache_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/chant_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/drift_chant_cache_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/firebase_chant_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/repository/default_chant_cache_data_repository.dart';
import 'package:dhyana/modules/practice/chanting/data/repository/firebase_chant_repository.dart';
import 'package:dhyana/modules/practice/chanting/data/service/default_chanting_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_cache_data_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chant_cache_manager.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chant_cache_validator.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chanting_audio_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/lyrics_service.dart';
import 'package:get_it/get_it.dart';

void configureChantingModuleDependencies() {
  _configureDataProviders();
  _configureRepositories();
  _configureServices();
  _configureUseCases();
  _configureViewModels();
}

void _configureDataProviders() {
  GetIt.I.registerLazySingleton<ChantCacheDataProvider>(
    () => DriftChantCacheDataProvider(ChantCacheDatabase()),
  );
  GetIt.I.registerLazySingleton<ChantDataProvider>(
    () => FirebaseChantsDataProvider(GetIt.I.get<FirebaseProvider>().firestore),
  );
}

void _configureRepositories() {

  // GetIt.I.registerLazySingleton<ChantPlaybackRepository>(
  //   () => DefaultChantPlaybackRepository(
  //     cacheManager: Chantca,
  //     cacheDataProvider: GetIt.I.get<ChantCacheDataProvider>(),
  //     chantsDataProvider: GetIt.I.get<ChantsDataProvider>(),
  //   ),
  // );

  GetIt.I.registerLazySingleton<ChantRepository>(
    () => FirebaseChantRepository(
      chantDataProvider: GetIt.I.get<ChantDataProvider>()
    ),
  );

  GetIt.I.registerLazySingleton<ChantCacheDataRepository>(
    () => DefaultChantCacheDataRepository(
      chantCacheDataProvider: GetIt.I.get<ChantCacheDataProvider>(),
      storageDataProvider: GetIt.I.get<StorageDataProvider>(),
    ),
  );

}

void _configureServices() {
  GetIt.I.registerLazySingleton<ChantingService>(
    () => DefaultChantingService(
      chantRepository: GetIt.I.get<ChantRepository>(),
      chantCacheRepository: GetIt.I.get<ChantCacheDataRepository>(),
    ),
  );
  GetIt.I.registerFactory<ChantingAudioService>(
    () => ChantingAudioService(GetIt.I.get<AppAudioHandler>()),
  );

  GetIt.I.registerLazySingleton<LyricsService>(  
    () => LyricsService(),
  );

  GetIt.I.registerLazySingleton<ChantCacheValidator>(
    () => ChantCacheValidator(
      chantCacheRepository: GetIt.I.get<ChantCacheDataRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<ChantCacheManager>(() => ChantCacheManager(
    chantRepository: GetIt.I.get<ChantRepository>(),
    chantCacheRepository: GetIt.I.get<ChantCacheDataRepository>(),
    cacheValidator: GetIt.I.get<ChantCacheValidator>(),
  ));
}

void _configureUseCases() {}

void _configureViewModels() {
  GetIt.I.registerFactory<ChantingSettingsCubit>(
    () => ChantingSettingsCubit(
      chantingService: GetIt.I.get<ChantingService>(), 
      sharedPreferencesService: GetIt.I.get<SharedPreferencesService>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(), 
    ),
  );
  // GetIt.I.registerFactoryParam<ChantingCubit, ChantingSettings, void>(
  //   (chantingSettings, _) => ChantingCubit(
  //     chantingSettings: chantingSettings,
  //     audioService: GetIt.I.get<ChantingAudioService>(),
  //     lyricsService: GetIt.I.get<LyricsService>(),
  //     chantPlaybackRepository: GetIt.I.get<ChantPlaybackRepository>(),
  //     crashlyticsService: GetIt.I.get<CrashlyticsService>(),
  //   ),
  // );
}
