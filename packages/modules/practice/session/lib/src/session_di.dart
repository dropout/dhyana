import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:core/core.dart';
import 'package:profile/profile.dart';

import 'package:session/src/data/repository/firebase_session_repository.dart';
import 'package:session/src/data/service/default_session_app_port.dart';
import 'package:session/src/data/service/default_session_navigator.dart';
import 'package:session/src/domain/repository/session_repository.dart';
import 'package:session/src/domain/service/session_app_port.dart';
import 'package:session/src/domain/usecase/log_session_insights_use_case.dart';
import 'package:session/src/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:session/src/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:session/src/presentation/viewmodel/sessions/sessions_cubit.dart';
import 'package:stats/stats.dart';


extension SessionModuleDependencyInjection on GetIt {
  void registerSessionModuleDependencies() {

    // Navigator
    registerLazySingleton<SessionNavigator>(
      () => DefaultSessionNavigator(
        get<GoRouter>(),
        idGeneratorService: get<IdGeneratorService>(),
      ),
    );

    // Repositories
    registerLazySingleton<SessionRepository>(() {
      return FirebaseSessionRepository(
        firestore: get<FirebaseProvider>().firestore,
      );
    });

    // Services
    registerLazySingleton<SessionAppPort>(() {
      // Replace with your actual implementation of SessionAppPort
      return DefaultSessionAppPort(
        profilePublicApi: get<ProfilePublicApi>(),
        statsPublicApi: get<StatsPublicApi>(),
        mindfulMinutesService: get<MindfulMinutesService>(),
      );
    });

    // Use Cases
    registerFactory<LogSessionInsightsUseCase>(
      () => LogSessionInsightsUseCase(
        sessionAppPort: get<SessionAppPort>(),
      ),
    );
    registerFactory<UpdateProfileWithSessionUseCase>(
      () => UpdateProfileWithSessionUseCase(
        sessionAppPort: GetIt.I.get<SessionAppPort>(),
      ),
    );

    // ViewModels
    registerFactory<SessionCompletedCubit>(() {
      return SessionCompletedCubit(      
        updateProfileWithSessionUseCase: get<UpdateProfileWithSessionUseCase>(),
        logSessionUseCase: get<LogSessionInsightsUseCase>(),
        crashlyticsService: get<CrashlyticsService>(),
      );
    });

    registerFactory<SessionsCubit>(() {
      return SessionsCubit(
        sessionRepository: get<SessionRepository>(),
        crashlyticsService: get<CrashlyticsService>(),
      );
    });    

  }
}
