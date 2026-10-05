import 'package:core/src/service/analytics_service.dart';
import 'package:material_ui/material_ui.dart';


class LoggingAnalyticsService implements AnalyticsService {

  @override
  void logEvent({required String name, Map<String, dynamic>? parameters}) {
    debugPrint('---');
    debugPrint('Analytics event: $name');
    debugPrint(parameters.toString());
    debugPrint('---');
  }

  @override
  void logAppOpen() {
    debugPrint('Analytics app open event');
  }

  @override
  void setUserId(String userId) {
    debugPrint('Setting analytics user id');
  }

}