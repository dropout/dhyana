import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'session_completed_event.dart';
part 'session_completed_state.dart';
part 'session_completed_bloc.freezed.dart';

class SessionCompletedBloc
    extends Bloc<SessionCompletedEvent, SessionCompletedState> {

  final Logger logger = getLogger('SessionLoggerBloc');

  final ProfileRepository profileRepository;
  final StatisticsRepository statisticsRepository;

  final CrashlyticsService crashlyticsService;
  final IdGeneratorService idGeneratorService;

  SessionCompletedBloc({
    required this.profileRepository,
    required this.statisticsRepository,
    required this.crashlyticsService,
    required this.idGeneratorService,
  }) : super(const SessionCompletedState.initial()) {
    on<LogSessionEvent>(_onLogSession);
  }

  void _onLogSession(
    LogSessionEvent event,
    Emitter<SessionCompletedState> emit
  ) async {
    try {

      // Loading state will be indicated by the UI
      emit(const SessionCompletedState.loading());

      // Load an up-to-date profile and assemble a session object
      Profile profile = await profileRepository.read(event.profileId);

      // Update profile stats with new session
      ProfileStatsReportUpdater profileStatsUpdater =
        ProfileStatsReportUpdater();
      UpdateProfileStatsResult updateResult =
        profileStatsUpdater.updateProfileStatsWithSession(
          profile, event.session,
        );

      // Saving state happens in the background, not indicated by the UI
      // In the saving state, session update results are available to display
      emit(SessionCompletedState.saving(
        updateResult: updateResult,
      ));

      // Log session data for statistics
      await statisticsRepository.logSession(
        updateResult.updatedProfile,
        event.session,
      );

      // Update the profile with the new stats
      await profileRepository.update(updateResult.updatedProfile);

      emit(SessionCompletedState.saved(
        updateResult: updateResult,
      ));

      event.onComplete?.call(updateResult);
      logger.t('Session successfully logged!');
    } catch (e, stack) {
      crashlyticsService.recordError(
          exception: e,
          stackTrace: stack,
          reason: 'Unable to log session: ${event.profileId}'
      );
      emit(SessionCompletedState.error());
      event.onError?.call(e, stack);
    }
  }

}
