import 'dart:convert';
import 'dart:math';
import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:dhyana/data_provider/auth/exception.dart';
import 'package:dhyana/data_provider/auth/model/all.dart';
import 'package:dhyana/data_provider/auth/util/convert_user.dart';

import 'auth_template.dart';

class AppleAuthTemplate implements AuthTemplate {

  final firebase_auth.FirebaseAuth _firebaseAuth;
  // final FacebookAuth _facebookAuth;

  AppleAuthTemplate(this._firebaseAuth);

  /// Generates a cryptographically secure random nonce, to be included in a
  /// credential request.
  String generateNonce([int length = 32]) {
    const String charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    final random = Random.secure();
    return List.generate(length, (_) => charset[random.nextInt(charset.length)])
      .join();
  }

  /// Returns the sha256 hash of [input] in hex notation.
  String sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<SigninResult> signIn() async {

    // To prevent replay attacks with the appleCredential returned from Apple, we
    // include a nonce in the appleCredential request. When signing in with
    // Firebase, the nonce in the id token returned by Apple, is expected to
    // match the sha256 hash of `rawNonce`.
    final rawNonce = generateNonce();
    final nonce = sha256ofString(rawNonce);

    // Request appleCredential for the currently signed in Apple account.
    late AuthorizationCredentialAppleID appleCredential;
    try {
      appleCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: nonce,
      );
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code == AuthorizationErrorCode.canceled) {
        throw const SignInCancelled('Signin with Apple was cancelled');
      } else {
        rethrow;
      }
    }

    // Create an `OAuthCredential` from the appleCredential returned by Apple.
    final credential = firebase_auth.OAuthProvider("apple.com").credential(
      idToken: appleCredential.identityToken,
      rawNonce: rawNonce,
      accessToken: appleCredential.authorizationCode,
    );

    // Sign in the user with Firebase. If the nonce we generated earlier does
    // not match the nonce in `appleCredential.identityToken`, sign in will fail.
    firebase_auth.UserCredential userCredential =
    await _firebaseAuth.signInWithCredential(credential);

    // Apple only provides this data the first time the user signs in.
    // Firebase does not store the users name when signing in with Apple.
    // The user needs to be updated manually with this data.
    // Also no profile image is provided
    firebase_auth.User? fbUser = await updateDisplayName(appleCredential);
    User? user = await convertFirebaseUser(fbUser);

    SigninResult signinResult = SigninResult(
      user: user!,
      additionalUserInfo: userCredential.additionalUserInfo,
    );

    return signinResult;

  }

  Future<firebase_auth.User?> updateDisplayName(AuthorizationCredentialAppleID appleCredential) async {
    String displayName = '';

    if (appleCredential.familyName != null) {
      displayName = '${appleCredential.familyName}';
    }

    if (appleCredential.givenName != null) {
      displayName = '$displayName ${appleCredential.givenName}';
    }

    if (displayName.isNotEmpty) {
      final firebase_auth.User? oldUser = _firebaseAuth.currentUser;
      await oldUser?.updateDisplayName(displayName);
    }

    final firebase_auth.User? newUser = _firebaseAuth.currentUser;

    return newUser!;
  }

}
