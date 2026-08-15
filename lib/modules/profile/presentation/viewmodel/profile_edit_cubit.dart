import 'package:dhyana/modules/profile/data/mapper/profile_mapper.dart';
import 'package:dhyana/modules/profile/domain/entity/profile_entity.dart';
import 'package:dhyana/modules/profile/domain/usecase/load_profile_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_settings_use_case.dart';
import 'package:dhyana/modules/profile/domain/usecase/update_profile_use_case.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:dhyana/modules/profile/public/model/profile.dart';
import 'package:dhyana/modules/profile/public/model/profile_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_edit_cubit.freezed.dart';

@freezed
sealed class ProfileEditState with _$ProfileEditState {
  const ProfileEditState._();

  const factory ProfileEditState.initial() = ProfileEditStateInitial;
  const factory ProfileEditState.loading() = ProfileEditLoadingState;
  const factory ProfileEditState.loaded({required Profile profile}) =
      ProfileEditLoadedState;
  const factory ProfileEditState.error() = ProfileEditErrorState;
}

class ProfileEditCubit extends Cubit<ProfileEditState> with LoggerMixin {
  final LoadProfileUseCase loadProfileUseCase;
  final UpdateProfileUseCase updateProfileUseCase;
  final UpdateProfileSettingsUseCase updateProfileSettingsUseCase;
  final CrashlyticsService crashlyticsService;

  ProfileEditCubit({
    required this.loadProfileUseCase,
    required this.updateProfileUseCase,
    required this.updateProfileSettingsUseCase,
    required this.crashlyticsService,
  }) : super(const ProfileEditState.initial());

  void loadProfile(
    String profileId, {
    Profile? profile,
    void Function(Profile)? onComplete,
    void Function(Object?, StackTrace)? onError,
  }) async {
    try {
      late ProfileEntity result;
      if (profile != null) {
        logger.t('Using profile: $profileId');
        result = profile.toDomain();
      } else {
        logger.t('Loading profile: $profileId');
        emit(const ProfileEditState.loading());
        result = await loadProfileUseCase.execute(profileId);
      }
      emit(ProfileEditState.loaded(profile: result.toApi()));
      onComplete?.call(result.toApi());
      logger.t('Loaded profile: ${result.displayName}');
    } catch (exception, stackTrace) {
      emit(const ProfileEditState.error());
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
      final updatedProfile = await updateProfileUseCase.execute(
        profile: profile.toDomain(),
        updatedFields: formData,
        completeProfile: completeProfile,
      );
      emit(ProfileEditState.loaded(profile: updatedProfile.toApi()));
      onComplete?.call(updatedProfile.toApi());
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
        profileEntity: profile.toDomain(),
        updatedFields: settingsFormData,
      );

      emit(ProfileEditState.loaded(profile: updatedProfile.toApi()));
      onComplete?.call(updatedProfile.toApi().settings);
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
    emit(const ProfileEditState.initial());
    logger.t('Profile data cleared!');
  }
}
