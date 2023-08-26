import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/session_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'sessions_event.dart';
part 'sessions_state.dart';
part 'sessions_bloc.freezed.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {

  Logger logger = getLogger('SessionsBloc');

  final SessionRepository sessionRepository;
  final AuthRepository authRepository;
  final CrashlyticsService crashlyticsService;

  SessionsBloc({
    required this.sessionRepository,
    required this.authRepository,
    required this.crashlyticsService,
  }) : super(const SessionsState.initial()) {
    on<AddSessionEvent>(_onAddSession);
    on<LoadSessionsEvent>(_onLoadSessions);
  }

  void _onAddSession(AddSessionEvent event, emit) async {
    try {
      logger.v('Adding a session');
      logger.v('Checking if the user logged in');
      User? user = await authRepository.user;
      if (user == null) {
        logger.v('User is not signed in, session not added.');
        return;
      }
      await sessionRepository.addSession(
        event.profileId,
        Session.generateId(
          profileId: user.uid,
          startTime: event.startTime,
          endTime: event.endTime,
          duration: event.startTime.difference(event.endTime).abs(),
          timerSettings: event.timerSettings,
        ),
      );
      logger.v('Session successfully added!');
    } catch(e, stack) {
      logger.v('Failed to add session');
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to add session'
      );
    }
  }

  void _onLoadSessions(LoadSessionsEvent event, emit) async {
    try {
      logger.v('Loading sessions');
      emit(const SessionsState.loading());
      List<Session> sessions = await sessionRepository.getSessions(event.profileId);
      emit(SessionsState.loaded(sessions: sessions));
      logger.v('Sessions successfully loaded');
    } catch(e, stack) {
      emit(const SessionsState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to add session'
      );
      logger.v('Failed to load sessions for: ${event.profileId}');
    }
  }

}
