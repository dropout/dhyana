import 'package:dhyana/core/data/datasource/data_provider.dart';
import 'package:dhyana/core/domain/entity/session.dart';

abstract interface class SessionDataProvider
    implements DataProvider<Session> {

  Future<List<Session>> query({int limit = 20});
  Stream<List<Session>> queryStream({int limit = 20});

}
