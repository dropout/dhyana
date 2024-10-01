// import 'package:dhyana/data_provider/all.dart';
// import 'package:dhyana/model/all.dart';
// import 'package:dhyana/repository/crud_repository_operations.dart';
// import 'package:dhyana/util/logger_factory.dart';
// import 'package:logger/logger.dart';
// import 'package:dhyana/repository/session_repository.dart';
//
// class FirebaseSessionRepository
//     implements SessionRepository {
//
//   Logger logger = getLogger('FirebaseSessionRepository');
//
//   final SessionDataProvider sessionDataProvider;
//
//   FirebaseSessionRepository({
//     required this.sessionDataProvider,
//   }) : super(sessionDataProvider);
//
//   @override
//   Future<List<Session>> query(SessionQueryOptions queryOptions) =>
//       sessionDataProvider.query(queryOptions);
//
//   @override
//   Stream<List<Session>> queryStream(SessionQueryOptions queryOptions) =>
//       sessionDataProvider.queryStream(queryOptions);
//
//   // @override
//   // Future<Session> addSession(String profileId, Session session) async {
//   //
//   //   // Create data providers
//   //   SessionDataProvider sessionDataProvider =
//   //     FirebaseSessionDataProvider(fireStore, profileId);
//   //   DayDataProvider dayDataProvider =
//   //     FirebaseDayDataProvider(fireStore, profileId);
//   //
//   //   // Add session
//   //   await sessionDataProvider.create(session);
//   //   logger.t('Session saved');
//   //
//   //   // Add Day
//   //   await dayDataProvider.logSession(session);
//   //   logger.t('Day saved');
//   //
//   //   // Make profile stat changes
//   //   Profile profile = await profileDataProvider.read(profileId);
//   //   ProfileStatisticsReport updatedStatsReport = profile.statsReport;
//   //   logger.t('Profile loaded');
//   //
//   //   // Calculate consecutive days
//   //   if (updatedStatsReport.lastSessionDate != null) {
//   //     updatedStatsReport = profileStatsCalculator.calculateConsecutiveDays(updatedStatsReport);
//   //   } else {
//   //     logger.t('There were no last session, skipping consecutive days calculation.');
//   //   }
//   //
//   //   // Override calculation when adding a session:
//   //   // Minimum value for consecutive days when adding a session is 1
//   //   if (updatedStatsReport.consecutiveDays == 0) {
//   //     updatedStatsReport = updatedStatsReport.copyWith(
//   //       consecutiveDays: 1
//   //     );
//   //   }
//   //
//   //   // Calculate completed days
//   //   if (updatedStatsReport.lastSessionDate == null) {
//   //     updatedStatsReport = updatedStatsReport.copyWith(
//   //       completedDaysCount: updatedStatsReport.completedDaysCount + 1,
//   //     );
//   //     logger.t('Incrementing completed days (first day case)');
//   //   } else {
//   //     updatedStatsReport = profileStatsCalculator.calculateCompletedDay(
//   //       updatedStatsReport,
//   //       currentSessionDate: session.startTime,
//   //     );
//   //   }
//   //
//   //   // Add session results to stats
//   //   updatedStatsReport = updatedStatsReport.copyWith(
//   //     lastSessionDate: session.startTime,
//   //     completedMinutesCount: updatedStatsReport.completedMinutesCount + session.duration.inMinutes,
//   //     completedSessionsCount: updatedStatsReport.completedSessionsCount + 1,
//   //   );
//   //
//   //   Profile newProfile = profile.copyWith(
//   //     statsReport: updatedStatsReport
//   //   );
//   //   await profileDataProvider.create(newProfile);
//   //   logger.t('Profile saved with new stats: $updatedStatsReport');
//   //
//   //   return session;
//   // }
//   //
//   // @override
//   // Future<List<Session>> getSessions(String profileId) {
//   //   SessionDataProvider sessionDataProvider =
//   //       FirebaseSessionDataProvider(fireStore, profileId);
//   //   return sessionDataProvider.query(const SessionQueryOptions());
//   // }
//
// }
