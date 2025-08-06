import 'dart:math';

import 'package:dhyana/model/all.dart';
import 'package:dhyana/util/all.dart';
import 'package:logger/logger.dart';

/// Updates profile statistics report
class ProfileStatsReportUpdater {

  final Logger logger = getLogger('ProfileStatsReportUpdater');

  ProfileStatsReportUpdater();

  bool hasLastSession(ProfileStatisticsReport stats) {
    return stats.lastSessionDate != null;
  }

  bool hasValidConsecutiveDays(
    DateTime lastSessionDate,
    DateTime currentSessionDate
  ) {
    return (currentSessionDate.isBeforeYesterday(lastSessionDate) == false);
  }

  /// Calculate the number of consecutive days when a new session has been
  /// completed.
  int calculateConsecutiveDaysCount(
    ProfileStatisticsReport stats,
    DateTime currentSessionDate,
  ) {

    // Case 0:
    // Last session is null, this is the first session,
    // so consecutive days should be 1
    if (hasLastSession(stats) == false) {
      logger.t('It\'s the first session, first day. Consecutive days: 1.');
      return 1;
    }

    DateTime lastSessionDate = stats.lastSessionDate!;

    // Case 1:
    // When the last session was on the day before yesterday or earlier
    // value should be set to 1 since the user missed a day and consecutive
    // days are broken but with the current session the user is starting a new streak
    if (hasValidConsecutiveDays(lastSessionDate, currentSessionDate) == false) {
      logger.t('Reset consecutive days counting. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
      return 1;
    }

    // Case 2:
    // When the last session was on yesterday, value should be incremented by 1
    bool isPreviousDay = currentSessionDate.isYesterday(lastSessionDate);
    if (isPreviousDay) {
      logger.t('Incrementing consecutive days. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
      return stats.consecutiveDays.current + 1;
    }

    // Case 3:
    // The session is on the same day, so no need to increment or reset
    logger.t('Not incrementing consecutive days, same day. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
    return stats.consecutiveDays.current;
  }

  /// Update statistics report with new consecutive days data
  ProfileStatisticsReport updateConsecutiveDays(
    ProfileStatisticsReport stats,
    DateTime currentSessionDate,
  ) {
    final int calculatedConsecutiveDays =
      calculateConsecutiveDaysCount(stats, currentSessionDate);
    return stats.copyWith(
      consecutiveDays: stats.consecutiveDays.copyWith(
        current: calculatedConsecutiveDays,
        longest: max(calculatedConsecutiveDays, stats.consecutiveDays.longest),
        startedAt: (calculatedConsecutiveDays == 1) ? currentSessionDate : stats.consecutiveDays.startedAt,
        lastChecked: currentSessionDate,
      ),
    );
  }

  /// Update statistics report with new completed days count
  ProfileStatisticsReport updateCompletedDays(
    ProfileStatisticsReport stats,
    DateTime currentSessionDate,
  ) {

    // Case 0:
    // Its the first day, so completed days should be incremented
    if (stats.lastSessionDate == null) {
      logger.t('Completed days + 1, first session');
      return stats.copyWith(
        completedDaysCount: stats.completedDaysCount + 1,
      );
    }

    // Case 1:
    // Its the same day no need to increment
    DateTime lastSessionDate = stats.lastSessionDate!;
    bool sameDay = currentSessionDate.isSameDay(lastSessionDate);
    if (sameDay) {
      logger.t('Not incrementing completed days, same day. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
      return stats;
    }

    // Case 2:
    // If its not the the same day as the last session completed days
    // should be incremented
    logger.t('Completed days + 1: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
    return stats.copyWith(
      completedDaysCount: stats.completedDaysCount + 1,
    );
  }

  /// Update milestone progress in the profile statistics report
  /// with new session data.
  ProfileStatisticsReport updateMilestoneProgressWithSession(
    ProfileStatisticsReport oldStatsReport,
    ProfileStatisticsReport updatedStatsReport,
    Session session,
  ) {

    // Case 0:
    // The consecutive days has been reset,
    // reset the milestone progress too
    if (updatedStatsReport.consecutiveDays.current == 0 &&
        oldStatsReport.consecutiveDays.current != 0) {
      logger.t('Resetting milestone progress');
      return updatedStatsReport.copyWith(
        milestoneProgress: MilestoneProgress(),
      );
    }

    // Check for consecutive days change
    final int consecutiveDaysDiff =
      updatedStatsReport.consecutiveDays.current -
        oldStatsReport.consecutiveDays.current;

    // Case 1:
    // If the consecutive days have not changed, no need to update
    if (consecutiveDaysDiff == 0) {
      logger.t('No change in consecutive days, skipping milestone progress update');
      return updatedStatsReport;
    }

    // Case 2:
    // If the consecutive days have increased,
    // update the milestone progress too
    if (consecutiveDaysDiff > 0) {
      MilestoneProgress milestoneProgress = updatedStatsReport.milestoneProgress;

      // Case 2.1:
      // If the milestone progress is already completed, restart the progress
      if (milestoneProgress.completedDaysCount == milestoneProgress.targetDaysCount) {
        return updatedStatsReport.copyWith(
          milestoneProgress: MilestoneProgress(
            completedDaysCount: 1,
            sessions: [session],
          ),
        );
      }

      // Case 2.2:
      // If there are still milestones to complete, update the progress
      if (milestoneProgress.completedDaysCount < milestoneProgress.targetDaysCount) {
        return updatedStatsReport.copyWith(
          milestoneProgress: milestoneProgress.copyWith(
            completedDaysCount: milestoneProgress.completedDaysCount + 1,
            sessions: [...milestoneProgress.sessions, session],
          ),
        );
      }
    }

    // Consecutive days negative? Should not happen
    // Maybe throw an error instead?
    return updatedStatsReport;

  }

  /// Validates the consecutive days count in the stats report.
  /// If the consecutive days are valid, does nothing, if not:
  /// - resets the consecutive days count
  /// - resets the milestone progress
  ProfileStatisticsReport validateStatsReport(
    ProfileStatisticsReport statsReport
  ) {

    final DateTime? lastSessionDate = statsReport.lastSessionDate;

    // Check if the user has a last session, if not, no need to validate
    if (lastSessionDate == null) {
      logger.t('Skipping validating consecutive days: no last session');
      return statsReport;
    }

    final DateTime now = DateTime.now();

    // Check if consecutive days has been already validated today
    // In that case no need to continue
    if (now.isSameDay(statsReport.consecutiveDays.lastChecked)) {
      logger.t('Skipping validating consecutive days: it\' the same day!');
      return statsReport;
    }

    // If consecutive days are valid, no need to update
    if (hasValidConsecutiveDays(lastSessionDate, now)) {
      logger.t('Consecutive days are valid: ${statsReport.consecutiveDays.current}');
      return statsReport.copyWith(
        consecutiveDays: statsReport.consecutiveDays.copyWith(
          lastChecked: now,
        ),
      );
    }

    // If consecutive days are not valid, reset the count
    logger.t('Consecutive days are not valid, resetting count');
    return statsReport.copyWith(
      consecutiveDays: statsReport.consecutiveDays.copyWith(
        current: 0,
        lastChecked: now,
      ),
      milestoneProgress: statsReport.milestoneProgress.copyWith(
        completedDaysCount: 0,
        sessions: [],
      ),
    );

  }

  UpdateProfileStatsResult updateProfileStatsWithSession(
    Profile profile,
    Session session,
  ) {

    final ProfileStatisticsReport oldStatsReport = profile.statsReport;
    ProfileStatisticsReport updatedStatsReport = oldStatsReport.copyWith();

    // Update consecutive days
    updatedStatsReport = updateConsecutiveDays(
      updatedStatsReport,
      session.startTime
    );
    logger.t('Consecutive days: ${oldStatsReport.consecutiveDays.current} -> ${updatedStatsReport.consecutiveDays.current}');

    // Update completed days
    updatedStatsReport = updateCompletedDays(
      updatedStatsReport,
      session.startTime,
    );
    logger.t('Completed days: ${oldStatsReport.completedDaysCount} -> ${updatedStatsReport.completedDaysCount}');

    // Update milestone progress
    updatedStatsReport = updateMilestoneProgressWithSession(
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

    // Update profile statistics report with data from new session
    Profile updatedProfile = profile.copyWith(statsReport: updatedStatsReport);

    return UpdateProfileStatsResult(
      oldProfile: profile,
      updatedProfile: updatedProfile,
      session: session,
    );
  }

}
