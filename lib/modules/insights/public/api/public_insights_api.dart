import 'package:dhyana/modules/insights/public/model/insights_session.dart';

abstract interface class PublicInsightsApi {
  Future<void> logSessionStatistics(String profileId, InsightsSession session);
}
