

import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:dhyana/service/profile_stats_report_updater.dart';
import 'package:logger/logger.dart';

class UpdateProfileStatsTask {

  final Logger logger = getLogger('UpdateProfileStatsTask');

  /// The profile to log the session for.
  final Profile profile;

  /// The session to log.
  final Session session;

  final ProfileRepository profileRepository;
  final StatisticsRepository statisticsRepository;

  final ProfileStatsReportUpdater profileStatsUpdater
    = ProfileStatsReportUpdater();

  UpdateProfileStatsTask({
    required this.profile,
    required this.session,
    required this.profileRepository,
    required this.statisticsRepository,
  });

  Future<UpdateProfileStatsTaskResult> execute() async {

    final ProfileStatisticsReport oldStatsReport = profile.statsReport;
    ProfileStatisticsReport updatedStatsReport = oldStatsReport.copyWith();

    // Update consecutive days
    updatedStatsReport = profileStatsUpdater.updateConsecutiveDays(
      updatedStatsReport,
      session.startTime
    );
    logger.t('Consecutive days: ${oldStatsReport.consecutiveDays.current} -> ${updatedStatsReport.consecutiveDays.current}');

    // Update completed days
    updatedStatsReport = profileStatsUpdater.updateCompletedDays(
      updatedStatsReport,
      session.startTime,
    );
    logger.t('Completed days: ${oldStatsReport.completedDaysCount} -> ${updatedStatsReport.completedDaysCount}');

    // Update milestone progress
    updatedStatsReport = profileStatsUpdater.updateMilestoneProgressWithSession(
      oldStatsReport,
      updatedStatsReport,
      session,
    );

    // Check if a milestone has been completed
    int prevMileStoneCount = oldStatsReport.milestoneProgress.completedDaysCount;
    int newMileStoneCount = updatedStatsReport.milestoneProgress.completedDaysCount;
    int targetMileStoneCount = updatedStatsReport.milestoneProgress.targetDaysCount;
    if (prevMileStoneCount == (targetMileStoneCount - 1) &&
     newMileStoneCount == targetMileStoneCount) {
      updatedStatsReport = updatedStatsReport.copyWith(
        milestoneCount: updatedStatsReport.milestoneCount + 1,
      );
      logger.t('Milestone completed');
    }

    // Add session results to stats
    updatedStatsReport = updatedStatsReport.copyWith(
      lastSessionDate: session.startTime,
      completedMinutesCount: updatedStatsReport.completedMinutesCount +
        session.duration.inMinutes,
      completedSessionsCount: updatedStatsReport.completedSessionsCount + 1,
      firstSessionDate: (oldStatsReport.firstSessionDate == null) ?
        session.startTime : oldStatsReport.firstSessionDate,
    );
    logger.t('Last session date: ${oldStatsReport.lastSessionDate}'
      ' -> ${updatedStatsReport.lastSessionDate}');
    logger.t('Completed minutes count: ${oldStatsReport.completedMinutesCount}'
      ' -> ${updatedStatsReport.completedMinutesCount}');
    logger.t('Completed session count: ${oldStatsReport.completedSessionsCount}'
      ' -> ${updatedStatsReport.completedSessionsCount}');

    // Update profile statistics report with new session
    Profile updatedProfile = profile.copyWith(statsReport: updatedStatsReport);

    return UpdateProfileStatsTaskResult(
      oldProfile: profile,
      updatedProfile: updatedProfile,
    );
  }

}

class UpdateProfileStatsTaskResult {

  final Profile oldProfile;
  final Profile updatedProfile;

  const UpdateProfileStatsTaskResult({
    required this.oldProfile,
    required this.updatedProfile,
  });

}
