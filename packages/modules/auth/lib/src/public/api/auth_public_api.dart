typedef AuthSigninResult = ({String userId, bool isFirstSignin});
typedef AuthSession = ({bool isAuthenticated, String? userId});

abstract interface class AuthPublicApi {

  Stream<AuthSession> get authSessionStream;

  Future<AuthSigninResult> signInWithApple();
  Future<AuthSigninResult> signInWithGoogle();
  Future<String> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<String> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
  Future<void> deleteUser();

}
