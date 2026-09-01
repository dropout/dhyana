import 'package:core/core.dart';
import 'package:dhyana/modules/stats/stats_module.dart';
import 'package:session/src/domain/entity/session_entity.dart';


/// Logs a completed session to statistics and Mindful Minutes when authorized.
class LogSessionInsightsUseCase with LoggerMixin {
  final StatsPublicApi statsPublicApi;
  final MindfulMinutesService mindfulMinutesService;

  LogSessionInsightsUseCase({
    required this.statsPublicApi,
    required this.mindfulMinutesService,
  });

  Future<void> execute(String profileId, SessionEntity session) async {
    
    // Log to the StatsPublicApi
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

    // Log to Mindful Minutes Platform Health API if authorized
    final authorizationStatus = await mindfulMinutesService
        .getAuthorizationStatus();
    if (authorizationStatus == .authorized) {
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
