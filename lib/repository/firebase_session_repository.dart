import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_stats.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:dhyana/util/profile_stats_calculator.dart' as profile_stats_calculator;
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
      stats = profile_stats_calculator.calculateConsecutiveDays(
        stats,
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
      stats = profile_stats_calculator.calculateCompletedDay(
        stats,
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

}
