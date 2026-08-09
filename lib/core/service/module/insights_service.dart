import 'package:dhyana/modules/practice/session/public/model/session.dart';

abstract interface class InsightsService {
  Future<void> logSessionStatistics(String profileId, Session session);
}