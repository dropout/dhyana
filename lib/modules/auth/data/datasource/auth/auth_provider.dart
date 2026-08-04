import 'model/signin_result.dart';
import 'model/auth_user.dart';
import 'enum/auth_signin_method_type.dart';

/// Abstract interface for authentication providers
/// Defines the contract for authentication operations and state management
abstract interface class AuthProvider {

  /// Stream that emits authentication state changes (e.g. sign-in, sign-out)
  Stream<AuthUser?> get authStateChange;

  /// Stream that emits user changes (e.g. profile updates)
  Stream<AuthUser?> get userChange;

  /// Gets the current authenticated user, or null if not signed in
  AuthUser? get user;

  /// Performs sign-in using the specified method and credentials.
  Future<SigninResult> signIn(AuthSigningMethodType authProviderType, {
    String? email,
    String? password
  });

  /// Signs out the current user.
  Future<void> signOut();

  /// Deletes the current user's account and all associated data.
  Future<void> deleteUser();

}
