part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {

  const factory ProfileEvent.loadProfile({
    required String profileId,
    void Function(Profile)? onComplete,
    void Function(Object?, StackTrace)? onError,
    @Default(false) bool useStream,
  }) = LoadProfile;

  const factory ProfileEvent.receiveUpdate({
    required Profile profile,
  }) = ReceiveProfileUpdate;

  const factory ProfileEvent.updateProfile({
    required Profile profile,
    required Map<String, dynamic> formData,
    required void Function(Profile profile)? onComplete,
    required void Function(Object? error, StackTrace stack)? onError,
    @Default(false) bool completeProfile,
  }) = UpdateProfile;

  const factory ProfileEvent.error() = ProfileErrorOccured;

  const factory ProfileEvent.calculateConsecutiveDays({
    required Profile profile,
    void Function(Profile profile)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) = CalculateConsecutiveDays;

}
