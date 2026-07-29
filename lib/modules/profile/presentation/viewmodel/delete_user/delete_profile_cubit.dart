import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/modules/profile/domain/usecase/delete_profile_use_case.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_profile_state.dart';
part 'delete_profile_cubit.freezed.dart';

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
