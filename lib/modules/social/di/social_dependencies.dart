import 'package:dhyana/core/domain/repository/auth_repository.dart';
import 'package:dhyana/core/domain/repository/presence_repository.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/social/data/datasource/firebase_presence_data_provider.dart';
import 'package:dhyana/modules/social/data/datasource/presence_data_provider.dart';
import 'package:dhyana/modules/social/data/repository/firebase_presence_repository.dart';
import 'package:dhyana/modules/social/domain/usecase/load_presence_data_use_case.dart';
import 'package:dhyana/modules/social/domain/usecase/show_presence_use_case.dart';
import 'package:dhyana/modules/social/presentation/viewmodel/presence/presence_cubit.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureSocialModuleDependencies() {
  _configureDataProviders();
  _configureRepositories();
  _configureUseCases();
  _configureViewModels();
}

void _configureDataProviders() {
  getIt.registerLazySingleton<PresenceDataProvider>(
    () => FirebasePresenceDataProvider(getIt.get<FirebaseProvider>().firestore),
  );
}

void _configureRepositories() {
  getIt.registerLazySingleton<PresenceRepository>(
    () => DefaultPresenceRepository(
      presenceDataProvider: getIt.get<PresenceDataProvider>(),
    ),
  );
}

void _configureUseCases() {
  getIt.registerLazySingleton(
    () => LoadPresenceDataUseCase(
      presenceRepository: getIt.get<PresenceRepository>(),
    ),
  );
  getIt.registerLazySingleton(
    () => ShowPresenceUseCase(
      presenceRepository: getIt.get<PresenceRepository>(),
      profileRepository: getIt.get<ProfileRepository>(),
      authRepository: getIt.get<AuthRepository>(),
    ),
  );
}

void _configureViewModels() {
  getIt.registerFactory<PresenceCubit>(() {
    return PresenceCubit(
      loadPresenceDataUseCase: getIt.get<LoadPresenceDataUseCase>(),
      showPresenceUseCase: getIt.get<ShowPresenceUseCase>(),
      crashlyticsService: getIt.get<CrashlyticsService>(),
    );
  });
}
