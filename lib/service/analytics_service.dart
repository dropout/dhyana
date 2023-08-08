abstract class AnalyticsService {

  void logEvent({
    required String name,
    Map<String, dynamic>? parameters,
  });

  void logAppOpen();
  void setUserId(String userId);

}
