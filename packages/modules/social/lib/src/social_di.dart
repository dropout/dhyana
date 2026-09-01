import 'package:get_it/get_it.dart';

import 'package:firebase_provider/firebase_provider.dart';
import 'package:core/core.dart';

import 'package:social/src/public/api/social_public_api.dart';
import 'package:social/src/data/datasource/firebase_presence_data_provider.dart';
import 'package:social/src/data/datasource/presence_data_provider.dart';
import 'package:social/src/data/repository/default_presence_repository.dart';
import 'package:social/src/domain/repository/presence_repository.dart';
import 'package:social/src/data/service/default_social_public_api.dart';
import 'package:social/src/domain/usecase/query_presence_use_case.dart';
import 'package:social/src/public/viewmodel/presence_cubit.dart';

extension SocialModuleDependencyInjection on GetIt {
  void registerSocialModuleDependencies() {
    
    // Data Providers
    registerLazySingleton<PresenceDataProvider>(() =>
      FirebasePresenceDataProvider(GetIt.I.get<FirebaseProvider>().firestore),
    );

    // Repositories
    registerLazySingleton<PresenceRepository>(
      () => DefaultPresenceRepository(
        presenceDataProvider: GetIt.I.get<PresenceDataProvider>(),
      ),
    );

    // Use Cases
    registerLazySingleton(
      () => QueryPresenceUseCase(
        presenceRepository: GetIt.I.get<PresenceRepository>(),
      ),
    );

    // ViewModels
    registerFactory<PresenceCubit>(() {
      return PresenceCubit(
        queryPresenceDataUseCase: GetIt.I.get<QueryPresenceUseCase>(),
        crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      );
    });

    // Public API
    registerLazySingleton<SocialPublicApi>(
      () => DefaultSocialPublicApi(
        presenceRepository: GetIt.I.get<PresenceRepository>(),
      ),
    );


  }
}
