import 'package:dhyana/modules/auth/domain/entity/user.dart';
import 'package:dhyana/modules/auth/domain/enum/signin_method_type.dart';

abstract class AuthRepository {

  Stream<User?> get authStateChange;
  Stream<User?> get userChange;
  Future<User?> get user;

  Future<(User, bool)> signIn(SigninMethodType signinMethodType, {
    String? email,
    String? password
  });
  Future<void> signOut();
  Future<void> deleteUser();

}
