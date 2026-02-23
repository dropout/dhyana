import 'package:dhyana/data_provider/auth/enum/signin_method_type.dart';
import 'package:dhyana/data_provider/auth/firebase_auth_provider.dart';
import 'package:dhyana/data_provider/auth/model/signin_result.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/data_provider/auth/util/is_first_signin.dart';
import 'package:dhyana/data_provider/profile_data_provider.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/util/logger_mixin.dart';

/// Firebase implementation of [AuthRepository]
/// Uses [FirebaseAuthProvider] to perform authentication operations
class FirebaseAuthRepository with LoggerMixin implements AuthRepository {

  /// Data provider for authentication operations
  final FirebaseAuthProvider authDataProvider;

  /// Data provider for profile operations, used to check if it's the user's first sign-in
  final ProfileDataProvider profileDataProvider;

  /// Flag to indicate if a sign-in operation is in progress
  bool _isSigningIn = false;

  /// Constructs a [FirebaseAuthRepository] with the given data providers.
  FirebaseAuthRepository({
    required this.authDataProvider,
    required this.profileDataProvider,
  });

  /// Guards auth state change streams to prevent emitting values during sign-in process
  @override
  Stream<User?> get authStateChange => authDataProvider.authStateChange
    .takeWhile((_) => (_isSigningIn == false));

  /// Guards user change stream to prevent emitting values during sign-in process
  @override
  Stream<User?> get userChange => authDataProvider.userChange
    .takeWhile((_) => (_isSigningIn == false));

  /// Gets the current user from the data provider
  @override
  Future<User?> get user => authDataProvider.user;

  /// Performs sign-in using the specified method and credentials.
  @override
  Future<(User, bool)> signIn(SigninMethodType signinMethodType, {
    String? email,
    String? password
  }) async {
    // Guard these operations with a flag
    _isSigningIn = true;
    SigninResult signinResult =
      await authDataProvider.signIn(signinMethodType);
    // Insert profile creation here if cannot use Google Cloud Identity Provider
    // blocking function
    _isSigningIn = false;
    // End of guarding operations
    return (signinResult.user, isFirstSignin(signinResult));
  }

  /// Signs out the current user
  @override
  Future<void> signOut() {
    return authDataProvider.signOut();
  }

  /// Deletes the current user
  @override
  Future<void> deleteUser() async {
    return authDataProvider.deleteUser();
  }

}
