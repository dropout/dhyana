import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:core/core.dart';
import 'package:session/src/data/mapper/session_mapper.dart';
import 'package:session/src/data/mapper/update_profile_stats_result_mapper.dart';
import 'package:session/src/domain/usecase/save_session_stats_use_case.dart';
import 'package:session/src/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:session/src/public/model/session.dart';
import 'package:session/src/public/model/update_profile_stats_result.dart';


part 'session_completed_cubit.freezed.dart';

@freezed
class SessionCompletedState with _$SessionCompletedState {
  
  const SessionCompletedState._();

  const factory SessionCompletedState.initial() = SessionCompletedInitialState;
  const factory SessionCompletedState.loading() = SessionCompletedLoadingState;
  const factory SessionCompletedState.error() = SessionCompletedErrorState;

  const factory SessionCompletedState.saving({
    required UpdateProfileStatsResult updateResult,
  }) = SessionCompletedSavingState;

  const factory SessionCompletedState.saved({
    required UpdateProfileStatsResult updateResult,
  }) = SessionCompletedSavedState;

}




/// Cubit to manage the state of session completion and logging
/// When a session is completed, this cubit handles updating the profile stats,
/// logging the session to statistics, and emitting states to reflect the progress.
/// Addresses the requirements of displaying data and progress on SessionCompletedScreen.
class SessionCompletedCubit extends Cubit<SessionCompletedState>
    with LoggerMixin {

  final UpdateProfileWithSessionUseCase updateProfileWithSessionUseCase;
  final SaveSessionStatsUseCase saveSessionStatsUseCase;

  final CrashlyticsService crashlyticsService;

  SessionCompletedCubit({    
    required this.updateProfileWithSessionUseCase,
    required this.saveSessionStatsUseCase,
    required this.crashlyticsService,
  }) : super(const SessionCompletedState.initial());

  Future<void> logSession(
    String profileId,
    Session session, {
    void Function(UpdateProfileStatsResult updateResults)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
  }) async {
    try {
      // Loading state will be indicated by the UI
      emit(const SessionCompletedState.loading());

      final result = await updateProfileWithSessionUseCase.execute(
        profileId,
        session.toDomain(),
      );

      // UI can show update results while save the 
      emit(SessionCompletedState.saving(updateResult: result.toApi()));

      await saveSessionStatsUseCase.execute(
        profileId, 
        session.toDomain()
      );

      // Emit saved state
      emit(SessionCompletedState.saved(updateResult: result.toApi()));

      onComplete?.call(result.toApi());
      logger.t('Session successfully logged!');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Error logging session in SessionCompletedCubit',
      );
      emit(const SessionCompletedState.error());
      onError?.call(e, stack);
    }
  }
}
