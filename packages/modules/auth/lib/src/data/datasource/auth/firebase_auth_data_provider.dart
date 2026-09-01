import 'package:firebase_provider/firebase_provider.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform;

import 'package:auth/src/data/datasource/auth/enum/auth_provider_type.dart';
import 'package:auth/src/data/datasource/auth/exception.dart';
import 'package:auth/src/data/datasource/auth/model/auth_user.dart';
import 'package:auth/src/data/datasource/auth/model/signin_result.dart';
import 'package:auth/src/data/datasource/auth/template/auth_template.dart';
import 'package:auth/src/data/datasource/auth/util/convert_user.dart';
import 'package:auth/src/data/datasource/auth/auth_data_provider.dart';


/// Firebase implementation of [AuthDataProvider]
/// Uses `firebase_auth` package to provide authentication features.
class FirebaseAuthDataProvider implements AuthDataProvider {
  /// Firebase Auth instance
  final FirebaseAuth _auth;

  /// Latest auth user emitted from provider streams.
  AuthUser? _user;

  FirebaseAuthDataProvider(this._auth);

  @override
  Stream<AuthUser?> get authStateChange =>
      _auth.authStateChanges().map(_mapUser);

  @override
  Stream<AuthUser?> get userChange => _auth.userChanges().map(_mapUser);

  @override
  AuthUser? get user => _user;

  @override
  Future<SigninResult> signInWithAuthProvider(
    AuthProviderType authProviderType,
  ) async {
    final AuthProviderTemplate authTemplate = AuthProviderTemplate(
      _auth,
      authProviderType,
    );
    final signinResult = await authTemplate.signIn();
    _user = signinResult.user;
    return signinResult;
  }

  @override
  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential credential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);

    final User user = credential.user!;
    return user.toAuthUser();
  }

  @override
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    UserCredential userCredential = await _auth
        .signInWithEmailAndPassword(email: email, password: password);

    if (userCredential.user == null) {
      throw const SignInWithEmailAndPasswordFailure(
        'Sign in with Email and Password failed: No user returned',
      );
    }

    return userCredential.user!.toAuthUser();
  }

  @override
  Future<void> signOut() async {
    // On Android, disconnecting GoogleSignIn forces account picker on next sign-in.
    if (defaultTargetPlatform == TargetPlatform.android) {
      try {
        final googleSignIn = GoogleSignIn.instance;
        final isSignedInWithGoogle =
            await googleSignIn.attemptLightweightAuthentication() != null;
        if (isSignedInWithGoogle) {
          await googleSignIn.disconnect().catchError((e, stack) {
            FirebaseCrashlytics.instance.recordError(
              e,
              stack,
              reason:
                  'Unable to disconnect from Google, account selector wont be displayed?',
            );
            return null;
          });
        }
      } catch (e, stack) {
        FirebaseCrashlytics.instance.recordError(
          e,
          stack,
          reason:
              'Unable to execute disconnect from Google, account selector wont be displayed?',
        );
      }
    }

    await _auth.signOut();
    _user = null;
  }

  @override
  Future<void> deleteUser() {
    if (_auth.currentUser == null) {
      throw Exception(
        'Unable to delete user, because it look like its not signed in...',
      );
    }
    return _auth.currentUser!.delete();
  }

  /// Maps Firebase User to auth data-layer user.
  AuthUser? _mapUser(User? firebaseUser) {
    if (firebaseUser == null) {
      _user = null;
      return null;
    }
    return firebaseUser.toAuthUser();
  }
}
