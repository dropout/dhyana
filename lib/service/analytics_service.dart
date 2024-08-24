abstract class AnalyticsService {

  void logEvent({
    required String name,
    Map<String, Object>? parameters,
  });

  void logAppOpen();
  void setUserId(String userId);

}
