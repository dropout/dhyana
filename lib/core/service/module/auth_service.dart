abstract interface class AuthService {

  Stream<String?> get userIdStream;
  Future<({String userId, bool isFirstSignin})> signInWithApple();
  Future<({String userId, bool isFirstSignin})> signInWithGoogle();
  Future<({String userId, bool isFirstSignin})> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<void> deleteUser();

}