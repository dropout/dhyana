import 'package:dhyana/model/profile_stats.dart';
import 'package:dhyana/util/default_profile_data.dart';
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
    bool isFirst = isFirstSignin(signinResult);
    if (isFirst) {
      logger.t('First time signing in, creating profile...');
      await _createProfile(signinResult);
    }
    _isSigningIn = false;
    // End of guarding operations
    return (signinResult.user, isFirst);
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
      firstName: '',
      lastName: signinResult.user.displayName ?? '',
      email: signinResult.user.email ?? '',
      photoUrl: DefaultProfileData.photoUrl,
      photoBlurhash: DefaultProfileData.photoBlurhash,
      signupDate: DateTime.now(),
      stats: ProfileStats.empty(),
      completed: false,
    );
    await profileDataProvider.create(profile);
  }

}
