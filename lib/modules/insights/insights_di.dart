import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:get_it/get_it.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/service/module/insights_service.dart';
import 'package:dhyana/modules/insights/data/service/default_insights_service.dart';
import 'package:dhyana/modules/insights/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/insights/data/datasource/firebase_insights_data_provider_factory.dart';
import 'package:dhyana/modules/insights/data/repository/firebase_statistics_repository.dart';

void configureInsightsModuleDependencies() {
  _configureDataProviders();
  _configureRepostories();
  _configureServices();
}

void _configureDataProviders() {

}

void _configureRepostories() {
  GetIt.I.registerLazySingleton<StatisticsRepository>(() {
    final firebaseProvider = GetIt.I.get<FirebaseProvider>();
    return FirebaseStatisticsRepository(
      dataProviderFactory: FirebaseInsightsDataProviderFactory(
        fireStore: firebaseProvider.firestore,
      ),
    );
  });
}

void _configureServices() {
  GetIt.I.registerLazySingleton<InsightsService>(() {
    return DefaultInsightsService(
      statisticsRepository: GetIt.I.get<StatisticsRepository>(),
      profilePublicApi: GetIt.I.get<ProfilePublicApi>(),
    );
  });
}