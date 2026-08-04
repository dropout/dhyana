import 'package:dhyana/modules/auth/data/datasource/auth/enum/auth_signin_method_type.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/model/auth_user.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/model/signin_result.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/template/auth_template.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/util/convert_user.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/auth_provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart'
    show TargetPlatform, defaultTargetPlatform;
import 'package:google_sign_in/google_sign_in.dart';

/// Firebase implementation of [AuthProvider]
/// Uses `firebase_auth` package to provide authentication features.
class FirebaseAuthProvider implements AuthProvider {
  /// Firebase Auth instance
  final firebase_auth.FirebaseAuth _auth;

  /// Latest auth user emitted from provider streams.
  AuthUser? _user;

  FirebaseAuthProvider(this._auth);

  @override
  Stream<AuthUser?> get authStateChange =>
      _auth.authStateChanges().map(_mapUser);

  @override
  Stream<AuthUser?> get userChange => _auth.userChanges().map(_mapUser);

  @override
  AuthUser? get user => _user;

  @override
  Future<SigninResult> signIn(
    AuthSigningMethodType authProviderType, {
    String? email,
    String? password,
  }) async {
    AuthTemplate authTemplate;
    if (authProviderType == AuthSigningMethodType.emailAndPassword) {
      authTemplate = AuthTemplate(
        _auth,
        authProviderType,
        email: email,
        password: password,
      );
    } else {
      authTemplate = AuthTemplate(_auth, authProviderType);
    }

    final signinResult = await authTemplate.signIn();
    _user = signinResult.user;
    return signinResult;
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
  AuthUser? _mapUser(firebase_auth.User? firebaseUser) {
    if (firebaseUser == null) {
      _user = null;
      return null;
    }
    _user = convertFirebaseUser(firebaseUser);
    return _user;
  }
}
