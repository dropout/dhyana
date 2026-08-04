typedef AuthPublicSigninResult = ({String userId, bool isFirstSignin});
typedef AuthSession = ({bool isAuthenticated, String? userId});

abstract interface class AuthPublicApi {
  Stream<AuthSession> get authSessionStream;

  Future<AuthPublicSigninResult> signInWithApple();
  Future<AuthPublicSigninResult> signInWithGoogle();
  Future<AuthPublicSigninResult> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<void> signOut();
  Future<void> deleteUser();
}