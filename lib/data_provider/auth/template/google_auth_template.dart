import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:dhyana/data_provider/auth/exception.dart';
import 'package:dhyana/data_provider/auth/model/all.dart';
import 'package:dhyana/data_provider/auth/util/convert_user.dart';

import 'auth_template.dart';

class GoogleAuthTemplate implements AuthTemplate {

  final GoogleSignIn _googleSignIn;
  final firebase_auth.FirebaseAuth _firebaseAuth;

  GoogleAuthTemplate(this._firebaseAuth, this._googleSignIn);

  @override
  Future<SigninResult> signIn() async {

    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) {
      throw const SignInCancelled('Signin with Google was cancelled');
    }

    final googleAuth = await googleUser.authentication;

    firebase_auth.AuthCredential credential = firebase_auth.GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    firebase_auth.UserCredential userCredential =
      await _firebaseAuth.signInWithCredential(credential);
    User? user = await convertFirebaseUser(userCredential.user);

    SigninResult signinResult = SigninResult(
      user: user!,
      additionalUserInfo: userCredential.additionalUserInfo,
    );

    return signinResult;
  }

}
