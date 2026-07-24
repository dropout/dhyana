import 'package:dhyana/core/data/datasource/auth/enum/signin_method_type.dart';
import 'package:dhyana/core/data/datasource/auth/model/user.dart';

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
