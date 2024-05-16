import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_stats.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/session_query_options.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:dhyana/util/profile_stats_calculator.dart';
import 'package:logger/logger.dart';
import 'package:dhyana/repository/session_repository.dart';

class FirebaseSessionRepository implements SessionRepository {

  Logger logger = getLogger('FirebaseSessionRepository');

  final FirebaseFirestore fireStore;
  final ProfileDataProvider profileDataProvider;
  final DayDataProvider dayDataProvider;
  final ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();

  FirebaseSessionRepository({
    required this.fireStore,
    required this.profileDataProvider,
    required this.dayDataProvider,
  });

  @override
  Future<Session> addSession(String profileId, Session session) async {

    // Add session
    SessionDataProvider sessionDataProvider =
      FirebaseSessionDataProvider(fireStore, profileId);
    await sessionDataProvider.create(session);
    logger.t('Session saved');

    // Add Day
    await dayDataProvider.addSessionToDay(profileId, session);
    logger.t('Day saved');

    // Make profile stat changes
    Profile profile = await profileDataProvider.read(profileId);
    ProfileStats updatedStats = profile.stats;
    logger.t('Profile loaded');

    // Calculate consecutive days
    if (updatedStats.lastSessionDate != null) {
      updatedStats = profileStatsCalculator.calculateConsecutiveDays(updatedStats);
    } else {
      logger.t('There were no last session, skipping consecutive days calculation.');
    }

    // Override calculation when adding a session:
    // Minimum value for consecutive days when adding a session is 1
    if (updatedStats.consecutiveDays == 0) {
      updatedStats = updatedStats.copyWith(
        consecutiveDays: 1
      );
    }

    // Calculate completed days
    if (updatedStats.lastSessionDate == null) {
      updatedStats = updatedStats.copyWith(
        completedDaysCount: updatedStats.completedDaysCount + 1,
      );
      logger.t('Incrementing completed days (first day case)');
    } else {
      updatedStats = profileStatsCalculator.calculateCompletedDay(
        updatedStats,
        currentSessionDate: session.startTime,
      );
    }

    // Add session results to stats
    updatedStats = updatedStats.copyWith(
      lastSessionDate: session.startTime,
      completedMinutesCount: updatedStats.completedMinutesCount + session.duration.inMinutes,
      completedSessionsCount: updatedStats.completedSessionsCount + 1,
    );

    Profile newProfile = profile.copyWith(
      stats: updatedStats
    );
    await profileDataProvider.create(newProfile);
    logger.t('Profile saved with new stats: $updatedStats');

    return session;
  }

  @override
  Future<List<Session>> getSessions(String profileId) {
    SessionDataProvider sessionDataProvider =
        FirebaseSessionDataProvider(fireStore, profileId);
    return sessionDataProvider.query(const SessionQueryOptions());
  }

}
