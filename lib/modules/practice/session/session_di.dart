import 'package:dhyana/modules/stats/public/api/stats_public_api.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:get_it/get_it.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/mindful_minutes_service.dart';
import 'package:dhyana/modules/practice/session/data/repository/firebase_session_repository.dart';
import 'package:dhyana/modules/practice/session/domain/repository/session_repository.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/log_session_insights_use_case.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/sessions/sessions_cubit.dart';

void registerSessionModuleDependencies() {
  _registerDataProviders();
  _registerRepositories();
  _registerUseCases();
  _registerViewModels();  
}

void _registerDataProviders() {

}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<SessionRepository>(() {
    return FirebaseSessionRepository(
      firestore: GetIt.I.get<FirebaseProvider>().firestore,
    );
  });

}

void _registerUseCases() {
  GetIt.I.registerFactory<LogSessionInsightsUseCase>(
    () => LogSessionInsightsUseCase(
      statsPublicApi: GetIt.I.get<StatsPublicApi>(),
      mindfulMinutesService: GetIt.I.get<MindfulMinutesService>(),
    ),
  );
  GetIt.I.registerFactory<UpdateProfileWithSessionUseCase>(
    () => UpdateProfileWithSessionUseCase(
      profilePublicApi: GetIt.I.get<ProfilePublicApi>(),
    ),
  );
}

void _registerViewModels() {
  GetIt.I.registerFactory<SessionCompletedCubit>(() {
    return SessionCompletedCubit(      
      updateProfileWithSession: GetIt.I.get<UpdateProfileWithSessionUseCase>(),
      logSessionUseCase: GetIt.I.get<LogSessionInsightsUseCase>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
    );
  });

  GetIt.I.registerFactory<SessionsCubit>(() {
    return SessionsCubit(
      sessionRepository: GetIt.I.get<SessionRepository>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
    );
  });



}