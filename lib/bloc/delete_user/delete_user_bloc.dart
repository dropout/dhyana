import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_user_event.dart';
part 'delete_user_state.dart';
part 'delete_user_bloc.freezed.dart';

class DeleteUserBloc extends Bloc<DeleteUserEvent, DeleteUserState> {

  final Logger logger = getLogger('DeleteUserBloc');

  final AuthRepository authRepository;
  final ProfileRepository profileRepository;
  final CrashlyticsService crashlyticsService;

  DeleteUserBloc({
    required this.authRepository,
    required this.profileRepository,
    required this.crashlyticsService,
  }) : super(DeleteUserInitialState()) {

    on<DeleteUserActionEvent>(_onDeleteUserActionEvent);
  }

  void _onDeleteUserActionEvent(DeleteUserActionEvent event, emit) async {

    try {
      logger.t('Deleting user profile...');
      emit(DeleteUserState.loading());
      logger.t('Attempt to delete user without authentication');
      await authRepository.deleteUser();
      logger.t('User deleted');
      emit(DeleteUserState.completed());
    } on FirebaseAuthException catch(e, stack) {
      if (e.code == 'requires-recent-login') {
        emit(DeleteUserState.authRequired());
      } else {
        crashlyticsService.recordError(
          exception: e,
          stackTrace: stack,
          reason: 'Unable to delete user!'
        );
        emit(DeleteUserState.error());
      }
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to delete user profile!'
      );
      emit(DeleteUserState.error());
    }
  }

}
