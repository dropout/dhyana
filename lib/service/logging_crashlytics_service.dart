import 'package:logger/logger.dart';
import 'package:dhyana/util/logger_factory.dart';

import 'crashlytics_service.dart';

class LoggingCrashlyticsService implements CrashlyticsService {

  final Logger logger = getLogger('LoggingCrashlyticsService');

  @override
  void recordError({required dynamic exception, required StackTrace stackTrace, required String reason}) {
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
