import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/session_query_options.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'sessions_event.dart';
part 'sessions_state.dart';
part 'sessions_bloc.freezed.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {

  final Logger logger = getLogger('SessionsBloc');

  final StatisticsRepository statisticsRepository;
  final AuthRepository authRepository;
  final CrashlyticsService crashlyticsService;

  SessionsBloc({
    required this.statisticsRepository,
    required this.authRepository,
    required this.crashlyticsService,
  }) : super(const SessionsState.initial()) {
    on<LoadSessionsEvent>(_onLoadSessions);
  }

  // void _onAddSession(AddSessionEvent event, emit) async {
  //   try {
  //     logger.t('Adding a session');
  //     logger.t('Checking if the user logged in');
  //     User? user = await authRepository.user;
  //     if (user == null) {
  //       logger.t('User is not signed in, session not added.');
  //       return;
  //     }
  //
  //     // add to sessions
  //     await sessionRepository.
  //
  //     // log statistics
  //
  //     await sessionRepository.addSession(
  //       event.profileId,
  //       SessionFactory.withFirebaseId(
  //         profileId: user.uid,
  //         startTime: event.startTime,
  //         endTime: event.endTime,
  //         duration: event.startTime.difference(event.endTime).abs(),
  //         timerSettings: event.timerSettings,
  //       )
  //     );
  //
  //     logger.t('Session successfully added!');
  //   } catch(e, stack) {
  //     logger.t('Failed to add session');
  //     crashlyticsService.recordError(
  //       exception: e,
  //       stackTrace: stack,
  //       reason: 'Unable to add session'
  //     );
  //   }
  // }

  void _onLoadSessions(LoadSessionsEvent event, emit) async {
    try {
      logger.t('Loading sessions');
      emit(const SessionsState.loading());
      List<Session> sessions = await statisticsRepository.querySessions(
        event.profileId,
        const SessionQueryOptions()
      );
      emit(SessionsState.loaded(sessions: sessions));
      logger.t('Sessions successfully loaded');
    } catch(e, stack) {
      emit(const SessionsState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to add session'
      );
      logger.t('Failed to load sessions for: ${event.profileId}');
    }
  }

}
