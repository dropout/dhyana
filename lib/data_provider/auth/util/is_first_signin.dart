import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/data_provider/auth/model/signin_result.dart';

bool isFirstSignin(SigninResult signinResult) {
  firebase_auth.AdditionalUserInfo? additionalUserInfo =
    signinResult.additionalUserInfo;
  User user = signinResult.user;
  if (additionalUserInfo != null) {
    return additionalUserInfo.isNewUser;
  } else {
    return (user.metaData.lastSignInTime == user.metaData.creationTime);
  }
}
