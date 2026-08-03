import 'package:get_it/get_it.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/data/datasource/insights_profile_data_provider.dart';
import 'package:dhyana/core/data/datasource/timer_profile_data_provider.dart';
import 'package:dhyana/core/domain/repository/storage_repository.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/module/profile_service.dart';

import 'package:dhyana/modules/profile/data/service/default_profile_service.dart';
import 'package:dhyana/modules/profile/presentation/viewmodel/profile_edit/profile_edit_cubit.dart';
import 'package:dhyana/modules/profile/data/datasource/default_insights_profile_data_provdier.dart';
import 'package:dhyana/modules/profile/data/datasource/default_timer_profile_data_provider.dart';
import 'package:dhyana/modules/profile/domain/usecase/load_profile_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_settings_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_use_case.dart';
import 'package:dhyana/modules/profile/data/service/default_profile_stats_report_updater_service.dart';
import 'package:dhyana/modules/profile/data/datasource/firebase_profile_data_provider.dart';
import 'package:dhyana/modules/profile/data/datasource/profile_data_provider.dart';
import 'package:dhyana/modules/profile/data/repository/default_profile_repository.dart';
import 'package:dhyana/modules/profile/domain/repository/profile_repository.dart';
import 'package:dhyana/modules/profile/domain/service/safe_image_detector.dart';
import 'package:dhyana/modules/profile/data/service/default_safe_image_detector.dart';

void configureProfileModuleDependencies() {
  _configureDataProviders();
  _configureRepositories();
  _configureServices();
  _configureUseCases();
  _configureViewModels();
}

void _configureDataProviders() {
  GetIt.I.registerLazySingleton<ProfileDataProvider>(
    () =>
        FirebaseProfileDataProvider(GetIt.I.get<FirebaseProvider>().firestore),
  );
  GetIt.I.registerLazySingleton<TimerProfileDataProvider>(
    () => DefaultTimerProfileDataProvider(
      GetIt.I.get<FirebaseProvider>().firestore,
    ),
  );
  GetIt.I.registerLazySingleton<InsightsProfileDataProvider>(
    () => DefaultInsightsProfileDataProvider(
      GetIt.I.get<FirebaseProvider>().firestore,
    ),
  );
}

void _configureRepositories() {
  GetIt.I.registerLazySingleton<ProfileRepository>(
    () => DefaultProfileRepository(
      profileDataProvider: GetIt.I.get<ProfileDataProvider>(),
      storageDataProvider: GetIt.I.get<StorageDataProvider>(),
    ),
  );
}

void _configureServices() {
  GetIt.I.registerLazySingleton<SafeImageDetectorFactory>(
    () => DefaultSafeImageDetectorFactory(),
  );
  GetIt.I.registerLazySingleton<ProfileService>(
    () => DefaultProfileService(
      profileRepository: GetIt.I.get<ProfileRepository>(),
      profileStatsReportUpdaterService:
        DefaultProfileReportUpdaterService(),
    ),
  );
}

void _configureUseCases() {
  GetIt.I.registerLazySingleton(
    () => LoadProfileUseCase(
      profileRepository: GetIt.I.get<ProfileRepository>(),
      profileStatsUpdater: DefaultProfileReportUpdaterService(),
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
}

void _configureViewModels() {
  GetIt.I.registerFactory<ProfileEditCubit>(
    () => ProfileEditCubit(
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      loadProfileUseCase: GetIt.I.get<LoadProfileUseCase>(),
      updateProfileUseCase: GetIt.I.get<UpdateProfileUseCase>(),
      updateProfileSettingsUseCase: GetIt.I.get<UpdateProfileSettingsUseCase>(),
    ),
    );
}
