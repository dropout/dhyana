import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/id_generator_service.dart';
import 'package:dhyana/core/service/shared_preferences_service.dart';
import 'package:dhyana/core/util/firebase_provider.dart';

import 'package:path_provider/path_provider.dart';

import 'package:dhyana/modules/practice/chanting/chanting_module.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/chant_cache_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/chant_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/drift_chant_cache_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/firebase_chant_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/repository/default_chant_cache_data_repository.dart';
import 'package:dhyana/modules/practice/chanting/data/repository/firebase_chant_repository.dart';
import 'package:dhyana/modules/practice/chanting/data/service/chant_asset_downloader.dart';
import 'package:dhyana/modules/practice/chanting/data/service/chant_cache_file_system.dart';
import 'package:dhyana/modules/practice/chanting/data/service/chant_cache_validator.dart';
import 'package:dhyana/modules/practice/chanting/data/service/chant_local_resource_resolver.dart';
import 'package:dhyana/modules/practice/chanting/data/service/default_chanting_public_api.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_cache_data_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chant_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chanting_audio_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/lyrics_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/usecase/cache_chants_use_case.dart';
import 'package:dhyana/modules/practice/chanting/domain/usecase/complete_chanting_use_case.dart';
import 'package:dhyana/modules/practice/chanting/domain/usecase/load_lyrics_use_case.dart';
import 'package:dhyana/modules/practice/chanting/domain/usecase/playback_state_change_use_case.dart';
import 'package:dhyana/modules/practice/chanting/domain/usecase/start_chanting_use_case.dart';
import 'package:dhyana/modules/practice/chanting/presentation/viewmodel/chanting_cubit.dart';
import 'package:dhyana/modules/practice/chanting/public/viewmodel/chanting_settings_cubit.dart';


void registerChantingModuleDependencies() {
  _registerDataProviders();
  _registerRepositories();
  _registerServices();
  _registerUseCases();
  _registerViewModels();
  _registerPublicApi();
}

void _registerDataProviders() {
  GetIt.I.registerLazySingleton<ChantCacheDataProvider>(
    () => DriftChantCacheDataProvider(ChantCacheDatabase()),
  );
  GetIt.I.registerLazySingleton<ChantDataProvider>(
    () => FirebaseChantsDataProvider(GetIt.I.get<FirebaseProvider>().firestore),
  );
}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<ChantRepository>(
    () => FirebaseChantRepository(
      chantDataProvider: GetIt.I.get<ChantDataProvider>(),
    ),
  );

  GetIt.I.registerLazySingleton<ChantCacheRepository>(
    () => DefaultChantCacheDataRepository(
      chantCacheDataProvider: GetIt.I.get<ChantCacheDataProvider>(),
      storageDataProvider: GetIt.I.get<StorageDataProvider>(),
      chantCacheFileSystem: GetIt.I.get<ChantCacheFileSystem>(),
    ),
  );
}

void _registerServices() {
  GetIt.I.registerFactory<ChantingAudioService>(
    () => ChantingAudioService(GetIt.I.get<AppAudioHandler>()),
  );
  GetIt.I.registerLazySingleton<LyricsService>(() => LyricsService());
  GetIt.I.registerLazySingleton<ChantCacheFileSystem>(
    () => ChantCacheFileSystem(
      documentsDirectoryProvider: getApplicationDocumentsDirectory,
    ),
  );
  GetIt.I.registerLazySingleton<ChantLocalResourceResolver>(
    () => ChantLocalResourceResolver(
      chantCacheFileSystem: GetIt.I.get<ChantCacheFileSystem>(),
    ),
  );
  GetIt.I.registerLazySingleton<ChantAssetDownloader>(
    () => ChantAssetDownloader(
      chantCacheRepo: GetIt.I.get<ChantCacheRepository>(),
      chantCacheFileSystem: GetIt.I.get<ChantCacheFileSystem>(),
      storageDataProvider: GetIt.I.get<StorageDataProvider>(),
    ),
  );
  GetIt.I.registerLazySingleton<ChantCacheValidator>(() => ChantCacheValidator());
}

void _registerUseCases() {
  GetIt.I.registerFactory<CacheChantsUseCase>(
    () => CacheChantsUseCase(
      chantCacheRepo: GetIt.I.get<ChantCacheRepository>(),
      chantCacheValidator: GetIt.I.get<ChantCacheValidator>(),
      chantAssetDownloader: GetIt.I.get<ChantAssetDownloader>(),
      localResourceResolver: GetIt.I.get<ChantLocalResourceResolver>(),
    ),
  );
  GetIt.I.registerFactory<StartChantingUseCase>(
    () => StartChantingUseCase(
      chantRepo: GetIt.I.get<ChantRepository>(),
      cacheChantsUseCase: GetIt.I.get<CacheChantsUseCase>(),
      chantingAudioService: GetIt.I.get<ChantingAudioService>(),
    ),
  );
  GetIt.I.registerFactory<LoadLyricsUseCase>(
    () => LoadLyricsUseCase(lyricsService: GetIt.I.get<LyricsService>()),
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

void _registerViewModels() {
  GetIt.I.registerFactory<ChantingSettingsCubit>(
    () => ChantingSettingsCubit(
      chantingApi: GetIt.I.get<ChantingPublicApi>(),
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
void _registerPublicApi() {
  GetIt.I.registerLazySingleton<ChantingPublicApi>(
    () => DefaultChantingPublicApi(
      chantRepository: GetIt.I.get<ChantRepository>(),
    ),
  );
}