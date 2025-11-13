import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart' show
TargetPlatform, defaultTargetPlatform;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dhyana/data_provider/auth/auth_provider.dart';
import 'package:dhyana/data_provider/auth/enum/all.dart';
import 'package:dhyana/data_provider/auth/template/all.dart';
import 'package:dhyana/data_provider/auth/util/convert_user.dart';

import 'model/all.dart';

/// Firebase implementation of [AuthProvider]
/// Uses `firebase_auth` package to provide authentication features.
class FirebaseAuthProvider implements AuthProvider {

  /// Firebase Auth instance
  final firebase_auth.FirebaseAuth _auth;

  /// Our domain user object
  /// Will be updated on auth state changes
  /// If user is not signed in, this will be null
  User? _user;

  FirebaseAuthProvider(this._auth);

  @override
  Stream<User?> get authStateChange =>
    _auth.authStateChanges().map(_mapUser);

  @override
  Stream<User?> get userChange =>
    _auth.userChanges().map(_mapUser);

  @override
  Future<User?> get user => Future.value(_user);

  @override
  Future<SigninResult> signIn(SigninMethodType authProviderType, {
    String? email,
    String? password
  }) async {
    AuthTemplate authTemplate;
    if (authProviderType == SigninMethodType.emailAndPassword) {
      authTemplate = AuthTemplate(
        _auth,
        authProviderType,
        email: email,
        password: password,
      );
    } else {
      authTemplate = AuthTemplate(_auth, authProviderType);
    }
    SigninResult signinResult = await authTemplate.signIn();
    _user = signinResult.user;
    return signinResult;
  }

  @override
  Future<void> signOut() async {

    /*
      On Android after logging out this code will trigger an account selector
      once the user tries to log back in.
      This is needed in a case when the user is using the app with multiple accounts.
      On iOS the account selector is displayed automatically.
     */
    if (defaultTargetPlatform == TargetPlatform.android) {
      try {
        GoogleSignIn googleSignIn = GoogleSignIn.instance;
        bool isSignedInWithGoogle = await googleSignIn.attemptLightweightAuthentication() != null;
        if (isSignedInWithGoogle) {
          await googleSignIn.disconnect().catchError((e, stack) {
            FirebaseCrashlytics.instance.recordError(e, stack,
              reason: 'Unable to disconnect from Google, account selector wont be displayed?'
            );
            return null;
          });
        }
      } catch (e, stack) {
        FirebaseCrashlytics.instance.recordError(e, stack,
          reason: 'Unable to execute disconnect from Google, account selector wont be displayed?'
        );
      }
    }
    await _auth.signOut();
    _user = null;
  }

  @override
  Future<void> deleteUser() {
    if (_auth.currentUser == null) {
      throw Exception('Unable to delete user, because it look like its not signed in...');
    } else {
      return _auth.currentUser!.delete();
    }
  }

  /// Maps Firebase User to our domain User
  User? _mapUser(firebase_auth.User? firebaseUser) {
    if (firebaseUser == null) {
      _user = null;
      return null;
    } else {
      _user = convertFirebaseUser(firebaseUser);
      return _user;
    }
  }

}
