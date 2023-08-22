import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/data_provider/session_data_provider.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_stats.dart';
import 'package:dhyana/model/session.dart';

import 'session_repository.dart';

class FirebaseSessionRepository implements SessionRepository {

  final SessionDataProvider sessionDataProvider;
  final ProfileDataProvider profileDataProvider;

  const FirebaseSessionRepository({
    required this.sessionDataProvider,
    required this.profileDataProvider,
  });

  @override
  Future<Session> addSession(String profileId, Session session) async {

    // Add session
    await sessionDataProvider.addSession(profileId, session);

    // Make profile stat changes
    Profile profile = await profileDataProvider.getItemById(profileId);
    ProfileStats stats = profile.stats;
    Profile newProfile = profile.copyWith(
      stats: profile.stats.copyWith(
        lastSessionDate: session.startTime,
        completedMinutesCount: stats.completedMinutesCount + session.duration.inMinutes,
        completedSessionsCount: stats.completedSessionsCount + 1,
      )
    );

    await profileDataProvider.setItem(newProfile);

    return session;
  }

  @override
  Future<List<Session>> getSessions(String profileId) {
    return sessionDataProvider.getSessions(profileId);
  }

  Future<void> _calculateConsecutiveDays(
    DateTime lastSessionTime,
    DateTime currentSessionTime,
  ) async {

    bool shouldIncrement =
      lastSessionTime.year == currentSessionTime.year &&
      lastSessionTime.month == currentSessionTime.month &&
      lastSessionTime.day + 1 == currentSessionTime.day;

    if (shouldIncrement) {

    }



  }

}

