import 'package:dhyana/core/domain/entity/session.dart';

abstract interface class InsightsService {
  Future<void> logSessionStatistics(String profileId, Session session);
}