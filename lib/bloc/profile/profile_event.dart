part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {

  const factory ProfileEvent.loadProfile({
    required String profileId,
    void Function(Profile)? onComplete,
    void Function(Object?, StackTrace)? onError,
  }) = LoadProfile;

  const factory ProfileEvent.updateProfile({
    required Profile profile,
    required Map<String, dynamic> formData,
    void Function(Profile profile)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
    @Default(false) bool completeProfile,
  }) = UpdateProfile;

  const factory ProfileEvent.error() = ProfileErrorOccured;
  const factory ProfileEvent.clearData() = ClearProfileData;
  const factory ProfileEvent.validateProfileStats() = ValidateProfileStats;

}
