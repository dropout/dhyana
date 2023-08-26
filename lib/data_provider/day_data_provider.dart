import 'package:dhyana/model/day.dart';
import 'package:dhyana/model/session.dart';

abstract interface class DayDataProvider {

  Future<Session> addSessionToDay(String profileId, Session session);
  Future<Day> getDay(String profileId, DateTime day);
  Future<List<Day>> getDays(String profileId, DateTime from, DateTime to);
  Stream<List<Day>> getDaysStream(String profileId, DateTime from, DateTime to);

}
