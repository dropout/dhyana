import 'package:dhyana/core/domain/entity/profile/profile_settings.dart';
import 'package:dhyana/modules/profile/domain/usecase/load_profile_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_settings_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_use_case.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> with LoggerMixin {

  final LoadProfileUseCase loadProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final UpdateProfileSettingsUseCase updateProfileSettingsUseCase;
  final CrashlyticsService crashlyticsService;

  ProfileCubit({
    required this.loadProfileUseCase,
    required this.updateProfileUseCase,
    required this.updateProfileSettingsUseCase,
    required this.crashlyticsService,
  }) : super(const ProfileState.initial());

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
        result = await loadProfileUseCase.execute(profileId);    
      }
      emit(ProfileState.loaded(profile: result));
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

  void updateProfile({
    required Profile profile,
    required Map<String, dynamic> formData,
    void Function(Profile profile)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
    bool completeProfile = false,
  }) async {
    try {
      logger.t('Updating profile');
      final updateProfile = await updateProfileUseCase.execute(
        profile: profile,
        updatedFields: formData,
        completeProfile: completeProfile,
      );
      emit(ProfileState.loaded(profile: updateProfile));
      onComplete?.call(updateProfile);
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to update profile: ${profile.id}',
      );
      onError?.call(e, stack);
    }
  }

  void updateProfileSettings({
    required Profile profile,
    required Map<String, dynamic> settingsFormData,
    void Function(ProfileSettings settings)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
  }) async {
    try {
      logger.t('Updating profile settings');

      final updatedProfile = await updateProfileSettingsUseCase.execute(
        profile: profile,
        updatedFields: settingsFormData,
      );

      emit(ProfileState.loaded(profile: updatedProfile));
      onComplete?.call(updatedProfile.settings);
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to update profile settings for profile: ${profile.id}',
      );
      onError?.call(e, stack);
    }
  }

  void clearData() {
    emit(const ProfileState.initial());
    logger.t('Profile data cleared!');
  }
}
