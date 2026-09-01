import 'package:auth/src/data/datasource/auth/auth_data_provider.dart';
import 'package:auth/src/data/mappers.dart';
import 'package:auth/src/domain/entity/user_entity.dart';
import 'package:auth/src/domain/enum/signin_auth_provider_type.dart';
import 'package:auth/src/data/datasource/auth/model/signin_result.dart';
import 'package:auth/src/domain/repository/auth_repository.dart';
import 'package:core/core.dart';

/// Default implementation of [AuthRepository]
/// Uses [AuthDataProvider] to perform authentication operations
class DefaultAuthRepository with LoggerMixin implements AuthRepository {
  /// Data provider for authentication operations
  final AuthDataProvider authDataProvider;

  /// Flag to indicate if a sign-in operation is in progress
  bool _isSigningIn = false;

  /// Constructs a [DefaultAuthRepository] with the given data providers.
  DefaultAuthRepository({required this.authDataProvider});

  /// Guards auth state change streams to prevent emitting values during sign-in process
  @override
  Stream<UserEntity?> get authStateChange => authDataProvider.authStateChange
      .takeWhile((_) => (_isSigningIn == false))
      .map((authUser) => authUser?.toDomain());

  /// Guards user change stream to prevent emitting values during sign-in process
  @override
  Stream<UserEntity?> get userChange => authDataProvider.userChange
      .takeWhile((_) => (_isSigningIn == false))
      .map((authUser) => authUser?.toDomain());

  /// Gets the current user from the data provider
  @override
  UserEntity? get user =>
      authDataProvider.user?.toDomain();

  /// Performs sign-in using the specified method and credentials.
  @override
  Future<({UserEntity user, bool isFirstSignin})> signInWithAuthProvider(
    SigninAuthProviderType signinMethodType) async {
    // Guard these operations with a flag
    _isSigningIn = true;
    SigninResult signinResult = await authDataProvider.signInWithAuthProvider(
      signinMethodType.toData(),
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

  @override
  Future<UserEntity> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _isSigningIn = true;
    final user = await authDataProvider.signUpWithEmailAndPassword(
      email: email,
      password: password,
    );
    _isSigningIn = false;
    return user.toDomain();
  }


  @override
  Future<UserEntity> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    _isSigningIn = true;
    final user = await authDataProvider.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    _isSigningIn = false;
    return user.toDomain();
  }

  /// Signs out the current user
  @override
  Future<void> signOut() =>
    authDataProvider.signOut();

  /// Deletes the current user
  @override
  Future<void> deleteUser() =>
    authDataProvider.deleteUser();
  
}
