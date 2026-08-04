import 'package:dhyana/modules/auth/data/datasource/auth/model/signin_result.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:dhyana/modules/auth/data/datasource/auth/enum/auth_signin_method_type.dart';

import 'apple_auth_template.dart';
import 'google_auth_template.dart';
import 'email_and_password_template.dart';

abstract class AuthTemplate {

  factory AuthTemplate(
    firebase_auth.FirebaseAuth firebaseAuth,
    AuthSigningMethodType authProviderType, {
    String? email, String? password,
  }) {
    switch (authProviderType) {
      case AuthSigningMethodType.google:
        return GoogleAuthTemplate(firebaseAuth);
      case AuthSigningMethodType.apple:
        return AppleAuthTemplate(firebaseAuth);
      case AuthSigningMethodType.emailAndPassword:
        if (email == null) {
          throw Exception('"email" field cannot be null when signing in with AuthSigningMethodType.emailAndPassword!');
        }
        if (password == null) {
          throw Exception('"password" field cannot be null when signing in with AuthSigningMethodType.emailAndPassword!');
        }
        return EmailAndPasswordTemplate(firebaseAuth, email, password);
    }
  }

  Future<SigninResult> signIn();

}
