import 'package:dhyana/modules/stats/public/api/stats_public_api.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:get_it/get_it.dart';

import 'package:core/core.dart';
import 'package:session/src/data/repository/firebase_session_repository.dart';
import 'package:session/src/domain/repository/session_repository.dart';
import 'package:session/src/domain/usecase/log_session_insights_use_case.dart';
import 'package:session/src/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:session/src/presentation/viewmodel/session_completed/session_completed_cubit.dart';
import 'package:session/src/presentation/viewmodel/sessions/sessions_cubit.dart';

extension SessionModuleDependencyInjection on GetIt {
  void registerSessionModuleDependencies() {

    // Repositories
    registerLazySingleton<SessionRepository>(() {
      return FirebaseSessionRepository(
        firestore: GetIt.I.get<FirebaseProvider>().firestore,
      );
    });

    // Use Cases
    registerFactory<LogSessionInsightsUseCase>(
      () => LogSessionInsightsUseCase(
        statsPublicApi: GetIt.I.get<StatsPublicApi>(),
        mindfulMinutesService: GetIt.I.get<MindfulMinutesService>(),
      ),
    );
    registerFactory<UpdateProfileWithSessionUseCase>(
      () => UpdateProfileWithSessionUseCase(
        profilePublicApi: GetIt.I.get<ProfilePublicApi>(),
      ),
    );

    // ViewModels
    registerFactory<SessionCompletedCubit>(() {
      return SessionCompletedCubit(      
        updateProfileWithSessionUseCase: GetIt.I.get<UpdateProfileWithSessionUseCase>(),
        logSessionUseCase: GetIt.I.get<LogSessionInsightsUseCase>(),
        crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      );
    });

    registerFactory<SessionsCubit>(() {
      return SessionsCubit(
        sessionRepository: GetIt.I.get<SessionRepository>(),
        crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      );
    });    

  }
}
