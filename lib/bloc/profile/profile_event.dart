part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {

  const factory ProfileEvent.initial() = ProfileInitial;

  const factory ProfileEvent.loadProfile({
    @Default(false) bool useStream,
    required String profileId,
  }) = LoadProfile;

  const factory ProfileEvent.receiveUpdate({
    required Profile profile,
  }) = ReceiveProfileUpdate;

  const factory ProfileEvent.updateProfile({
    required Profile profile,
    required Map<String, dynamic> formData,
    @Default(false) bool completeProfile,
    required void Function(Profile profile)? onComplete,
    required void Function(Object? error, StackTrace stack)? onError,
  }) = UpdateProfile;

  const factory ProfileEvent.error() = ProfileLoadingErrorOccured;

}
