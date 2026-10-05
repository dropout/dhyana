import 'model/signin_result.dart';
import 'model/auth_user.dart';
import 'enum/auth_provider_type.dart';

/// Abstract interface for authentication providers
/// Defines the contract for authentication operations and state management
abstract interface class AuthDataProvider {

  /// Stream that emits authentication state changes (e.g. sign-in, sign-out)
  Stream<AuthUser?> get authStateChange;

  /// Stream that emits user changes (e.g. profile updates)
  Stream<AuthUser?> get userChange;

  /// Gets the current authenticated user, or null if not signed in
  AuthUser? get user;

  /// Performs sign-in using the specified 
  /// authentication provider type (e.g. Google, Apple)
  Future<SigninResult> signInWithAuthProvider(AuthProviderType authProviderType);

  /// Performs sign-up with email and password
  Future<AuthUser> signUpWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Performs sign-in with email and password.
  Future<AuthUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Signs out the current user.
  Future<void> signOut();

  /// Deletes the current user's account and all associated data.
  Future<void> deleteUser();

}
