import 'package:get_it/get_it.dart';

import 'package:dhyana/core/data/datasource/timer_auth_data_provider.dart';
import 'package:dhyana/modules/auth/public/api/auth_public_api.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/auth_provider.dart';
import 'package:dhyana/modules/auth/data/repository/default_auth_repository.dart';
import 'package:dhyana/modules/auth/data/service/default_auth_public_api.dart';
import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';
import 'package:dhyana/modules/auth/data/datasource/default_timer_auth_data_provider.dart';

void registerAuthModuleDependencies() {
  _registerDataProviders();
  _registerRepositories();
  _registerServices();
  _registerPublicApi();
}

void _registerDataProviders() {
  GetIt.I.registerLazySingleton<TimerAuthDataProvider>(
    () => DefaultTimerAuthDataProvider(
      authProvider: GetIt.I.get<AuthProvider>(),
    ),
  );
}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => DefaultAuthRepository(
      authDataProvider: GetIt.I.get<AuthProvider>(),
    ),
  );
}

void _registerServices() {

}

void _registerPublicApi() {
  GetIt.I.registerLazySingleton<AuthPublicApi>(
    () => DefaultAuthPublicApi(
      authRepository: GetIt.I.get<AuthRepository>(),
    ),
  );
}