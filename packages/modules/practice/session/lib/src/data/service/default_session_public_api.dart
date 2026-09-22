import 'package:session/src/data/mapper/session_mapper.dart';
import 'package:session/src/domain/repository/session_repository.dart';
import 'package:session/src/public/api/session_public_api.dart';
import 'package:session/src/public/model/session.dart';

class DefaultSessionPublicApi({
  required final SessionRepository sessionRepository,
}) implements SessionPublicApi {  

  @override
  Future<void> saveSession(String profileId, Session session) async =>
    sessionRepository.create(profileId, session.toDomain());

}
