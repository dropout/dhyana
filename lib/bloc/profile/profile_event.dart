part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {

  const factory ProfileEvent.loadProfile({
    required String profileId,
    void Function(Profile)? onComplete,
    void Function(Object?, StackTrace)? onError,
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
  const factory ProfileEvent.reset() = ResetProfileContent;

  const factory ProfileEvent.validateConsecutiveDays({
    required Profile profile,
    @Default(false) bool forceValidation,
    void Function(Profile profile)? onComplete,
    void Function(Object? error, StackTrace stackTrace)? onError,
  }) = ValidateConsecutiveDays;

  const factory ProfileEvent.logSession({
    required String profileId,
    required DateTime startTime,
    required DateTime endTime,
    required Duration duration,
    required TimerSettings timerSettings,
  }) = LogSession;

}
