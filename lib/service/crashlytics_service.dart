abstract class CrashlyticsService {

  void recordError({
    required dynamic exception,
    required StackTrace stackTrace,
    required String reason,
  });

  void log(String message);
  void setUserId(String userId);

}
