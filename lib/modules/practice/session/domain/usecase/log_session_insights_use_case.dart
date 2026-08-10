import 'package:dhyana/modules/insights/public/api/stats_public_api.dart';
import 'package:dhyana/modules/insights/public/model/stats_session.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';
import 'package:dhyana/core/service/mindful_minutes_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';

/// Logs a completed session to statistics and Mindful Minutes when authorized.
class LogSessionInsightsUseCase with LoggerMixin {
  final StatsPublicApi statsPublicApi;
  final MindfulMinutesService mindfulMinutesService;

  LogSessionInsightsUseCase({
    required this.statsPublicApi,
    required this.mindfulMinutesService,
  });

  Future<void> execute(String profileId, SessionEntity session) async {
    await statsPublicApi.logSessionStatistics(
      profileId,
      StatsSession(
        id: session.id,
        startTime: session.startTime,
        endTime: session.endTime,
        duration: session.duration,
        type: switch (session.type) {
          .sitting => .sitting,
          .chanting => .chanting,
        },
      ),
    );

    final authorizationStatus = await mindfulMinutesService
        .getAuthorizationStatus();
    if (authorizationStatus == AuthorizationStatus.authorized) {
      await mindfulMinutesService.logMindfulMinutes(
        session.startTime,
        session.endTime,
      );
      logger.t('Mindful minutes authorized, saving session...');
    } else {
      logger.t('Mindful Minutes is not authorized: $authorizationStatus');
    }

    logger.t('Session successfully logged!');
  }
}
