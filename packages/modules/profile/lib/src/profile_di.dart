import 'package:auth/auth.dart';
import 'package:get_it/get_it.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:core/core.dart';
import 'package:profile/src/domain/usecase/load_profile_use_case.dart';
import 'package:profile/src/domain/usecase/update_profile_settings_use_case.dart';
import 'package:profile/src/domain/usecase/update_profile_use_case.dart';
import 'package:profile/src/data/datasource/firebase_profile_data_provider.dart';
import 'package:profile/src/data/datasource/profile_data_provider.dart';
import 'package:profile/src/data/repository/default_profile_repository.dart';
import 'package:profile/src/domain/repository/profile_repository.dart';
import 'package:profile/src/data/service/default_profile_public_api.dart';
import 'package:profile/src/domain/service/profile_stats_updater_service.dart';
import 'package:profile/src/domain/usecase/delete_profile_use_case.dart';
import 'package:profile/src/presentation/viewmodel/delete_profile_cubit.dart';
import 'package:profile/src/public/viewmodel/profile_cubit.dart';
import 'package:profile/src/presentation/viewmodel/profile_edit_cubit.dart';
import 'package:profile/src/public/api/profile_public_api.dart';


extension ProfileModuleDependencyInjection on GetIt {
  void registerProfileModuleDependencies() {

    // Data providers
    registerLazySingleton<ProfileDataProvider>(
      () =>
          FirebaseProfileDataProvider(GetIt.I.get<FirebaseProvider>().firestore),
    );

    // Repositories
    registerLazySingleton<ProfileRepository>(
      () => DefaultProfileRepository(
        profileDataProvider: GetIt.I.get<ProfileDataProvider>(),
      ),
    );

    // Services
    registerLazySingleton<SafeImageDetectorFactory>(
      () => DefaultSafeImageDetectorFactory(),
    );
    registerLazySingleton<ProfileStatsReportUpdaterService>(
      () => ProfileStatsReportUpdaterService(),
    );

    // Use cases
    registerLazySingleton(
      () => LoadProfileUseCase(
        profileRepository: GetIt.I.get<ProfileRepository>(),
        profileStatsUpdater: GetIt.I.get<ProfileStatsReportUpdaterService>(),
      ),
    );

    registerLazySingleton(
      () => UpdateProfileUseCase(
        profileRepository: GetIt.I.get<ProfileRepository>(),
        storageRepository: GetIt.I.get<StorageRepository>(),
      ),
    );

    registerLazySingleton(
      () => UpdateProfileSettingsUseCase(
        profileRepository: GetIt.I.get<ProfileRepository>(),
      ),
    );

    registerLazySingleton(
      () => DeleteProfileUseCase(
        authApi: GetIt.I.get<AuthPublicApi>(),
        profileRepository: GetIt.I.get<ProfileRepository>(),
        storageRepository: GetIt.I.get<StorageRepository>(),
      ),
    );    

    // View models
    registerFactory<ProfileEditCubit>(
      () => ProfileEditCubit(
        crashlyticsService: GetIt.I.get<CrashlyticsService>(),
        loadProfileUseCase: GetIt.I.get<LoadProfileUseCase>(),
        updateProfileUseCase: GetIt.I.get<UpdateProfileUseCase>(),
        updateProfileSettingsUseCase: GetIt.I.get<UpdateProfileSettingsUseCase>(),
      ),
    );

    registerFactory<DeleteProfileCubit>(
      () => DeleteProfileCubit(
        deleteProfileUseCase: GetIt.I.get<DeleteProfileUseCase>(),
        crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      ),
    );

    // Contract from core module
    registerFactory<ProfileCubit>(
      () => ProfileCubit(
        authPublicApi: get<AuthPublicApi>(),
        profilePublicApi: get<ProfilePublicApi>(),
        crashlyticsService: get<CrashlyticsService>(),
      ),
    );

    // API
    registerLazySingleton<ProfilePublicApi>(
      () => DefaultProfilePublicApi(
        profileRepository: GetIt.I.get<ProfileRepository>(),
        profileStatsUpdater:
            GetIt.I.get<ProfileStatsReportUpdaterService>(),
        storageRepository: GetIt.I.get<StorageRepository>(),
      ),
    );

  }
}

