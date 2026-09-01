import 'package:firebase_provider/firebase_provider.dart';
import 'package:core/src/service/analytics_service.dart';


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
