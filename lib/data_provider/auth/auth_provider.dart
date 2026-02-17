import 'package:dhyana/data_provider/auth/enum/signin_method_type.dart';

import 'model/signin_result.dart';
import 'model/user.dart';

abstract interface class AuthProvider {

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
