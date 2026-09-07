import 'package:core/core.dart';

import 'package:session/src/domain/entity/session_entity.dart';
import 'package:session/src/domain/service/session_app_port.dart';


/// Logs a completed session to statistics and Mindful Minutes when authorized.
class LogSessionInsightsUseCase with LoggerMixin {
  final SessionAppPort sessionAppPort;

  LogSessionInsightsUseCase({
    required this.sessionAppPort,
  });

  Future<void> execute(String profileId, SessionEntity session) async {
    
    // Log to the StatsPublicApi
    await sessionAppPort.logSessionStatistics(
      profileId,
      session,
    );

    // Log to Mindful Minutes Platform Health API if authorized
    final isAuthorized = await sessionAppPort
        .isMindfulMinutesAuthorized();
    if (isAuthorized) {
      await sessionAppPort.logMindfulMinutes(
        session.startTime,
        session.endTime,
      );
      logger.t('Mindful minutes authorized, saving session...');
    } else {
      logger.t('Mindful Minutes is not authorized: $isAuthorized');
    }

    logger.t('Session successfully logged!');
  }
}
