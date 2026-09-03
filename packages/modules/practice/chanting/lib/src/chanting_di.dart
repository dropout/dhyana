import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:get_it/get_it.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:core/core.dart';
import 'package:path_provider/path_provider.dart';

import 'package:chanting/src/chanting_module.dart';
import 'package:chanting/src/audio/so_chanting_audio_handler.dart';
import 'package:chanting/src/drift/chant_cache_database.dart';
import 'package:chanting/src/data/datasource/chant_cache_data_provider.dart';
import 'package:chanting/src/data/datasource/chant_data_provider.dart';
import 'package:chanting/src/data/datasource/drift_chant_cache_data_provider.dart';
import 'package:chanting/src/data/datasource/firebase_chant_data_provider.dart';
import 'package:chanting/src/data/repository/default_chant_cache_data_repository.dart';
import 'package:chanting/src/data/repository/firebase_chant_repository.dart';
import 'package:chanting/src/data/service/chant_asset_downloader.dart';
import 'package:chanting/src/data/service/chant_cache_file_system.dart';
import 'package:chanting/src/data/service/chant_cache_validator.dart';
import 'package:chanting/src/data/service/chant_local_resource_resolver.dart';
import 'package:chanting/src/data/service/default_chanting_public_api.dart';
import 'package:chanting/src/service/chanting_cache_clear_capability.dart';
import 'package:chanting/src/domain/repository/chant_cache_data_repository.dart';
import 'package:chanting/src/domain/repository/chant_repository.dart';
import 'package:chanting/src/domain/service/chanting_audio_service.dart';
import 'package:chanting/src/domain/service/lyrics_service.dart';
import 'package:chanting/src/domain/usecase/cache_chants_use_case.dart';
import 'package:chanting/src/domain/usecase/complete_chanting_use_case.dart';
import 'package:chanting/src/domain/usecase/load_lyrics_use_case.dart';
import 'package:chanting/src/domain/usecase/playback_state_change_use_case.dart';
import 'package:chanting/src/domain/usecase/start_chanting_use_case.dart';
import 'package:chanting/src/presentation/viewmodel/chanting_cubit.dart';
import 'package:chanting/src/public/viewmodel/chanting_settings_cubit.dart';

extension ChantingModuleDependencyInjection on GetIt {
  void registerChantingModuleDependencies() {
    // Audio handler
    registerFactory<SoLoudChantingAudioHandler>(
      () => SoLoudChantingAudioHandler(soloud: SoLoud.instance),
    );

    // Data Providers
    registerLazySingleton<ChantCacheDataProvider>(
      () => DriftChantCacheDataProvider(ChantCacheDatabase()),
    );
    registerLazySingleton<ChantDataProvider>(
      () =>
          FirebaseChantsDataProvider(GetIt.I.get<FirebaseProvider>().firestore),
    );

    // Repositories
    registerLazySingleton<ChantRepository>(
      () => FirebaseChantRepository(
        chantDataProvider: GetIt.I.get<ChantDataProvider>(),
      ),
    );

    registerLazySingleton<ChantCacheRepository>(
      () => DefaultChantCacheDataRepository(
        chantCacheDataProvider: GetIt.I.get<ChantCacheDataProvider>(),
        storageDataProvider: GetIt.I.get<StorageDataProvider>(),
        chantCacheFileSystem: GetIt.I.get<ChantCacheFileSystem>(),
      ),
    );

    // Services
    registerFactory<ChantingAudioService>(
      () => ChantingAudioService(GetIt.I.get<AppAudioHandler>()),
    );
    registerLazySingleton<LyricsService>(() => LyricsService());
    registerLazySingleton<ChantCacheFileSystem>(
      () => ChantCacheFileSystem(
        documentsDirectoryProvider: getApplicationDocumentsDirectory,
      ),
    );
    registerLazySingleton<ChantLocalResourceResolver>(
      () => ChantLocalResourceResolver(
        chantCacheFileSystem: GetIt.I.get<ChantCacheFileSystem>(),
      ),
    );
    registerLazySingleton<ChantAssetDownloader>(
      () => ChantAssetDownloader(
        chantCacheRepo: GetIt.I.get<ChantCacheRepository>(),
        chantCacheFileSystem: GetIt.I.get<ChantCacheFileSystem>(),
        storageDataProvider: GetIt.I.get<StorageDataProvider>(),
      ),
    );
    registerLazySingleton<ChantCacheValidator>(() => ChantCacheValidator());

    // Use Cases
    registerFactory<CacheChantsUseCase>(
      () => CacheChantsUseCase(
        chantCacheRepo: GetIt.I.get<ChantCacheRepository>(),
        chantCacheValidator: GetIt.I.get<ChantCacheValidator>(),
        chantAssetDownloader: GetIt.I.get<ChantAssetDownloader>(),
        localResourceResolver: GetIt.I.get<ChantLocalResourceResolver>(),
      ),
    );
    registerFactory<StartChantingUseCase>(
      () => StartChantingUseCase(
        chantRepo: GetIt.I.get<ChantRepository>(),
        cacheChantsUseCase: GetIt.I.get<CacheChantsUseCase>(),
        chantingAudioService: GetIt.I.get<ChantingAudioService>(),
      ),
    );
    registerFactory<LoadLyricsUseCase>(
      () => LoadLyricsUseCase(lyricsService: GetIt.I.get<LyricsService>()),
    );
    registerFactory<PlaybackStateChangeUseCase>(
      () => PlaybackStateChangeUseCase(),
    );
    registerFactory<CompleteChantingUseCase>(
      () => CompleteChantingUseCase(
        idGeneratorService: GetIt.I.get<IdGeneratorService>(),
      ),
    );

    // ViewModels
    registerFactory<ChantingSettingsCubit>(
      () => ChantingSettingsCubit(
        chantingApi: GetIt.I.get<ChantingPublicApi>(),
        sharedPreferencesService: GetIt.I.get<SharedPreferencesService>(),
        crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      ),
    );
    registerFactoryParam<ChantingCubit, ChantingSettings, void>(
      (chantingSettings, _) => ChantingCubit(
        chantingSettings: chantingSettings,
        sessionNavigator: GetIt.I.get<SessionNavigator>(),
        audioService: GetIt.I.get<ChantingAudioService>(),
        crashlyticsService: GetIt.I.get<CrashlyticsService>(),
        startChantingUseCase: GetIt.I.get<StartChantingUseCase>(),
        loadLyricsUseCase: GetIt.I.get<LoadLyricsUseCase>(),
        playbackStateChangeUseCase: GetIt.I.get<PlaybackStateChangeUseCase>(),
        completeChantingUseCase: GetIt.I.get<CompleteChantingUseCase>(),
      ),
    );

    // Public API
    registerLazySingleton<ChantingPublicApi>(
      () => DefaultChantingPublicApi(
        chantRepository: GetIt.I.get<ChantRepository>(),
        chantCacheRepository: GetIt.I.get<ChantCacheRepository>(),
      ),
    );
    registerLazySingleton<ClearCacheCapability>(
      () => ChantingCacheClearCapability(
        chantCacheRepository: GetIt.I.get<ChantCacheRepository>(),
      ),
    );
  }
}
