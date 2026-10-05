import 'package:auth/src/domain/repository/auth_repository.dart';

class SignoutUseCase {
  final AuthRepository authRepository;

  const SignoutUseCase({required this.authRepository});

  Future<void> execute() async =>
    await authRepository.signOut();
  
}
