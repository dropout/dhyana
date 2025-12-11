import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/all.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sessions_state.dart';
part 'sessions_cubit.freezed.dart';

class SessionsCubit extends Cubit<SessionsState> with LoggerMixin {

  final StatisticsRepository statisticsRepository;
  final AuthRepository authRepository;
  final CrashlyticsService crashlyticsService;

  SessionsCubit({
    required this.statisticsRepository,
    required this.authRepository,
    required this.crashlyticsService,
  }) : super(const SessionsState.initial());

  Future<void> loadSessions(String profileId) async {
    try {
      emit(const SessionsState.loading());
      List<Session> sessions = await statisticsRepository.querySessions(
        profileId,
        const SessionQueryOptions()
      );
      emit(SessionsState.loaded(sessions: sessions));
      logger.t('Sessions successfully loaded: ${sessions.length}');
    } catch(e, stack) {
      emit(const SessionsState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to add session'
      );
      logger.t('Failed to load sessions for: $profileId');
    }
  }

}
