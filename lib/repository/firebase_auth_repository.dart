import 'package:logger/logger.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/data_provider/auth/all.dart';
import 'package:dhyana/data_provider/profile_data_provider.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/util/logger_factory.dart';

class FirebaseAuthRepository implements AuthRepository {

  Logger logger = getLogger('FirebaseAuthRepository');

  final AuthProvider authDataProvider;
  final ProfileDataProvider profileDataProvider;

  /*
    The profile is created while signing in for the first time.
    If authStateChange or userChange stream data is received before
    finsihing creating a profile, an error is occurred.
    This flag is used to guard the process from the stream events when sign
    in pressed and to rely on the signin method direct result not the change
    might be coming from the streams.
   */
  bool isSigningIn = false;

  FirebaseAuthRepository({
    required this.authDataProvider,
    required this.profileDataProvider,
  });

  @override
  Stream<User?> get authStateChange => authDataProvider.authStateChange
    .takeWhile((_) => (isSigningIn == false));

  @override
  Stream<User?> get userChange => authDataProvider.userChange
    .takeWhile((_) => (isSigningIn == false));

  @override
  Future<User?> get user => authDataProvider.user;

  @override
  Future<User> signIn(SigninMethodType signinMethodType, {
    String? email,
    String? password
  }) async {
    // Guard these operations with a flag
    isSigningIn = true;
    SigninResult signinResult =
      await authDataProvider.signIn(signinMethodType);
    if (isFirstSignin(signinResult)) {
      logger.v('First time signing in, creating profile...');
      await _createProfile(signinResult);
    }
    isSigningIn = false;
    // End of guarding operations
    return signinResult.user;
  }

  @override
  Future<void> signOut() {
    return authDataProvider.signOut();
  }

  @override
  Future<void> deleteUser() async {
    return authDataProvider.deleteUser();
  }

  Future<void> _createProfile(SigninResult signinResult) async {
    Profile profile = Profile(
      id: signinResult.user.uid,
      displayName: signinResult.user.displayName ?? '',
      email: signinResult.user.email ?? '',
      photoURL: signinResult.user.photoUrl ?? '',
      signupDate: DateTime.now(),
    );
    await profileDataProvider.setItem(profile);
  }

}
