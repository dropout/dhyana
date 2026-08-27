import 'package:dhyana/modules/auth/data/datasource/auth/model/auth_user.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/model/auth_user_meta_data.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Convert firebase user to a library domain user model.
// This could be useful with multiple auth providers implemented.
extension FirebaseUserX on User {
  AuthUser toAuthUser() {
    return AuthUser(
      uid: uid,
      metaData: AuthUserMetaData(
        creationTime: metadata.creationTime,
        lastSignInTime: metadata.lastSignInTime,
      ),
      displayName: displayName,
      email: email,
      photoUrl: photoURL,
      roles: const [],
      accessLevel: 0,
    );
  }
}
