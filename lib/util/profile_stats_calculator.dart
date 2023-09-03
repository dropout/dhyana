import 'package:dhyana/model/profile_stats.dart';
import 'package:dhyana/util/all.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:logger/logger.dart';

final Logger _logger = getLogger('ProfileMetricsCalculator');

ProfileStats calculateConsecutiveDays(
  ProfileStats stats,
  DateTime currentSessionDate,
) {

  // Case 0:
  // Last session is null, so this is the first day, nothing to calculate
  if (stats.lastSessionDate == null) {
    _logger.v('There were no last session, skipping consecutive days calculation.');
    return stats;
  }

  DateTime lastSessionDate = stats.lastSessionDate!;

  // Case 1:
  // When the last session was on the day before yesterday or earlier
  // value should be set to 0 since the user missed a day and consecutive
  // days are broken
  bool shouldReset = currentSessionDate.isBeforePreviousDay(lastSessionDate);
  if (shouldReset) {
    _logger.v('Reset consecutive days counting. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
    return stats.copyWith(
      consecutiveDays: 0,
    );
  }

  // Case 2:
  // When the last session was on yesterday, value should be incremented by 1
  bool isPreviousDay = currentSessionDate.isPreviousDay(lastSessionDate);

  if (isPreviousDay) {
    _logger.v('Incrementing consecutive days. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
    return stats.copyWith(
      consecutiveDays: stats.consecutiveDays + 1,
    );
  } else {
    // Case 3:
    // The session is on the same day, so no need to increment or reset
    _logger.v('Not incrementing consecutive days. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionDate.toDayId()}');
    return stats;
  }
}

ProfileStats calculateCompletedDay(
  ProfileStats stats,
  DateTime currentSessionTime,
) {
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
  bool sameDay = currentSessionTime.isSameDay(lastSessionDate);
  if (sameDay) {
    _logger.v('Not incrementing completed days, it\'s the same day. Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionTime.toDayId()}');
    return stats;
  }

  // Case 2:
  // If its not the the same day as the last session completed days
  // should increment
  _logger.v('Incrementing completed days Last: ${lastSessionDate.toDayId()} | Current: ${currentSessionTime.toDayId()}');
  return stats.copyWith(
    completedDaysCount: stats.completedDaysCount + 1,
  );
}
