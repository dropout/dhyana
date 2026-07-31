part of 'profile_edit_cubit.dart';

@freezed
sealed class ProfileEditState with _$ProfileEditState {

  const ProfileEditState._();

  const factory ProfileEditState.initial() = ProfileEditStateInitial;
  const factory ProfileEditState.loading() = ProfileEditLoadingState;
  const factory ProfileEditState.loaded({
    required Profile profile,
  }) = ProfileEditLoadedState;
  const factory ProfileEditState.error() = ProfileEditErrorState;

}
