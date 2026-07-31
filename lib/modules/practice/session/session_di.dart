import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/insights_service.dart';
import 'package:dhyana/core/service/mindful_minutes_service.dart';
import 'package:dhyana/core/service/profile_service.dart';
import 'package:dhyana/modules/practice/session/data/repository/firebase_session_repository.dart';
import 'package:dhyana/modules/practice/session/domain/repository/session_repository.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/log_session_insights_use_case.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:dhyana/modules/practice/session/presentation/viewmodel/sessions/sessions_cubit.dart';
import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void configureSessionModuleDependencies() {
  _configureDataProviders();
  _configureRepositories();
  _configureUseCases();
  _configureViewModels();  
}

void _configureDataProviders() {

}

void _configureRepositories() {
  getIt.registerLazySingleton<SessionRepository>(() {
    return FirebaseSessionRepository(
      firestore: getIt.get<FirebaseProvider>().firestore,
    );
  });

}

void _configureUseCases() {
  getIt.registerFactory<UpdateProfileWithSessionUseCase>(
    () => UpdateProfileWithSessionUseCase(
      profileService: getIt.get<ProfileService>(),
    ),
  );

  getIt.registerFactory<LogSessionInsightsUseCase>(
    () => LogSessionInsightsUseCase(
      insightsService: getIt.get<InsightsService>(),
      mindfulMinutesService: getIt.get<MindfulMinutesService>(),
    ),
  );
}

void _configureViewModels() {
  getIt.registerFactory<SessionCompletedCubit>(() {
    return SessionCompletedCubit(
      crashlyticsService: getIt.get<CrashlyticsService>(),
      saveSessionToProfileUseCase: getIt.get<UpdateProfileWithSessionUseCase>(),
      logSessionUseCase: getIt.get<LogSessionInsightsUseCase>(),
    );
  });

  getIt.registerFactory<SessionsCubit>(() {
    return SessionsCubit(
      sessionRepository: getIt.get<SessionRepository>(),
      crashlyticsService: getIt.get<CrashlyticsService>(),
    );
  });



}