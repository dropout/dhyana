import 'package:dhyana/util/logger_mixin.dart';

import 'crashlytics_service.dart';

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
