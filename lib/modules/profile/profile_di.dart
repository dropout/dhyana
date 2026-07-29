import 'package:dhyana/core/service/profile_stats_updater_service.dart';
import 'package:get_it/get_it.dart';

import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/modules/profile/domain/usecase/load_profile_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_settings_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_use_case.dart';
import 'package:dhyana/modules/profile/data/service/default_profile_stats_report_updater_service.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile/profile_cubit.dart';
import 'package:dhyana/modules/profile/data/datasource/firebase_profile_data_provider.dart';
import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';
import 'package:dhyana/modules/profile/data/repository/default_profile_repository.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/profile/domain/service/safe_image_detector.dart';
import 'package:dhyana/modules/profile/data/service/default_safe_image_detector.dart';
import 'package:dhyana/core/util/firebase_provider.dart';

final getIt = GetIt.instance;

void configureProfileModuleDependencies() {
  _configureDataProviders();
  _configureRepositories();
  _configureServices();
  _configureUseCases();
  _configureViewModels();
}

void _configureDataProviders() {
  getIt.registerLazySingleton<ProfileDataProvider>(
    () => FirebaseProfileDataProvider(getIt.get<FirebaseProvider>().firestore),
  );
}

void _configureRepositories() {
  getIt.registerLazySingleton<ProfileRepository>(
    () => DefaultProfileRepository(
      profileDataProvider: getIt.get<ProfileDataProvider>(),
      storageDataProvider: getIt.get<StorageDataProvider>(),
    ),
  );
}

void _configureServices() {
  getIt.registerLazySingleton<SafeImageDetectorFactory>(
    () => DefaultSafeImageDetectorFactory(),
  );
  getIt.registerLazySingleton<ProfileStatsUpdaterService>(
    () => DefaultProfileReportUpdaterService(),
  );
}

void _configureUseCases() {
  getIt.registerLazySingleton(
    () => LoadProfileUseCase(
      profileRepository: getIt.get<ProfileRepository>(),
      profileStatsUpdater: DefaultProfileReportUpdaterService(),
    ),
  );

  getIt.registerLazySingleton(
    () => UpdateProfileUseCase(
      profileRepository: getIt.get<ProfileRepository>(),
      storageRepository: getIt.get<StorageRepository>(),
    ),
  );

  getIt.registerLazySingleton(
    () => UpdateProfileSettingsUseCase(
      profileRepository: getIt.get<ProfileRepository>(),
    ),
  );
}

void _configureViewModels() {
  getIt.registerLazySingleton(
    () => ProfileCubit(
      loadProfileUseCase: getIt.get<LoadProfileUseCase>(),
      updateProfileUseCase: getIt.get<UpdateProfileUseCase>(),
      updateProfileSettingsUseCase: getIt.get<UpdateProfileSettingsUseCase>(),
      crashlyticsService: getIt.get<CrashlyticsService>(),
    ),
  );
}
