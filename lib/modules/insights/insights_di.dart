import 'package:dhyana/modules/practice/session/domain/repository/statistics_repository.dart';
import 'package:dhyana/modules/insights/data/datasource/firebase_insights_data_provider_factory.dart';
import 'package:dhyana/modules/insights/data/repository/firebase_statistics_repository.dart';
import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:get_it/get_it.dart';

void configureInsightsModuleDependencies() {
  _configureDataProviders();
  _configureRepostories();
}

void _configureDataProviders() {

}

void _configureRepostories() {
  GetIt.I.registerLazySingleton<StatisticsRepository>(() {
    final firebaseProvider = GetIt.I.get<FirebaseProvider>();
    return FirebaseStatisticsRepository(
      fireStore: firebaseProvider.firestore,
      dataProviderFactory: FirebaseInsightsDataProviderFactory(
        fireStore: firebaseProvider.firestore,
      )
    );
  });

}
