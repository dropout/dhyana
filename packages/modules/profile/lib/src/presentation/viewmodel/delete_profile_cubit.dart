import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:profile/src/domain/usecase/delete_profile_use_case.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_profile_cubit.freezed.dart';

@freezed
sealed class DeleteProfileState with _$DeleteProfileState {

  const DeleteProfileState._();

  const factory DeleteProfileState.initial() = DeleteProfileInitialState;
  const factory DeleteProfileState.loading() = DeleteProfileLoadingState;
  const factory DeleteProfileState.error() = DeleteProfileErrorState;
  const factory DeleteProfileState.completed() = DeleteProfileCompletedState;
  const factory DeleteProfileState.authRequired() = DeleteProfileAuthRequiredState;

}


class DeleteProfileCubit extends Cubit<DeleteProfileState> with LoggerMixin {

  final DeleteProfileUseCase deleteProfileUseCase;
  final CrashlyticsService crashlyticsService;

  DeleteProfileCubit({
    required this.deleteProfileUseCase,
    required this.crashlyticsService,
  }) : super(const DeleteProfileState.initial());

  Future<void> deleteProfile() async {
    try {
      logger.t('Deleting user profile...');
      emit(const DeleteProfileState.loading());
      final result = await deleteProfileUseCase.execute();

      if (result == DeleteProfileResult.authRequired) {
        emit(const DeleteProfileState.authRequired());
      } else {
        emit(const DeleteProfileState.completed());
      }
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to delete user profile!'
      );
      emit(const DeleteProfileState.error());
    }
  }

}
