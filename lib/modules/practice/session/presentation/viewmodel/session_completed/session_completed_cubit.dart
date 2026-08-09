import 'package:dhyana/modules/practice/session/data/mapper/session_mapper.dart';
import 'package:dhyana/modules/practice/session/public/model/session.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_completed_data_entity.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/log_session_insights_use_case.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/modules/practice/session/domain/entity/update_profile_stats_result_entity.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';

/// Cubit to manage the state of session completion and logging
/// When a session is completed, this cubit handles updating the profile stats,
/// logging the session to statistics, and emitting states to reflect the progress.
/// Addresses the requirements of displaying data and progress on SessionCompletedScreen.
class SessionCompletedCubit extends Cubit<SessionCompletedDataEntity>
    with LoggerMixin {

  final CrashlyticsService crashlyticsService;

  final UpdateProfileWithSessionUseCase updateProfileWithSession;
  final LogSessionInsightsUseCase logSessionUseCase;

  SessionCompletedCubit({
    required this.crashlyticsService,
    required this.updateProfileWithSession,
    required this.logSessionUseCase,
  }) : super(const SessionCompletedDataEntity.initial());

  Future<void> logSession(
    String profileId,
    Session session, {
    void Function(UpdateProfileStatsResultEntity updateResults)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
  }) async {
    try {
      // Loading state will be indicated by the UI
      emit(const SessionCompletedDataEntity.loading());

      final result = await updateProfileWithSession.execute(
        profileId,
        session.toEntity(),      
      );

      


      emit(SessionCompletedDataEntity.saving(
        updateResult: result
      ));

      await logSessionUseCase.execute(result.updatedProfile.id, session.toEntity());

      // Emit saved state
      emit(SessionCompletedDataEntity.saved(updateResult: result));

      onComplete?.call(result);
      logger.t('Session successfully logged!');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Error logging session in SessionCompletedCubit',
      );
      emit(const SessionCompletedDataEntity.error());
      onError?.call(e, stack);
    }
  }
}
