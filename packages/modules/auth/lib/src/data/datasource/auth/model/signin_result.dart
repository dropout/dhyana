import 'auth_user.dart';

class SigninResult {

  final AuthUser user;
  final bool isFirstSignIn;

  SigninResult({
    required this.user,
    required this.isFirstSignIn,
  });

}
