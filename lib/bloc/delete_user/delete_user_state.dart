part of 'delete_user_bloc.dart';

@freezed
sealed class DeleteUserState with _$DeleteUserState {

  const DeleteUserState._();

  const factory DeleteUserState.initial() = DeleteUserInitialState;
  const factory DeleteUserState.loading() = DeleteUserLoadingState;
  const factory DeleteUserState.error() = DeleteUserErrorState;
  const factory DeleteUserState.completed() = DeleteUserCompletedState;
  const factory DeleteUserState.authRequired() = DeleteUserAuthRequiredState;

}
