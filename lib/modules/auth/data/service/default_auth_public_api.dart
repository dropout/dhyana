import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';
import 'package:dhyana/modules/auth/public/api/auth_public_api.dart';
import 'package:dhyana/modules/auth/public/mappers/auth_public_failure_mapper.dart';

class DefaultAuthPublicApi implements AuthPublicApi {  

  final AuthRepository authRepository;

  const DefaultAuthPublicApi({
    required this.authRepository,
  });

  @override
  Stream<AuthSession> get authSessionStream {
    return authRepository.authStateChange.map((user) {
      if (user == null) {
        return (
          isAuthenticated: false,
          userId: null,
        );
      }
      return (
        isAuthenticated: true,
        userId: user.uid,
      );
    });
  }

  @override
  Future<AuthPublicSigninResult> signInWithApple() async {
    try {
      final result = await authRepository.signIn(.apple);
      return (
        userId: result.user.uid,
        isFirstSignin: result.isFirstSignin,
      );
    } catch (error) {
      throw error.toPublicFailure();
    }
  }

  @override
  Future<AuthPublicSigninResult> signInWithGoogle() async {
    try {
      final result = await authRepository.signIn(.google);
      return (
        userId: result.user.uid,
        isFirstSignin: result.isFirstSignin,
      );
    } catch (error) {
      throw error.toPublicFailure();
    }
  }

  @override
  Future<AuthPublicSigninResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final result = await authRepository.signIn(
        .emailAndPassword,
        email: email,
        password: password,
      );
      return (
        userId: result.user.uid,
        isFirstSignin: result.isFirstSignin,
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