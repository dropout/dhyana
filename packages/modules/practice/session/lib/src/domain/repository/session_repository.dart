import 'package:session/src/domain/entity/session_entity.dart';

abstract interface class SessionRepository {

  Future<void> create(String profileId, SessionEntity model);
  Future<SessionEntity> read(String profileId, String id);
  Stream<SessionEntity> readStream(String profileId, String id);
  Future<void> update(String profileId, SessionEntity model);
  Future<void> delete(String profileId, String sessionId);

  Future<List<SessionEntity>> query(String profileId, {int limit = 20});
  Stream<List<SessionEntity>> queryStream(String profileId, {int limit = 20});

}
