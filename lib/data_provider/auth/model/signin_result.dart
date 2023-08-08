import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:dhyana/data_provider/auth/model/user.dart';

class SigninResult {

  final User user;
  final firebase_auth.AdditionalUserInfo? additionalUserInfo;

  SigninResult({
    required this.user,
    required this.additionalUserInfo,
  });

}
