import 'package:firebase_analytics/firebase_analytics.dart';

import 'package:dhyana/service/analytics_service.dart';

class FirebaseAnalyticsService implements AnalyticsService {

  final FirebaseAnalytics analytics;

  FirebaseAnalyticsService(this.analytics);

  @override
  void logEvent({required String name, Map<String, Object>? parameters}) {
    analytics.logEvent(
      name: name,
      parameters: parameters,
    );
  }

  @override
  void logAppOpen() {
    analytics.logAppOpen();
  }

  @override
  void setUserId(String userId) {
    analytics.setUserId(
      id: userId,
    );
  }

}
