import 'package:auth/src/domain/usecase/sign_in_with_auth_provider_use_case.dart';
import 'package:auth/src/presentation/viewmodel/auth_cubit.dart';
import 'package:core/core.dart';
import 'package:firebase_provider/firebase_provider.dart';
import 'package:get_it/get_it.dart';

import 'package:auth/src/data/datasource/auth/firebase_auth_data_provider.dart';
import 'package:auth/src/domain/usecase/sign_in_with_email_and_password_use_case.dart';
import 'package:auth/src/domain/usecase/sign_out_use_case.dart';
import 'package:auth/src/public/api/auth_public_api.dart';
import 'package:auth/src/data/datasource/auth/auth_data_provider.dart';
import 'package:auth/src/data/repository/default_auth_repository.dart';
import 'package:auth/src/data/service/default_auth_public_api.dart';
import 'package:auth/src/domain/repository/auth_repository.dart';

/// Registers the dependencies for the Auth module in the GetIt service locator.
extension AuthModuleDependencyInjection on GetIt {

  void registerAuthModuleDependencies() {
    // Data providers
    final firebaseProvider = get<FirebaseProvider>();
    registerLazySingleton<AuthDataProvider>(
      () => FirebaseAuthDataProvider(firebaseProvider.auth),
    );

    // Repositories
    registerLazySingleton<AuthRepository>(
      () => DefaultAuthRepository(
        authDataProvider: get<AuthDataProvider>(),
      ),
    );

    // Use cases
    registerFactory<SigninWithAuthProviderUseCase>(
      () => SigninWithAuthProviderUseCase(
        authRepository: get<AuthRepository>(),
      ),
    );

    registerFactory<SignInWithEmailAndPasswordUseCase>(
      () => SignInWithEmailAndPasswordUseCase(
        authRepository: get<AuthRepository>(),
      ),
    );

    registerFactory<SignoutUseCase>(
      () => SignoutUseCase(
        authRepository: get<AuthRepository>(),
      ),
    );

    // Public API
    registerLazySingleton<AuthPublicApi>(
      () => DefaultAuthPublicApi(
        authRepository: get<AuthRepository>(),
        signInWithAuthProviderUseCase: get<SigninWithAuthProviderUseCase>(),
        signInWithEmailAndPasswordUseCase: get<SignInWithEmailAndPasswordUseCase>(),
        signOutUseCase: get<SignoutUseCase>(),
      ),
    );

    // View models
    // Contract from core module
    registerFactoryParam<AuthCubit, AuthState, void>(
      (initialAuthState, _) => AuthCubit(
        initialAuthState: initialAuthState,
        profileNavigator: get<ProfileNavigator>(),
        authApi: get<AuthPublicApi>(),
        analyticsService: get<AnalyticsService>(),
        crashlyticsService: get<CrashlyticsService>(),
      ),
    );

  }
}
