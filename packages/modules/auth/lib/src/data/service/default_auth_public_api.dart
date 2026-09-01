import 'package:auth/src/domain/repository/auth_repository.dart';
import 'package:auth/src/domain/usecase/sign_in_with_auth_provider_use_case.dart';
import 'package:auth/src/domain/usecase/sign_in_with_email_and_password_use_case.dart';
import 'package:auth/src/domain/usecase/sign_out_use_case.dart';
import 'package:auth/src/public/api/auth_public_api.dart';
import 'package:auth/src/public/mappers/auth_public_failure_mapper.dart';

/// Default implementation of [AuthPublicApi] that uses [AuthRepository] and 
/// various use cases to provide authentication functionality.
/// TODO: Experimental exception handling
class DefaultAuthPublicApi implements AuthPublicApi {
  final AuthRepository authRepository;

  final SigninWithAuthProviderUseCase signInWithAuthProviderUseCase;
  final SignInWithEmailAndPasswordUseCase signInWithEmailAndPasswordUseCase;
  final SignoutUseCase signOutUseCase;
  
  const DefaultAuthPublicApi({
    required this.authRepository,
    required this.signInWithAuthProviderUseCase,
    required this.signInWithEmailAndPasswordUseCase,
    required this.signOutUseCase,
  });

  @override
  Stream<AuthSession> get authSessionStream {
    return authRepository.authStateChange.map((user) {
      if (user == null) {
        return (isAuthenticated: false, userId: null);
      }
      return (isAuthenticated: true, userId: user.uid);
    });
  }

  @override
  Future<AuthSigninResult> signInWithApple() async {
    try {
      final result = await signInWithAuthProviderUseCase.execute(.apple);
      return (userId: result.user.uid, isFirstSignin: result.isFirstSignin);
    } catch (error) {
      throw error.toPublicFailure();
    }
  }

  @override
  Future<AuthSigninResult> signInWithGoogle() async {
    try {
      final result = await signInWithAuthProviderUseCase.execute(.google);
      return (userId: result.user.uid, isFirstSignin: result.isFirstSignin);
    } catch (error) {
      throw error.toPublicFailure();
    }
  }

  @override
  Future<String> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRepository.signUpWithEmailAndPassword(
        email: email,
        password: password,
      );
      return user.uid;
    } catch (error) {
      throw error.toPublicFailure();
    }
  }

  @override
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      return await signInWithEmailAndPasswordUseCase.execute(
        email: email,
        password: password,
      );
    } catch (error) {
      throw error.toPublicFailure();
    }
  }

  @override
  Future<void> signOut() => authRepository.signOut();

  @override
  Future<void> deleteUser() => authRepository.deleteUser();
}
