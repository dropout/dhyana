import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/entity/session.dart';
import 'package:dhyana/core/domain/repository/statistics_repository.dart';
import 'package:dhyana/core/domain/service/mindful_minutes_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';

/// Logs a completed session to statistics and Mindful Minutes when authorized.
class LogSessionStatisticsUseCase with LoggerMixin {
  final StatisticsRepository statisticsRepository;
  final MindfulMinutesService mindfulMinutesService;

  LogSessionStatisticsUseCase({
    required this.statisticsRepository,
    required this.mindfulMinutesService,
  });

  Future<void> execute(Profile updatedProfile, Session session) async {
    await statisticsRepository.logSessionStatistics(updatedProfile, session);

    final authorizationStatus =
        await mindfulMinutesService.getAuthorizationStatus();
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
