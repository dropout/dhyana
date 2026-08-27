import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';

class SignInWithEmailAndPasswordUseCase {
  final AuthRepository authRepository;

  const SignInWithEmailAndPasswordUseCase({required this.authRepository});

  Future<String> execute({
    required String email,
    required String password,
  }) async => (await authRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    )).uid;
    
}