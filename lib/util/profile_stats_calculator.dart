import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/util/all.dart';
import 'package:logger/logger.dart';

/// Updates profile statistics report
class ProfileStatsReportUpdater {

  final Logger logger = getLogger('ProfileStatsCalculator');

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
    // Last session is null, so this is the first day, nothing to calculate
    if (hasLastSession(stats) == false) {
      logger.t('There were no last session, skipping consecutive days calculation.');
      return 0;
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
      return stats.consecutiveDays.count + 1;
    }

    // Case 3:
    // The session is on the same day, so no need to increment or reset
    logger.t('Not incrementing consecutive days. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
    return stats.consecutiveDays.count;
  }

  /// Update statistics report with new consecutive days count
  ProfileStatisticsReport updateConsecutiveDays(
    ProfileStatisticsReport stats,
    DateTime currentSessionDate,
  ) {
    int calculatedConsecutiveDays = calculateConsecutiveDaysCount(stats, currentSessionDate);
    return stats.copyWith(
      consecutiveDays: stats.consecutiveDays.copyWith(
        count: calculatedConsecutiveDays
      ),
    );
  }

  /// Update statistics report with new completed days count
  ProfileStatisticsReport updateCompletedDays(
      ProfileStatisticsReport stats, { DateTime? currentSessionDate }
  ) {

    DateTime now = currentSessionDate ?? DateTime.now();

    // Case 0:
    // Its the first day, so completed days should increment
    if (stats.lastSessionDate == null) {
      return stats.copyWith(
        completedDaysCount: stats.completedDaysCount + 1,
      );
    }

    // Case 1:
    // Its the same day no need to increment
    DateTime lastSessionDate = stats.lastSessionDate!;
    bool sameDay = now.isSameDay(lastSessionDate);
    if (sameDay) {
      logger.t('Not incrementing completed days, it\'s the same day. Last: ${lastSessionDate.toDayId()} | Current: ${now.toDayId()}');
      return stats;
    }

    // Case 2:
    // If its not the the same day as the last session completed days
    // should increment
    logger.t('Incrementing completed days Last: ${lastSessionDate.toDayId()} | Current: ${now.toDayId()}');
    return stats.copyWith(
      completedDaysCount: stats.completedDaysCount + 1,
    );
  }

  /// Update profile statistics report with new session data
  /// In this method we calculate consecutive days, completed days,
  /// completed minutes and completed sessions and return an updated
  /// profile statistics report.
  ProfileStatisticsReport updateProfileStatsReportWithNewSession(
    ProfileStatisticsReport profileStatsReport,
    Session session,
  ) {
    ProfileStatisticsReport oldStatsReport = profileStatsReport;
    ProfileStatisticsReport updatedStatsReport = oldStatsReport.copyWith();

    // Calculate consecutive days
    if (updatedStatsReport.lastSessionDate != null) {
      updatedStatsReport = updateConsecutiveDays(updatedStatsReport, session.startTime);
      logger.t('Calculating consecutive days: ${oldStatsReport.consecutiveDays} -> ${updatedStatsReport.consecutiveDays}');
    } else {
      logger.t('There were no last session, skipping consecutive days calculation.');
    }

    // Override calculation when adding a session:
    // Minimum value for consecutive days when adding a session is 1
    if (updatedStatsReport.consecutiveDays.count == 0) {
      updatedStatsReport = updatedStatsReport.copyWith(
        consecutiveDays: updatedStatsReport.consecutiveDays.copyWith(
          count: 1,
        )
      );
      logger.t('Setting consecutive days count to "1": ${oldStatsReport.consecutiveDays} -> ${updatedStatsReport.consecutiveDays}');
    }

    // Calculate completed days
    if (updatedStatsReport.lastSessionDate == null) {
      updatedStatsReport = updatedStatsReport.copyWith(
        completedDaysCount: updatedStatsReport.completedDaysCount + 1,
      );
      logger.t('Incrementing completed days (first day case): ${oldStatsReport.completedDaysCount} -> ${updatedStatsReport.completedDaysCount}');
    } else {
      updatedStatsReport = updateCompletedDays(
        updatedStatsReport,
        currentSessionDate: session.startTime,
      );
      logger.t('Calculating completed days: ${oldStatsReport.completedDaysCount} -> ${updatedStatsReport.completedDaysCount}');
    }

    // Add session results to stats
    updatedStatsReport = updatedStatsReport.copyWith(
      lastSessionDate: session.startTime,
      completedMinutesCount: updatedStatsReport.completedMinutesCount + session.duration.inMinutes,
      completedSessionsCount: updatedStatsReport.completedSessionsCount + 1,
    );
    logger.t('Last session date: ${oldStatsReport.lastSessionDate} -> ${updatedStatsReport.lastSessionDate}');
    logger.t('Completed minutes count: ${oldStatsReport.completedMinutesCount} -> ${updatedStatsReport.completedMinutesCount}');
    logger.t('Completed session count: ${oldStatsReport.completedSessionsCount} -> ${updatedStatsReport.completedSessionsCount}');

    return updatedStatsReport;
  }

  /// Validates consecutive days count in the profile statistics report
  /// If the consecutive days are valid, does nothing, if not, resets the count
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
      logger.t('Consecutive days are valid: ${statsReport.consecutiveDays.count}');
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
        count: 0,
        lastChecked: now,
      ),
    );

  }

}
