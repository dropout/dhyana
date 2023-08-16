import 'package:dhyana/model/session.dart';

abstract interface class SessionRepository {

  Future<Session> addSession(String profileId, Session session);
  Future<List<Session>> getSessions(String profileId);

}
