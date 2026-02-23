import 'package:dhyana/data_provider/auth/enum/signin_method_type.dart';

import 'model/signin_result.dart';
import 'model/user.dart';

/// Abstract interface for authentication providers
/// Defines the contract for authentication operations and state management
abstract interface class AuthProvider {

  /// Stream that emits authentication state changes (e.g. sign-in, sign-out)
  Stream<User?> get authStateChange;

  /// Stream that emits user changes (e.g. profile updates)
  Stream<User?> get userChange;

  /// Gets the current authenticated user, or null if not signed in
  Future<User?> get user;

  /// Performs sign-in using the specified method and credentials.
  Future<SigninResult> signIn(SigninMethodType authProviderType, {
    String? email,
    String? password
  });

  /// Signs out the current user.
  Future<void> signOut();

  /// Deletes the current user's account and all associated data.
  Future<void> deleteUser();

}
