import 'package:get_it/get_it.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:stats/src/data/repository/bucket_filling_stats_repository.dart';
import 'package:stats/src/data/service/default_stats_navigator.dart';
import 'package:stats/src/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:stats/src/public/api/stats_public_api.dart';
import 'package:profile/profile.dart';

import 'package:core/core.dart';

import 'package:stats/src/data/service/default_stats_public_api.dart';
import 'package:stats/src/domain/repository/stats_repository.dart';
import 'package:stats/src/data/datasource/firebase_stats_data_provider_factory.dart';
import 'package:stats/src/data/repository/firebase_stats_repository.dart';


extension StatsModuleDependencyInjection on GetIt {
  void registerStatsModuleDependencies() {

    // Navigator
    registerLazySingleton<StatsNavigator>(
      () => DefaultStatsNavigator(get<GoRouter>())
    );

    // Repositories
    registerLazySingleton<StatsRepository>(() {
      final firebaseProvider = GetIt.I.get<FirebaseProvider>();
      return BucketFillingRepository(
        statisticsRepository: FirestoreStatsRepository(
          dataProviderFactory: FirebaseStatsDataProviderFactory(
            fireStore: firebaseProvider.firestore,
          ),
        ),
      );
    });

    // ViewModels
    registerFactory<StatsBucketCubit>(() {
      return StatsBucketCubit(
        statsPublicApi: GetIt.I.get<StatsPublicApi>(),
        crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      );
    });

    // Public API
    registerLazySingleton<StatsPublicApi>(() {
      return DefaultStatsPublicApi(
        statisticsRepository: GetIt.I.get<StatsRepository>(),
        profilePublicApi: GetIt.I.get<ProfilePublicApi>(),
      );
    });


  }
}
