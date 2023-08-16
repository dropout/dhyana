import 'package:dhyana/model/session.dart';

abstract interface class SessionDataProvider {

  Future<Session> addSession(String profileId, Session session);
  Future<List<Session>> getSessions(String profileId);

}
