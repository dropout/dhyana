import 'package:dhyana/modules/auth/public/api/auth_public_api.dart';
import 'package:dhyana/modules/profile/data/service/default_profile_public_api.dart';
import 'package:dhyana/modules/profile/domain/service/profile_stats_updater_service.dart';
import 'package:dhyana/modules/profile/domain/usecase/delete_profile_use_case.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/delete_profile_cubit.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile_edit_cubit.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:get_it/get_it.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';

import 'package:dhyana/modules/profile/domain/usecase/load_profile_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_settings_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_use_case.dart';
import 'package:dhyana/modules/profile/data/datasource/firebase_profile_data_provider.dart';
import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';
import 'package:dhyana/modules/profile/data/repository/default_profile_repository.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/profile/domain/service/safe_image_detector.dart';
import 'package:dhyana/modules/profile/data/service/default_safe_image_detector.dart';

void registerProfileModuleDependencies() {
  _registerDataProviders();
  _registerRepositories();
  _registerServices();
  _registerUseCases();
  _registerViewModels();
  _registerApi();
}

void _registerDataProviders() {
  GetIt.I.registerLazySingleton<ProfileDataProvider>(
    () =>
        FirebaseProfileDataProvider(GetIt.I.get<FirebaseProvider>().firestore),
  );
}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<ProfileRepository>(
    () => DefaultProfileRepository(
      profileDataProvider: GetIt.I.get<ProfileDataProvider>(),
    ),
  );
}

void _registerServices() {
  GetIt.I.registerLazySingleton<SafeImageDetectorFactory>(
    () => DefaultSafeImageDetectorFactory(),
  );
  GetIt.I.registerLazySingleton<ProfileStatsReportUpdaterService>(
    () => ProfileStatsReportUpdaterService(),
  );
}

void _registerUseCases() {
  GetIt.I.registerLazySingleton(
    () => LoadProfileUseCase(
      profileRepository: GetIt.I.get<ProfileRepository>(),
      profileStatsUpdater: GetIt.I.get<ProfileStatsReportUpdaterService>(),
    ),
  );

  GetIt.I.registerLazySingleton(
    () => UpdateProfileUseCase(
      profileRepository: GetIt.I.get<ProfileRepository>(),
      storageRepository: GetIt.I.get<StorageRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton(
    () => UpdateProfileSettingsUseCase(
      profileRepository: GetIt.I.get<ProfileRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton(
    () => DeleteProfileUseCase(
      authApi: GetIt.I.get<AuthPublicApi>(),
      profileRepository: GetIt.I.get<ProfileRepository>(),
      storageRepository: GetIt.I.get<StorageRepository>(),
    ),
  );
}

void _registerViewModels() {
  GetIt.I.registerFactory<ProfileEditCubit>(
    () => ProfileEditCubit(
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      loadProfileUseCase: GetIt.I.get<LoadProfileUseCase>(),
      updateProfileUseCase: GetIt.I.get<UpdateProfileUseCase>(),
      updateProfileSettingsUseCase: GetIt.I.get<UpdateProfileSettingsUseCase>(),
    ),
  );

  GetIt.I.registerFactory<DeleteProfileCubit>(
    () => DeleteProfileCubit(
      deleteProfileUseCase: GetIt.I.get<DeleteProfileUseCase>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
    ),
  );
}

void _registerApi() {
  GetIt.I.registerLazySingleton<ProfilePublicApi>(
    () => DefaultProfilePublicApi(
      profileRepository: GetIt.I.get<ProfileRepository>(),
      profileStatsUpdater:
          GetIt.I.get<ProfileStatsReportUpdaterService>(),
      storageRepository: GetIt.I.get<StorageRepository>(),
    ),
  );
}