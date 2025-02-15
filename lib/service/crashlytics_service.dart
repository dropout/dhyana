abstract class CrashlyticsService {

  void recordError({
    required dynamic exception,
    StackTrace? stackTrace,
    String? reason,
  });

  void log(String message);
  void setUserId(String userId);

}
