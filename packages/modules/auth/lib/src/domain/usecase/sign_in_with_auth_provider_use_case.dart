import 'package:auth/src/domain/enum/signin_auth_provider_type.dart';
import 'package:auth/src/domain/repository/auth_repository.dart';

/// Use case for signing in with an authentication provider.
class SigninWithAuthProviderUseCase {
  final AuthRepository authRepository;

  SigninWithAuthProviderUseCase({
    required this.authRepository,
  });

  Future<SigninWithAuthProviderResult> 
  execute(SigninAuthProviderType signinMethodType) async =>
    await authRepository.signInWithAuthProvider(signinMethodType);
  
}
