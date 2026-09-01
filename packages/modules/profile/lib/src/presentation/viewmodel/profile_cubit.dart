import 'dart:async';

import 'package:auth/auth.dart';
import 'package:core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:profile/src/public/api/profile_public_api.dart';
import 'package:profile/src/public/model/profile.dart';

class ProfileCubit extends Cubit<ProfileState> 
  with LoggerMixin 
  implements ProfileStateCubit {
  
  final AuthPublicApi authPublicApi;
  final ProfilePublicApi profilePublicApi;
  final CrashlyticsService crashlyticsService;

  StreamSubscription<Profile>? _profileSubscription;
  StreamSubscription<AuthSession>? _userIdStreamSub;

  ProfileCubit({
    required this.authPublicApi,
    required this.profilePublicApi,
    required this.crashlyticsService,
  }) : super(const ProfileState.initial()) {

    // When user signs out we need to cancel the profile subscription:
    _userIdStreamSub = authPublicApi.authSessionStream.listen((authSession) {

      // Cancel either way the user is authenticated or not
      _profileSubscription?.cancel();

      // Only resubscribe if the user is authenticated
      if (authSession.isAuthenticated) {
        _createSubscription(authSession.userId!);
      }
    });
  }

  @override
  Future<void> loadProfile(
    String profileId, {
    ProfileModel? profile,
    void Function(ProfileModel)? onComplete,
    void Function(Object?, StackTrace)? onError,
  }) async {
    try {
      late Profile result;
      if (profile != null) {
        logger.t('Using profile: $profileId');
        result = profile;
      } else {
        logger.t('Loading profile: $profileId');
        emit(const ProfileState.loading());
        result = await profilePublicApi.getProfile(profileId);
      }
      emit(ProfileState.loaded(profile: result));
      _createSubscription(profileId);
      onComplete?.call(result);
      logger.t('Loaded profile: ${result.displayName}');
    } catch (exception, stackTrace) {
      emit(const ProfileErrorState());
      crashlyticsService.recordError(
        exception: exception,
        stackTrace: stackTrace,
        reason: 'Unable to load profile: $profileId',
      );
      onError?.call(exception, stackTrace);
    }
  }

  @override
  void clearData() {
    emit(const ProfileState.initial());
    logger.t('Profile data cleared!');
  }

  void _createSubscription(String profileId) {
    _profileSubscription?.cancel();
    _profileSubscription = profilePublicApi
        .getProfileStream(profileId)
        .listen(
          _onProfileChanged,
          onError: (error, stackTrace) {
            emit(const ProfileErrorState());
            crashlyticsService.recordError(
              exception: error,
              stackTrace: stackTrace,
              reason: 'Error in profile stream for profile: $profileId',
            );
          },
        );
  }

  void _onProfileChanged(Profile profile) {
    emit(ProfileState.loaded(profile: profile));
  }

  @override
  Future<void> close() {
    _profileSubscription?.cancel();
    _userIdStreamSub?.cancel();
    return super.close();
  }
}
