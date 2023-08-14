import 'package:firebase_analytics/firebase_analytics.dart';

import 'analytics_service.dart';

class FirebaseAnalyticsService extends AnalyticsService {

  final FirebaseAnalytics analytics;

  FirebaseAnalyticsService(this.analytics);

  @override
  void logEvent({required String name, Map<String, dynamic>? parameters}) {
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
