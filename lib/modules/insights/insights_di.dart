import 'package:dhyana/modules/insights/public/api/public_insights_api.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:get_it/get_it.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/modules/insights/data/service/default_insights_service.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/insights/data/datasource/firebase_stats_data_provider_factory.dart';
import 'package:dhyana/modules/insights/data/repository/firebase_statistics_repository.dart';

void registerInsightsModuleDependencies() {
  _registerDataProviders();
  _registerRepositories();
  _registerServices();
  _registerPublicApi();
}

void _registerDataProviders() {

}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<StatisticsRepository>(() {
    final firebaseProvider = GetIt.I.get<FirebaseProvider>();
    return FirebaseStatisticsRepository(
        dataProviderFactory: FirebaseStatsDataProviderFactory(
          fireStore: firebaseProvider.firestore,
      ),
    );
  });
}

void _registerServices() {
  
}

void _registerPublicApi() {
  GetIt.I.registerLazySingleton<PublicInsightsApi>(() {
    return DefaultPublicInsightsApi(
      statisticsRepository: GetIt.I.get<StatisticsRepository>(),
      profilePublicApi: GetIt.I.get<ProfilePublicApi>(),
    );
  });
}