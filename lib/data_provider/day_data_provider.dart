import 'package:dhyana/model/all.dart';

abstract interface class DayDataProvider {

  Future<Session> addSession(Session session);
  Future<List<Day>> query(DayQueryOptions queryOptions);
  Stream<List<Day>> queryStream(DayQueryOptions queryOptions);

}
