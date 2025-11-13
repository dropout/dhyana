import 'package:dhyana/data_provider/auth/model/user_meta_data.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:dhyana/data_provider/auth/model/user.dart';

// Convert firebase user to a library domain user model.
// This could be useful with multiple auth providers implemented.
User convertFirebaseUser(firebase_auth.User firebaseUser) => User(
  uid: firebaseUser.uid,
  metaData: UserMetaData(
    creationTime: firebaseUser.metadata.creationTime,
    lastSignInTime: firebaseUser.metadata.lastSignInTime,
  ),
  displayName: firebaseUser.displayName,
  email: firebaseUser.email,
  photoUrl: firebaseUser.photoURL,
  roles: const [],
  accessLevel: 0,
);
