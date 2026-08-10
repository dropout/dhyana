import 'package:dhyana/modules/social/public/api/social_public_api.dart';
import 'package:get_it/get_it.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/modules/social/data/datasource/firebase_presence_data_provider.dart';
import 'package:dhyana/modules/social/data/datasource/presence_data_provider.dart';
import 'package:dhyana/modules/social/data/repository/default_presence_repository.dart';
import 'package:dhyana/modules/social/domain/repository/presence_repository.dart';
import 'package:dhyana/modules/social/data/service/default_social_public_api.dart';
import 'package:dhyana/modules/social/domain/usecase/load_presence_data_use_case.dart';
import 'package:dhyana/modules/social/presentation/viewmodel/presence_cubit.dart';

void registerSocialModuleDependencies() {
  _registerDataProviders();
  _registerUseCases();
  _registerServices();
  _registerRepositories();
  _registerViewModels();
  _registerPublicApi();
}

void _registerDataProviders() {
  GetIt.I.registerLazySingleton<PresenceDataProvider>(
    () =>
        FirebasePresenceDataProvider(GetIt.I.get<FirebaseProvider>().firestore),
  );
}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<PresenceRepository>(
    () => DefaultPresenceRepository(
      presenceDataProvider: GetIt.I.get<PresenceDataProvider>(),
    ),
  );
}

void _registerServices() {
  GetIt.I.registerLazySingleton<SocialPublicApi>(
    () => DefaultSocialPublicApi(
      presenceRepository: GetIt.I.get<PresenceRepository>(),
    ),
  );
}

void _registerUseCases() {
  GetIt.I.registerLazySingleton(
    () => LoadPresenceDataUseCase(
      presenceRepository: GetIt.I.get<PresenceRepository>(),
    ),
  );
}

void _registerViewModels() {
  GetIt.I.registerFactory<PresenceCubit>(() {
    return PresenceCubit(
      loadPresenceDataUseCase: GetIt.I.get<LoadPresenceDataUseCase>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
    );
  });
}

void _registerPublicApi() {
  GetIt.I.registerLazySingleton<SocialPublicApi>(
    () => DefaultSocialPublicApi(
      presenceRepository: GetIt.I.get<PresenceRepository>(),
    ),
  );
}
