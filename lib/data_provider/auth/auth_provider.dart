import 'package:dhyana/data_provider/auth/enum/signin_method_type.dart';
import 'package:dhyana/data_provider/auth/model/all.dart';

abstract class AuthProvider {

  Stream<User?> get authStateChange;
  Stream<User?> get userChange;
  Future<User?> get user;

  Future<SigninResult> signIn(SigninMethodType authProviderType, {
    String? email,
    String? password
  });

  Future<void> signOut();
  Future<void> deleteUser();

}
