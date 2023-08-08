import 'package:dhyana/data_provider/auth/all.dart';

abstract class AuthRepository {

  Stream<User?> get authStateChange;
  Stream<User?> get userChange;
  Future<User?> get user;

  Future<User> signIn(SigninMethodType signinMethodType, {
    String? email,
    String? password
  });
  Future<void> signOut();
  Future<void> deleteUser();

}
