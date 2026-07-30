import 'package:dhyana/core/service/auth_service.dart';
import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';

class DefaultAuthService implements AuthService {

  final AuthRepository authRepository;

  DefaultAuthService({
    required this.authRepository,
  });
    
  @override
  Future<void> signInWithApple() => authRepository.signIn(.apple);
    
  @override
  Future<void> signInWithGoogle() => authRepository.signIn(.google);

  @override
  Future<void> signInWithEmailAndPassword({
    required String email, 
    required String password
  }) => authRepository.signIn(.emailAndPassword, email: email, password: password);
  
  
  @override
  Future<void> signOut() => authRepository.signOut();

  @override
  Future<void> deleteUser() => authRepository.deleteUser();
  
}