import 'package:dhyana/modules/auth/data/datasource/auth/model/signin_result.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:dhyana/modules/auth/data/datasource/auth/enum/auth_provider_type.dart';

import 'apple_auth_template.dart';
import 'google_auth_template.dart';

abstract class AuthProviderTemplate {

  factory AuthProviderTemplate(
    firebase_auth.FirebaseAuth firebaseAuth,
    AuthProviderType authProviderType) {
    switch (authProviderType) {
      case .google:
        return GoogleAuthTemplate(firebaseAuth);
      case .apple:
        return AppleAuthTemplate(firebaseAuth);
    }
  }

  Future<SigninResult> signIn();

}
