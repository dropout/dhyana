import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_completed_state.dart';
part 'session_completed_cubit.freezed.dart';

/// Cubit to manage the state of session completion and logging
/// When a session is completed, this cubit handles updating the profile stats,
/// logging the session to statistics, and emitting states to reflect the progress.
/// Addresses the requirements of displaying data and progress on SessionCompletedScreen.
class SessionCompletedCubit extends Cubit<SessionCompletedState> with LoggerMixin {

  final ProfileRepository profileRepository;
  final StatisticsRepository statisticsRepository;

  final CrashlyticsService crashlyticsService;
  final IdGeneratorService idGeneratorService;

  SessionCompletedCubit({
    required this.profileRepository,
    required this.statisticsRepository,
    required this.crashlyticsService,
    required this.idGeneratorService,
  }) : super(const SessionCompletedState.initial());

  Future<void> logSession(String profileId, Session session, {
    void Function(UpdateProfileStatsResult updateResults)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
  }) async {
    try {
      // Loading state will be indicated by the UI
      emit(const SessionCompletedState.loading());

      // Load an up-to-date profile and assemble a session object
      Profile profile = await profileRepository.read(profileId);

      // Update profile stats with new session
      ProfileStatsReportUpdater profileStatsUpdater =
        ProfileStatsReportUpdater();
      UpdateProfileStatsResult updateResult =
        profileStatsUpdater.updateProfileStatsWithSession(
          profile, session,
        );

      // Saving state happens in the background, not indicated by the UI
      // In the saving state, session update results are available to display
      emit(SessionCompletedState.saving(
        updateResult: updateResult,
      ));

      // Log session data for statistics
      await statisticsRepository.logSession(
        updateResult.updatedProfile,
        session,
      );

      // Update the profile with the new stats
      await profileRepository.update(updateResult.updatedProfile);

      // Emit saved state
      emit(SessionCompletedState.saved(
        updateResult: updateResult,
      ));

      onComplete?.call(updateResult);
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
