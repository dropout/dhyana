import 'package:dhyana/core/domain/entity/auth/user.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class SigninResult {

  final User user;
  final firebase_auth.AdditionalUserInfo? additionalUserInfo;

  SigninResult({
    required this.user,
    required this.additionalUserInfo,
  });

}
