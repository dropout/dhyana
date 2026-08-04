import 'package:get_it/get_it.dart';

import 'package:dhyana/core/service/module/auth_service.dart';
import 'package:dhyana/core/data/datasource/timer_auth_data_provider.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/auth_provider.dart';
import 'package:dhyana/modules/auth/data/repository/default_auth_repository.dart';
import 'package:dhyana/modules/auth/data/service/default_auth_service.dart';
import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';
import 'package:dhyana/modules/auth/data/datasource/default_timer_auth_data_provider.dart';

void registerAuthModuleDependencies() {
  _registerDataProviders();
  _registerRepositories();
  _registerServices();
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
  GetIt.I.registerLazySingleton<AuthService>(
    () => DefaultAuthService(
      authRepository: GetIt.I.get<AuthRepository>(),
    ),
  );
}