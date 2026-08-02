import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/core/service/module/chanting_service.dart';
import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/drift/chant_cache_database.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/chant_cache_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/chants_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/drift_chant_cache_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/datasource/firebase_chants_data_provider.dart';
import 'package:dhyana/modules/practice/chanting/data/service/default_chanting_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/repository/chants_repository.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chanting_audio_service.dart';
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
  GetIt.I.registerLazySingleton<ChantsDataProvider>(
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

}

void _configureServices() {
  GetIt.I.registerLazySingleton<ChantingService>(() => DefaultChantingService(
    chantsRepository: GetIt.I.get<ChantsRepository>(),
  ));
  GetIt.I.registerFactory<ChantingAudioService>(
    () => ChantingAudioService(GetIt.I.get<AppAudioHandler>()),
  );
}



void _configureUseCases() {



}



void _configureViewModels() {

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


