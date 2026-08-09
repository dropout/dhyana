import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/modules/practice/session/domain/entity/session_entity.dart';

abstract interface class SessionDataProvider
    implements DataProvider<SessionEntity> {

  Future<List<SessionEntity>> query({int limit = 20});
  Stream<List<SessionEntity>> queryStream({int limit = 20});

}
