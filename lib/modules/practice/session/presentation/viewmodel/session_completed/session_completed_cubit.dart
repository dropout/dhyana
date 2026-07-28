import 'package:dhyana/modules/practice/session/domain/entity/session_completed_data.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/log_session_statistics_use_case.dart';
import 'package:dhyana/modules/practice/session/domain/usecase/update_profile_with_session_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/core/domain/repository/statistics_repository.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/entity/profile/update_profile_stats_result.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';

/// Cubit to manage the state of session completion and logging
/// When a session is completed, this cubit handles updating the profile stats,
/// logging the session to statistics, and emitting states to reflect the progress.
/// Addresses the requirements of displaying data and progress on SessionCompletedScreen.
class SessionCompletedCubit extends Cubit<SessionCompletedData>
    with LoggerMixin {
  final ProfileRepository profileRepository;
  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;

  final UpdateProfileWithSessionUseCase saveSessionToProfileUseCase;
  final LogSessionStatisticsUseCase logSessionUseCase;

  SessionCompletedCubit({
    required this.profileRepository,
    required this.statisticsRepository,
    required this.crashlyticsService,
    required this.saveSessionToProfileUseCase,
    required this.logSessionUseCase,
  }) : super(const SessionCompletedData.initial());

  Future<void> logSession(
    String profileId,
    Session session, {
    void Function(UpdateProfileStatsResult updateResults)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
  }) async {
    try {
      // Loading state will be indicated by the UI
      emit(const SessionCompletedData.loading());

      final result = await saveSessionToProfileUseCase.execute(
        profileId,
        session,
      );

      emit(SessionCompletedData.saving(
        updateResult: result
      ));

      await logSessionUseCase.execute(result.updatedProfile, session);

      // Emit saved state
      emit(SessionCompletedData.saved(updateResult: result));

      onComplete?.call(result);
      logger.t('Session successfully logged!');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Error logging session in SessionCompletedCubit',
      );
      emit(const SessionCompletedData.error());
      onError?.call(e, stack);
    }
  }
}
