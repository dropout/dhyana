import 'package:dhyana/modules/auth/data/datasource/auth/model/auth_user.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/model/auth_user_meta_data.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

// Convert firebase user to a library domain user model.
// This could be useful with multiple auth providers implemented.
AuthUser convertFirebaseUser(firebase_auth.User firebaseUser) => AuthUser(
  uid: firebaseUser.uid,
  metaData: AuthUserMetaData(
    creationTime: firebaseUser.metadata.creationTime,
    lastSignInTime: firebaseUser.metadata.lastSignInTime,
  ),
  displayName: firebaseUser.displayName,
  email: firebaseUser.email,
  photoUrl: firebaseUser.photoURL,
  roles: const [],
  accessLevel: 0,
);
