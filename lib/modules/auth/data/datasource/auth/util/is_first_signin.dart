import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:dhyana/modules/auth/data/datasource/auth/model/auth_user.dart';

bool isFirstSignin(
  AuthUser user, 
  firebase_auth.AdditionalUserInfo? additionalUserInfo
) {
  if (additionalUserInfo != null) {
    return additionalUserInfo.isNewUser;
  } else {
    return (user.metaData.lastSignInTime == user.metaData.creationTime);
  }
}
