import 'package:core/src/service/crashlytics_service.dart';
import 'package:core/src/util/logger_mixin.dart';


class LoggingCrashlyticsService with LoggerMixin implements CrashlyticsService {

  @override
  void recordError({
    required dynamic exception,
    StackTrace? stackTrace,
    String? reason,
  }) {
    logger.e(reason, error: exception, stackTrace: stackTrace);
  }

  @override
  void log(String message) {
    logger.w(message);
  }

  @override
  void setUserId(String userId) {
    logger.t('Setting crashlytics userid: $userId');
  }

}
