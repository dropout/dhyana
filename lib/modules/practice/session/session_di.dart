import 'package:get_it/get_it.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/module/insights_service.dart';
import 'package:dhyana/core/service/mindful_minutes_service.dart';
import 'package:dhyana/core/service/module/profile_service.dart';
import 'package:dhyana/modules/practice/session/data/repository/firebase_session_repository.dart';
import 'package:dhyana/modules/practice/session/domain/repository/session_repository.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/log_session_insights_use_case.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/sessions/sessions_cubit.dart';

void configureSessionModuleDependencies() {
  _configureDataProviders();
  _configureRepositories();
  _configureUseCases();
  _configureViewModels();  
}

void _configureDataProviders() {

}

void _configureRepositories() {
  GetIt.I.registerLazySingleton<SessionRepository>(() {
    return FirebaseSessionRepository(
      firestore: GetIt.I.get<FirebaseProvider>().firestore,
    );
  });

}

void _configureUseCases() {
  GetIt.I.registerFactory<UpdateProfileWithSessionUseCase>(
    () => UpdateProfileWithSessionUseCase(
      profileService: GetIt.I.get<ProfileService>(),
    ),
  );

  GetIt.I.registerFactory<LogSessionInsightsUseCase>(
    () => LogSessionInsightsUseCase(
      insightsService: GetIt.I.get<InsightsService>(),
      mindfulMinutesService: GetIt.I.get<MindfulMinutesService>(),
    ),
  );
}

void _configureViewModels() {
  GetIt.I.registerFactory<SessionCompletedCubit>(() {
    return SessionCompletedCubit(      
      saveSessionToProfileUseCase: GetIt.I.get<UpdateProfileWithSessionUseCase>(),
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