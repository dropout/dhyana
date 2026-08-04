import 'package:dhyana/modules/auth/domain/entity/user_entity.dart';
import 'package:dhyana/modules/auth/domain/enum/signin_method_type.dart';

abstract class AuthRepository {
  Stream<UserEntity?> get authStateChange;
  Stream<UserEntity?> get userChange;
  UserEntity? get user;

  Future<({UserEntity user, bool isFirstSignin})> signIn(
    SigninMethodType signinMethodType, {
    String? email,
    String? password,
  });
  Future<void> signOut();
  Future<void> deleteUser();
}
