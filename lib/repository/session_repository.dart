import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/session.dart';

abstract interface class SessionRepository {

  Future<Session> addSession(Session session, Profile profile);
  Future<List<Session>> getSessions(Profile profile);

}
