import 'dart:async';

import 'package:dhyana/core/service/module/profile_service.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_cubit.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {

  const ProfileState._();

  const factory ProfileState.initial() = ProfileStateInitial;
  const factory ProfileState.loading() = ProfileLoadingState;
  const factory ProfileState.loaded({
    required Profile profile,
  }) = ProfileLoadedState;
  const factory ProfileState.error() = ProfileErrorState;

}


class ProfileCubit extends Cubit<ProfileState> with LoggerMixin {
  final ProfileService profileService;
  final CrashlyticsService crashlyticsService;

  StreamSubscription<Profile>? _profileSubscription;

  ProfileCubit({required this.profileService, required this.crashlyticsService})
    : super(const ProfileState.initial());

  void loadProfile(
    String profileId, {
    Profile? profile,
    void Function(Profile)? onComplete,
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
        result = await profileService.loadProfile(profileId);
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

  void clearData() {
    emit(const ProfileState.initial());
    logger.t('Profile data cleared!');
  }

  void _createSubscription(String profileId) {
    _profileSubscription?.cancel();
    _profileSubscription = profileService
        .readStream(profileId)
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
}
