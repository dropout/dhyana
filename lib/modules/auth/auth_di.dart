import 'package:dhyana/modules/auth/domain/usecase/sign_in_with_auth_provider_use_case.dart';
import 'package:get_it/get_it.dart';

import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/firebase_auth_data_provider.dart';
import 'package:dhyana/modules/auth/domain/usecase/sign_in_with_email_and_password_use_case.dart';
import 'package:dhyana/modules/auth/domain/usecase/sign_out_use_case.dart';
import 'package:dhyana/modules/auth/public/api/auth_public_api.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/auth_data_provider.dart';
import 'package:dhyana/modules/auth/data/repository/default_auth_repository.dart';
import 'package:dhyana/modules/auth/data/service/default_auth_public_api.dart';
import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';


void registerAuthModuleDependencies() {
  _registerDataProviders();
  _registerRepositories();
  _registerUseCases();
  _registerPublicApi();
}

void _registerDataProviders() {
  final firebaseProvider = GetIt.I.get<FirebaseProvider>();
  GetIt.I.registerLazySingleton<AuthDataProvider>(
    () => FirebaseAuthDataProvider(firebaseProvider.auth),
  );
}

void _registerRepositories() {
  GetIt.I.registerLazySingleton<AuthRepository>(
    () => DefaultAuthRepository(
      authDataProvider: GetIt.I.get<AuthDataProvider>(),
    ),
  );
}

void _registerUseCases() {

  GetIt.I.registerLazySingleton<SigninWithAuthProviderUseCase>(
    () => SigninWithAuthProviderUseCase(
      authRepository: GetIt.I.get<AuthRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<SignInWithEmailAndPasswordUseCase>(
    () => SignInWithEmailAndPasswordUseCase(
      authRepository: GetIt.I.get<AuthRepository>(),
    ),
  );

  GetIt.I.registerLazySingleton<SignoutUseCase>(
    () => SignoutUseCase(
      authRepository: GetIt.I.get<AuthRepository>(),
    ),
  );

}

void _registerPublicApi() {
  GetIt.I.registerLazySingleton<AuthPublicApi>(
    () => DefaultAuthPublicApi(
      authRepository: GetIt.I.get<AuthRepository>(),
      signInWithAuthProviderUseCase: GetIt.I.get<SigninWithAuthProviderUseCase>(),
      signInWithEmailAndPasswordUseCase: GetIt.I.get<SignInWithEmailAndPasswordUseCase>(),
      signOutUseCase: GetIt.I.get<SignoutUseCase>(),
    ),
  );
}