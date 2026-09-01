import 'package:session/src/data/mapper/session_mapper.dart';
import 'package:session/src/domain/repository/session_repository.dart';
import 'package:session/src/public/model/session.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core/core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessions_state.dart';
part 'sessions_cubit.freezed.dart';

class SessionsCubit extends Cubit<SessionsState> with LoggerMixin {

  final SessionRepository sessionRepository;
  final CrashlyticsService crashlyticsService;

  SessionsCubit({
    required this.sessionRepository,
    required this.crashlyticsService,
  }) : super(const SessionsState.initial());

  Future<void> loadSessions(String profileId) async {
    try {
      emit(const SessionsState.loading());
      final sessions = await sessionRepository.query(
        profileId,
      );
      emit(SessionsState.loaded(sessions: sessions.map((e) => e.toApi()).toList()));
      logger.t('Sessions successfully loaded: ${sessions.length}');
    } catch(e, stack) {
      emit(const SessionsState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load session'
      );
      logger.t('Failed to load sessions for: $profileId');
    }
  }

}
