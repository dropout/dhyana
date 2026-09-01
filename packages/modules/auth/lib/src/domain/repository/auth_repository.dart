import 'package:auth/src/domain/entity/user_entity.dart';
import 'package:auth/src/domain/enum/signin_auth_provider_type.dart';

typedef SigninWithAuthProviderResult = ({UserEntity user, bool isFirstSignin});

abstract class AuthRepository {
  Stream<UserEntity?> get authStateChange;
  Stream<UserEntity?> get userChange;
  UserEntity? get user;

  Future<SigninWithAuthProviderResult> signInWithAuthProvider(
    SigninAuthProviderType signinMethodType
  );

  Future<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
  Future<void> deleteUser();
}
