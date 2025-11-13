import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:dhyana/data_provider/auth/enum/signin_method_type.dart';
import 'package:dhyana/data_provider/auth/model/all.dart';

import 'apple_auth_template.dart';
import 'google_auth_template.dart';
import 'email_and_password_template.dart';

abstract class AuthTemplate {

  factory AuthTemplate(
    firebase_auth.FirebaseAuth firebaseAuth,
    SigninMethodType authProviderType, {
    String? email, String? password,
  }) {
    switch (authProviderType) {
      case SigninMethodType.google:
        return GoogleAuthTemplate(firebaseAuth);
      case SigninMethodType.apple:
        return AppleAuthTemplate(firebaseAuth);
      case SigninMethodType.emailAndPassword:
        if (email == null) {
          throw Exception('"email" field cannot be null when signing in with SigninMethodType.emailAndPassword!');
        }
        if (password == null) {
          throw Exception('"password" field cannot be null when signing in with SigninMethodType.emailAndPassword!');
        }
        return EmailAndPasswordTemplate(firebaseAuth, email, password);
    }
  }

  Future<SigninResult> signIn();

}
