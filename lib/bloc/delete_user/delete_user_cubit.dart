import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_state.dart';
part 'delete_user_cubit.freezed.dart';

class DeleteUserCubit extends Cubit<DeleteUserState> with LoggerMixin {

  final AuthRepository authRepository;
  final ProfileRepository profileRepository;
  final CrashlyticsService crashlyticsService;

  DeleteUserCubit({
    required this.authRepository,
    required this.profileRepository,
    required this.crashlyticsService,
  }) : super(const DeleteUserState.initial());


  Future<void> deleteUser() async {
    try {
      logger.t('Deleting user profile...');
      emit(const DeleteUserState.loading());
      logger.t('Attempt to delete user without authentication');
      await authRepository.deleteUser();
      logger.t('User deleted');
      emit(const DeleteUserState.completed());
    } on Exception catch (e, stack) {
      if (e.toString().contains('requires-recent-login')) {
        emit(const DeleteUserState.authRequired());
      } else {
        crashlyticsService.recordError(
          exception: e,
          stackTrace: stack,
          reason: 'Unable to delete user!'
        );
        emit(const DeleteUserState.error());
      }
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to delete user profile!'
      );
      emit(const DeleteUserState.error());
    }
  }

}
