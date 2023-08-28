import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_stats.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/util/date_time.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:logger/logger.dart';

import 'session_repository.dart';

class FirebaseSessionRepository implements SessionRepository {

  Logger logger = getLogger('FirebaseSessionRepository');

  final SessionDataProvider sessionDataProvider;
  final ProfileDataProvider profileDataProvider;
  final DayDataProvider dayDataProvider;

  FirebaseSessionRepository({
    required this.sessionDataProvider,
    required this.profileDataProvider,
    required this.dayDataProvider,
  });

  @override
  Future<Session> addSession(String profileId, Session session) async {

    // Add session
    await sessionDataProvider.addSession(profileId, session);
    logger.v('Session saved');

    // Add Day
    await dayDataProvider.addSessionToDay(profileId, session);
    logger.v('Day saved');

    // Make profile stat changes
    Profile profile = await profileDataProvider.getItemById(profileId);
    ProfileStats stats = profile.stats;
    logger.v('Profile loaded');

    // Calculate consecutive days
    if (stats.lastSessionDate != null) {
      stats = _calculateConsecutiveDays(
        stats,
        stats.lastSessionDate!,
        session.startTime,
      );
    } else {
      logger.v('There were no last session, skipping consecutive days calculation.');
    }

    // Calculate completed days
    if (stats.lastSessionDate == null) {
      stats = stats.copyWith(
        completedDaysCount: stats.completedDaysCount + 1,
      );
      logger.v('Incrementing completed days (first day case)');
    } else {
      stats = _calculateCompletedDay(
        stats,
        stats.lastSessionDate!,
        session.startTime,
      );
    }

    // Add session results to generic statistics data
    stats = stats.copyWith(
      lastSessionDate: session.startTime,
      completedMinutesCount: stats.completedMinutesCount + session.duration.inMinutes,
      completedSessionsCount: stats.completedSessionsCount + 1,
    );

    Profile newProfile = profile.copyWith(
      stats: stats
    );
    await profileDataProvider.setItem(newProfile);
    logger.v('Profile saved with new stats: $stats');

    return session;
  }

  @override
  Future<List<Session>> getSessions(String profileId) {
    return sessionDataProvider.getSessions(profileId);
  }

  ProfileStats _calculateConsecutiveDays(
    ProfileStats stats,
    DateTime lastSessionTime,
    DateTime currentSessionTime,
  ) {

    // Case 1:
    // When the last session was on the day before yesterday or earlier
    // value should be set to 0 since the user missed a day and consecutive
    // days are broken
    bool shouldReset =
      lastSessionTime.year == currentSessionTime.year &&
      lastSessionTime.month == currentSessionTime.month &&
      lastSessionTime.day + 1 < currentSessionTime.day;

    if (shouldReset) {
      logger.v('Reset consecutive days counting. Last: ${lastSessionTime.toDayId()} | Current: ${currentSessionTime.toDayId()}');
      return stats.copyWith(
        consecutiveDays: 0,
      );
    }

    // Case 2:
    // When the last session was on yesterday, value should be incremented by 1
    bool shouldIncrement =
      lastSessionTime.year == currentSessionTime.year &&
      lastSessionTime.month == currentSessionTime.month &&
      lastSessionTime.day + 1 == currentSessionTime.day;

    if (shouldIncrement) {
      logger.v('Incrementing consecutive days. Last: ${lastSessionTime.toDayId()} | Current: ${currentSessionTime.toDayId()}');
      return stats.copyWith(
        consecutiveDays: stats.consecutiveDays + 1,
      );
    } else {
      logger.v('Not incrementing consecutive days. Last: ${lastSessionTime.toDayId()} | Current: ${currentSessionTime.toDayId()}');
      return stats;
    }
  }

  ProfileStats _calculateCompletedDay(
    ProfileStats stats,
    DateTime lastSessionTime,
    DateTime currentSessionTime,
  ) {
    bool sameDay =
      lastSessionTime.year == currentSessionTime.year &&
      lastSessionTime.month == currentSessionTime.month &&
      lastSessionTime.day == currentSessionTime.day;

    if (sameDay) {
      logger.v('Not incrementing completed days, it\'s the same day. Last: ${lastSessionTime.toDayId()} | Current: ${currentSessionTime.toDayId()}');
      return stats;
    }

    logger.v('Incrementing completed days Last: ${lastSessionTime.toDayId()} | Current: ${currentSessionTime.toDayId()}');
    return stats.copyWith(
      completedDaysCount: stats.completedDaysCount + 1,
    );
  }

}
