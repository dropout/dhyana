import 'package:dhyana/modules/insights/data/repository/bucket_filling_repository.dart';
import 'package:dhyana/modules/insights/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:dhyana/modules/insights/public/api/stats_public_api.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:get_it/get_it.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/modules/insights/data/service/default_insights_service.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/insights/data/datasource/firebase_stats_data_provider_factory.dart';
import 'package:dhyana/modules/insights/data/repository/firebase_statistics_repository.dart';

void registerInsightsModuleDependencies() {
  _registerDataProviders();
  _registerRepositories();
  _registerServices();
  _registerViewModlels();
  _registerPublicApi();
}

void _registerDataProviders() {

}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<StatisticsRepository>(() {
    final firebaseProvider = GetIt.I.get<FirebaseProvider>();
    return BucketFillingRepository(
      statisticsRepository: FirebaseStatisticsRepository(
        dataProviderFactory: FirebaseStatsDataProviderFactory(
          fireStore: firebaseProvider.firestore,
        ),
      ),
    );
  });
}

void _registerServices() {

}

void _registerViewModlels() {
  GetIt.I.registerFactory<StatsBucketCubit>(() {
    return StatsBucketCubit(
      statsPublicApi: GetIt.I.get<StatsPublicApi>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
    );
  });
}

void _registerPublicApi() {
  GetIt.I.registerLazySingleton<StatsPublicApi>(() {
    return DefaultStatsPublicApi(
      statisticsRepository: GetIt.I.get<StatisticsRepository>(),
      profilePublicApi: GetIt.I.get<ProfilePublicApi>(),
    );
  });
}