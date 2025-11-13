import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dhyana/data_provider/auth/exception.dart';
import 'package:dhyana/data_provider/auth/model/all.dart';
import 'package:dhyana/data_provider/auth/util/convert_user.dart';

import 'auth_template.dart';

bool _initialized = false;

class GoogleAuthTemplate implements AuthTemplate {

  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  GoogleAuthTemplate(this._firebaseAuth);

  @override
  Future<SigninResult> signIn() async {

    // GoogleSignIn needs to be initialized only once
    if (!_initialized) {
      await _googleSignIn.initialize();
      _initialized = true;
    }

    late GoogleSignInAccount googleUser;
    try {
      googleUser = await _googleSignIn.authenticate(
        scopeHint: [
          'email',
          'https://www.googleapis.com/auth/userinfo.profile'
        ],
      );
    } on GoogleSignInException catch (e) {
      switch (e.code) {
        case GoogleSignInExceptionCode.canceled:
          throw const SignInCancelled('Sign in with Google was cancelled');
        default:
          rethrow;
      }
    }

    final googleAuth = googleUser.authentication;
    firebase_auth.AuthCredential credential = firebase_auth.
      GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    firebase_auth.UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(credential);

    User? user;
    if (userCredential.user == null) {
      throw const SignInWithGoogleFailure(
        'Sign in with Google failed: No user returned',
      );
    } else {
      user = convertFirebaseUser(userCredential.user!);
    }

    SigninResult signinResult = SigninResult(
      user: user,
      additionalUserInfo: userCredential.additionalUserInfo,
    );

    return signinResult;
  }

}
