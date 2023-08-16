import 'package:dhyana/data_provider/session_data_provider.dart';
import 'package:dhyana/model/session.dart';

import 'session_repository.dart';

class FirebaseSessionRepository implements SessionRepository {

  final SessionDataProvider sessionDataProvider;

  const FirebaseSessionRepository({
    required this.sessionDataProvider,
  });

  @override
  Future<Session> addSession(String profileId, Session session) {
    return sessionDataProvider.addSession(profileId, session);
  }

  @override
  Future<List<Session>> getSessions(String profileId) {
    return sessionDataProvider.getSessions(profileId);
  }

}

