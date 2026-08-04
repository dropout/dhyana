import 'package:dhyana/modules/auth/data/datasource/auth/auth_provider.dart';
import 'package:dhyana/modules/auth/domain/entity/user.dart';
import 'package:dhyana/modules/auth/data/mappers.dart';
import 'package:dhyana/modules/auth/domain/enum/signin_method_type.dart';
import 'package:dhyana/modules/auth/data/datasource/auth/model/signin_result.dart';
import 'package:dhyana/modules/auth/domain/repository/auth_repository.dart';
import 'package:dhyana/core/util/logger_mixin.dart';

/// Default implementation of [AuthRepository]
/// Uses [AuthProvider] to perform authentication operations
class DefaultAuthRepository with LoggerMixin implements AuthRepository {
  /// Data provider for authentication operations
  final AuthProvider authDataProvider;

  /// Flag to indicate if a sign-in operation is in progress
  bool _isSigningIn = false;

  /// Constructs a [DefaultAuthRepository] with the given data providers.
  DefaultAuthRepository({required this.authDataProvider});

  /// Guards auth state change streams to prevent emitting values during sign-in process
  @override
  Stream<User?> get authStateChange => authDataProvider.authStateChange
      .takeWhile((_) => (_isSigningIn == false))
      .map((authUser) => authUser?.toDomain());

  /// Guards user change stream to prevent emitting values during sign-in process
  @override
  Stream<User?> get userChange => authDataProvider.userChange
      .takeWhile((_) => (_isSigningIn == false))
      .map((authUser) => authUser?.toDomain());

  /// Gets the current user from the data provider
  @override
  User? get user =>
      authDataProvider.user?.toDomain();

  /// Performs sign-in using the specified method and credentials.
  @override
  Future<({User user, bool isFirstSignin})> signIn(
    SigninMethodType signinMethodType, {
    String? email,
    String? password,
  }) async {
    // Guard these operations with a flag
    _isSigningIn = true;
    SigninResult signinResult = await authDataProvider.signIn(
      signinMethodType.toData(),
      email: email,
      password: password,
    );
    // Insert profile creation here if cannot use Google Cloud Identity Provider
    // blocking function
    _isSigningIn = false;
    // End of guarding operations
    return (
      user: signinResult.user.toDomain(),
      isFirstSignin: signinResult.isFirstSignIn,
    );
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
