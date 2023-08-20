import 'package:dhyana/data_provider/all.dart';
import 'package:dhyana/data_provider/session_data_provider.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/session.dart';
import 'package:image/image.dart';

import 'session_repository.dart';

class FirebaseSessionRepository implements SessionRepository {

  final SessionDataProvider sessionDataProvider;
  final ProfileDataProvider profileDataProvider;

  const FirebaseSessionRepository({
    required this.sessionDataProvider,
    required this.profileDataProvider,
  });

  @override
  Future<Session> addSession(Session session, Profile profile) async {
    // Add session
    await sessionDataProvider.addSession(profile.id, session);

    // Make profile stat changes
    // await profileDataProvider.
    return session;
  }

  @override
  Future<List<Session>> getSessions(Profile profile) {
    return sessionDataProvider.getSessions(profile.id);
  }

  Future<void> _incrementConsecutiveDays(
    DateTime lastSessionTime,
    DateTime currentSessionTime,
  ) async {

    bool shouldIncrement =
      lastSessionTime.year == currentSessionTime.year &&
      lastSessionTime.month == currentSessionTime.month &&
      lastSessionTime.day + 1 == currentSessionTime.day;

    // profileDataProvider.



  }

}

