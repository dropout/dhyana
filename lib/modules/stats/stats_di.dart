import 'package:dhyana/modules/stats/data/repository/bucket_filling_stats_repository.dart';
import 'package:dhyana/modules/stats/presentation/viewmodel/stats_bucket_cubit.dart';
import 'package:dhyana/modules/stats/public/api/stats_public_api.dart';
import 'package:dhyana/modules/profile/public/api/profile_public_api.dart';
import 'package:get_it/get_it.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/modules/stats/data/service/default_stats_public_api.dart';
import 'package:dhyana/modules/stats/domain/repository/stats_repository.dart';
import 'package:dhyana/modules/stats/data/datasource/firebase_stats_data_provider_factory.dart';
import 'package:dhyana/modules/stats/data/repository/firebase_stats_repository.dart';

void registerStatsModuleDependencies() {
  _registerDataProviders();
  _registerRepositories();
  _registerServices();
  _registerViewModels();
  _registerPublicApi();
}

void _registerDataProviders() {

}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<StatsRepository>(() {
    final firebaseProvider = GetIt.I.get<FirebaseProvider>();
    return BucketFillingRepository(
      statisticsRepository: FirestoreStatsRepository(
        dataProviderFactory: FirebaseStatsDataProviderFactory(
          fireStore: firebaseProvider.firestore,
        ),
      ),
    );
  });
}

void _registerServices() {

}

void _registerViewModels() {
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
      statisticsRepository: GetIt.I.get<StatsRepository>(),
      profilePublicApi: GetIt.I.get<ProfilePublicApi>(),
    );
  });
}