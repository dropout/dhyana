part of 'profile_cubit.dart';

@freezed
sealed class ProfileState with _$ProfileState {

  const ProfileState._();

  const factory ProfileState.initial() = ProfileStateInitial;
  const factory ProfileState.loading() = ProfileLoadingState;
  const factory ProfileState.loaded({
    required Profile profile,
    required ProfileSettings settings,
  }) = ProfileLoadedState;
  const factory ProfileState.error() = ProfileErrorState;

}
