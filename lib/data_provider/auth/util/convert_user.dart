import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:dhyana/data_provider/auth/model/user.dart';

// Convert firebase user to an application domain user model.
Future<User?> convertFirebaseUser(firebase_auth.User? firebaseUser) async {

  if (firebaseUser == null) {
    return null;
  }

  return User(
    uid: firebaseUser.uid,
    metadata: firebaseUser.metadata,
    displayName: firebaseUser.displayName,
    email: firebaseUser.email,
    photoUrl: firebaseUser.photoURL,
    roles: const [],
    accessLevel: 0,
  );
}
