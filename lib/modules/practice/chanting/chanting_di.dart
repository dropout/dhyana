import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/domain/entity/chant/chanting_settings.dart';
import 'package:dhyana/core/presentation/viewmodel/chanting_settings_cubit.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/id_generator_service.dart';
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
import 'package:dhyana/modules/practice/chanting/domain/usecase/complete_chanting_use_case.dart';
import 'package:dhyana/modules/practice/chanting/domain/usecase/load_lyrics_use_case.dart';
import 'package:dhyana/modules/practice/chanting/domain/usecase/playback_state_change_use_case.dart';
import 'package:dhyana/modules/practice/chanting/domain/usecase/start_chanting_use_case.dart';
import 'package:dhyana/modules/practice/chanting/presentation/viewmodel/chanting_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

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

void _configureUseCases() {
  GetIt.I.registerFactory<StartChantingUseCase>(
    () => StartChantingUseCase(
      chantCacheManager: GetIt.I.get<ChantCacheManager>(),
      chantingAudioService: GetIt.I.get<ChantingAudioService>(),
    ),
  );
  GetIt.I.registerFactory<LoadLyricsUseCase>(
    () => LoadLyricsUseCase(
      lyricsService: GetIt.I.get<LyricsService>(),
    ),
  );
  GetIt.I.registerFactory<PlaybackStateChangeUseCase>(
    () => PlaybackStateChangeUseCase(),
  );
  GetIt.I.registerFactory<CompleteChantingUseCase>(
    () => CompleteChantingUseCase(
      idGeneratorService: GetIt.I.get<IdGeneratorService>(),
    ),
  );

}

void _configureViewModels() {
  GetIt.I.registerFactory<ChantingSettingsCubit>(
    () => ChantingSettingsCubit(
      chantingService: GetIt.I.get<ChantingService>(), 
      sharedPreferencesService: GetIt.I.get<SharedPreferencesService>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(), 
    ),
  );
  GetIt.I.registerFactoryParam<ChantingCubit, ChantingSettings, void>(
    (chantingSettings, _) => ChantingCubit(
      chantingSettings: chantingSettings,
      audioService: GetIt.I.get<ChantingAudioService>(),
      router: GetIt.I.get<GoRouter>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),       
      startChantingUseCase: GetIt.I.get<StartChantingUseCase>(),
      loadLyricsUseCase: GetIt.I.get<LoadLyricsUseCase>(),
      playbackStateChangeUseCase: GetIt.I.get<PlaybackStateChangeUseCase>(),
      completeChantingUseCase: GetIt.I.get<CompleteChantingUseCase>(),

    ),
  );
}
