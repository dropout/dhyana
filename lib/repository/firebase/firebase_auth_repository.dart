import 'package:dhyana/data_provider/auth/auth_provider.dart';
import 'package:dhyana/data_provider/auth/enum/signin_method_type.dart';
import 'package:dhyana/data_provider/auth/model/signin_result.dart';
import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/data_provider/auth/util/is_first_signin.dart';
import 'package:dhyana/data_provider/profile_data_provider.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/util/logger_mixin.dart';

class FirebaseAuthRepository with LoggerMixin implements AuthRepository {

  final AuthProvider authDataProvider;
  final ProfileDataProvider profileDataProvider;

  bool _isSigningIn = false;

  FirebaseAuthRepository({
    required this.authDataProvider,
    required this.profileDataProvider,
  });

  @override
  Stream<User?> get authStateChange => authDataProvider.authStateChange
    .takeWhile((_) => (_isSigningIn == false));

  @override
  Stream<User?> get userChange => authDataProvider.userChange
    .takeWhile((_) => (_isSigningIn == false));

  @override
  Future<User?> get user => authDataProvider.user;

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

  @override
  Future<void> signOut() {
    return authDataProvider.signOut();
  }

  @override
  Future<void> deleteUser() async {
    return authDataProvider.deleteUser();
  }

}
