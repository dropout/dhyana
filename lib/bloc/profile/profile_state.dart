part of 'profile_bloc.dart';

@freezed
sealed class ProfileState with _$ProfileState {

  const ProfileState._();

  const factory ProfileState.loading() = ProfileLoadingState;
  const factory ProfileState.loaded({
    required Profile profile
  }) = ProfileLoadedState;
  const factory ProfileState.error() = ProfileErrorState;
}
