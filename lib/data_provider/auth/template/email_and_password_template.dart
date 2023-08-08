import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:dhyana/data_provider/auth/model/all.dart';
import 'package:dhyana/data_provider/auth/util/convert_user.dart';

import 'auth_template.dart';

class EmailAndPasswordTemplate implements AuthTemplate {

  final firebase_auth.FirebaseAuth _firebaseAuth;
  final String email;
  final String password;

  EmailAndPasswordTemplate(
    this._firebaseAuth,
    this.email,
    this.password
  );

  @override
  Future<SigninResult> signIn() async {
    firebase_auth.UserCredential userCredential =
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
    User? user = await convertFirebaseUser(userCredential.user);
    SigninResult signinResult = SigninResult(
      user: user!,
      additionalUserInfo: userCredential.additionalUserInfo
    );
    return signinResult;
  }

}
