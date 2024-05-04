import 'package:dhyana/model/profile_stats.dart';
import 'package:dhyana/util/all.dart';
import 'package:logger/logger.dart';

class ProfileStatsCalculator {

  final Logger logger = getLogger('ProfileStatsCalculator');

  bool hasLastSession(ProfileStats stats) {
    return stats.lastSessionDate != null;
  }

  bool isValidConsecutiveDays(DateTime lastSessionDate, DateTime now) {
    return (now.isBeforeYesterday(lastSessionDate) == false);
  }

  bool shouldIncrementConsecutiveDays(DateTime lastSessionDate, DateTime now) {
    return now.isYesterday(lastSessionDate);
  }

  int getCalculatedConsecutiveDays(ProfileStats stats, { DateTime? currentSessionDate }) {
    DateTime now = currentSessionDate ?? DateTime.now();

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
    if (isValidConsecutiveDays(lastSessionDate, now) == false) {
      logger.t('Reset consecutive days counting. Last: ${lastSessionDate.toDayId()} | Current: ${now.toDayId()}');
      return 0;
    }

    // Case 2:
    // When the last session was on yesterday, value should be incremented by 1
    bool isPreviousDay = now.isYesterday(lastSessionDate);
    if (isPreviousDay) {
      logger.t('Incrementing consecutive days. Last: ${lastSessionDate.toDayId()} | Current: ${now.toDayId()}');
      return stats.consecutiveDays + 1;
    }

    // Case 3:
    // The session is on the same day, so no need to increment or reset
    logger.t('Not incrementing consecutive days. Last: ${lastSessionDate.toDayId()} | Current: ${now.toDayId()}');
    return stats.consecutiveDays;
  }

  ProfileStats calculateConsecutiveDays(
    ProfileStats stats, { DateTime? currentSessionDate }
  ) {
    DateTime now = currentSessionDate ?? DateTime.now();
    int calculatedConsecutiveDays = getCalculatedConsecutiveDays(stats, currentSessionDate: now);
    return stats.copyWith(
      consecutiveDays: calculatedConsecutiveDays,
    );
  }

  ProfileStats calculateCompletedDay(
    ProfileStats stats, { DateTime? currentSessionDate }
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

}
