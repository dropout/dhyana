import 'package:get_it/get_it.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/presence_service.dart';
import 'package:dhyana/modules/social/data/datasource/firebase_presence_data_provider.dart';
import 'package:dhyana/modules/social/data/datasource/presence_data_provider.dart';
import 'package:dhyana/modules/social/data/repository/default_presence_repository.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';
import 'package:dhyana/modules/social/data/service/default_presence_service.dart';
import 'package:dhyana/modules/social/domain/usecase/load_presence_data_use_case.dart';
import 'package:dhyana/modules/social/presentation/viewmodel/presence_cubit.dart';

void configureSocialModuleDependencies() {
  _configureDataProviders();
  _configureRepositories();
  _configureServices();
  _configureUseCases();
  _configureViewModels();
}

void _configureDataProviders() {
  GetIt.I.registerLazySingleton<PresenceDataProvider>(
    () => FirebasePresenceDataProvider(GetIt.I.get<FirebaseProvider>().firestore),
  );
}

void _configureRepositories() {
  GetIt.I.registerLazySingleton<PresenceRepository>(
    () => DefaultPresenceRepository(
      presenceDataProvider: GetIt.I.get<PresenceDataProvider>(),
    ),
  );
}

void _configureServices() {
  GetIt.I.registerLazySingleton<PresenceService>(
    () => DefaultPresenceService(
      presenceRepository: GetIt.I.get<PresenceRepository>(),
    ),
  );
}

void _configureUseCases() {
  GetIt.I.registerLazySingleton(
    () => LoadPresenceDataUseCase(
      presenceRepository: GetIt.I.get<PresenceRepository>(),
    ),
  );
}

void _configureViewModels() {
  GetIt.I.registerFactory<PresenceCubit>(() {
    return PresenceCubit(
      loadPresenceDataUseCase: GetIt.I.get<LoadPresenceDataUseCase>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
    );
  });
}
