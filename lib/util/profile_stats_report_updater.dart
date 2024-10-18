import 'dart:math';

import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/util/all.dart';
import 'package:logger/logger.dart';

/// Updates profile statistics report
class ProfileStatsReportUpdater {

  final Logger logger = getLogger('ProfileStatsReportUpdater');

  ProfileStatsReportUpdater();

  bool hasLastSession(ProfileStatisticsReport stats) {
    return stats.lastSessionDate != null;
  }

  bool isValidConsecutiveDays(
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
      logger.t('It\'s the first day. Consecutive days: 1.');
      return 1;
    }

    DateTime lastSessionDate = stats.lastSessionDate!;

    // Case 1:
    // When the last session was on the day before yesterday or earlier
    // value should be set to 0 since the user missed a day and consecutive
    // days are broken
    if (isValidConsecutiveDays(lastSessionDate, currentSessionDate) == false) {
      logger.t('Reset consecutive days counting. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
      return 0;
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
    logger.t('Not incrementing consecutive days. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
    return stats.consecutiveDays.current;
  }

  /// Update statistics report with new consecutive days data
  ProfileStatisticsReport updateConsecutiveDays(
    ProfileStatisticsReport stats,
    DateTime currentSessionDate,
  ) {
    final int calculatedConsecutiveDays = calculateConsecutiveDaysCount(stats, currentSessionDate);
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
      logger.t('Completed days = completed days, Same day. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
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

  /// Update profile statistics report with new session data.
  /// In this method we calculate consecutive days, completed days,
  /// completed minutes and completed sessions to return an updated
  /// profile statistics report.
  ProfileStatisticsReport updateProfileStatsReportWithNewSession(
    ProfileStatisticsReport profileStatsReport,
    Session session,
  ) {
    final ProfileStatisticsReport oldStatsReport = profileStatsReport;
    ProfileStatisticsReport updatedStatsReport = oldStatsReport.copyWith();

    // Update consecutive days
    updatedStatsReport = updateConsecutiveDays(
      updatedStatsReport, session.startTime
    );
    logger.t('Consecutive days: ${oldStatsReport.consecutiveDays.current} -> ${updatedStatsReport.consecutiveDays.current}');

    // Update completed days
    updatedStatsReport = updateCompletedDays(
      updatedStatsReport,
      session.startTime,
    );
    logger.t('Completed days: ${oldStatsReport.completedDaysCount} -> ${updatedStatsReport.completedDaysCount}');

    // Add session results to stats
    updatedStatsReport = updatedStatsReport.copyWith(
      lastSessionDate: session.startTime,
      completedMinutesCount: updatedStatsReport.completedMinutesCount + session.duration.inMinutes,
      completedSessionsCount: updatedStatsReport.completedSessionsCount + 1,
      firstSessionDate: (oldStatsReport.firstSessionDate == null) ? session.startTime : oldStatsReport.firstSessionDate,
    );
    logger.t('Last session date: ${oldStatsReport.lastSessionDate} -> ${updatedStatsReport.lastSessionDate}');
    logger.t('Completed minutes count: ${oldStatsReport.completedMinutesCount} -> ${updatedStatsReport.completedMinutesCount}');
    logger.t('Completed session count: ${oldStatsReport.completedSessionsCount} -> ${updatedStatsReport.completedSessionsCount}');

    return updatedStatsReport;
  }

  /// Validates consecutive days count in the profile statistics report
  /// If the consecutive days are valid, does nothing, if not, resets the count
  /// and returns the updated profile statistics report.
  ProfileStatisticsReport validateConsecutiveDays(ProfileStatisticsReport statsReport) {

    final DateTime? lastSessionDate = statsReport.lastSessionDate;

    // Check if the user has a last session, if not, no need to validate
    if (lastSessionDate == null) {
      logger.t('Skipping validating consecutive days: no last session');
      return statsReport;
    }

    final DateTime now = DateTime.now();

    // If consecutive days are valid, no need to update
    final bool isConsecutiveDaysValid =
      isValidConsecutiveDays(lastSessionDate, now);
    if (isConsecutiveDaysValid) {
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
    );

  }

}
