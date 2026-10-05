import 'package:session/src/public/model/session.dart';

abstract class SessionPublicApi {
  Future<void> saveSession(String profileId, Session session);
}
