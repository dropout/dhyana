abstract interface class AuthService {

  Future<void> signInWithApple();
  Future<void> signInWithGoogle();
  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
  Future<void> signOut();
  Future<void> deleteUser();

}