part of 'delete_profile_cubit.dart';

@freezed
sealed class DeleteProfileState with _$DeleteProfileState {

  const DeleteProfileState._();

  const factory DeleteProfileState.initial() = DeleteProfileInitialState;
  const factory DeleteProfileState.loading() = DeleteProfileLoadingState;
  const factory DeleteProfileState.error() = DeleteProfileErrorState;
  const factory DeleteProfileState.completed() = DeleteProfileCompletedState;
  const factory DeleteProfileState.authRequired() = DeleteProfileAuthRequiredState;

}
