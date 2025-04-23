import 'package:dhyana/bloc/session_logger/task/update_profile_stats_task.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/service/id_generator_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'session_logger_event.dart';
part 'session_logger_state.dart';
part 'session_logger_bloc.freezed.dart';

class SessionLoggerBloc extends Bloc<SessionLoggerEvent, SessionLoggerState> {

  final Logger logger = getLogger('SessionLoggerBloc');

  final ProfileRepository profileRepository;
  final StatisticsRepository statisticsRepository;

  final CrashlyticsService crashlyticsService;
  final IdGeneratorService idGeneratorService;

  SessionLoggerBloc({
    required this.profileRepository,
    required this.statisticsRepository,
    required this.crashlyticsService,
    required this.idGeneratorService,
  }) : super(const SessionLoggerState.initial()) {
    on<LogSessionEvent>(_onLogSession);
  }

  void _onLogSession(
    LogSessionEvent event,
    Emitter<SessionLoggerState> emit
  ) async {
    try {
      emit(const SessionLoggerState.loading());

      // Load an up-to-date profile and assemble a session object
      Profile profile = await profileRepository.read(event.profileId);
      Session session = Session(
        id: idGeneratorService.sessionId(profile.id),
        startTime: event.startTime,
        endTime: event.endTime,
        duration: event.duration,
        timerSettings: event.timerSettings,
      );

      // Update profilestats with new session
      UpdateProfileStatsTask logSessionTask = UpdateProfileStatsTask(
        profile: profile,
        session: session,
        profileRepository: profileRepository,
        statisticsRepository: statisticsRepository,
      );
      UpdateProfileStatsTaskResult result = await logSessionTask.execute();
      emit(SessionLoggerState.saving(
        oldProfile: result.oldProfile,
        session: session,
        updatedProfile: result.updatedProfile,
      ));

      // Save session data and update profile data
      await statisticsRepository.logSession(result.updatedProfile, session);
      await profileRepository.update(result.updatedProfile);

      emit(SessionLoggerState.saved(
        oldProfile: result.oldProfile,
        session: session,
        updatedProfile: result.updatedProfile,
      ));

      event.onComplete?.call(result.updatedProfile);
      logger.t('Session successfully logged!');
    } catch (e, stack) {
      crashlyticsService.recordError(
          exception: e,
          stackTrace: stack,
          reason: 'Unable to log session: ${event.profileId}'
      );
      emit(SessionLoggerState.error());
      event.onError?.call(e, stack);
    }
  }

}
