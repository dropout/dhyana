import 'package:firebase_crashlytics/firebase_crashlytics.dart';

import 'crashlytics_service.dart';

class FirebaseCrashlyticsService extends CrashlyticsService {

  final FirebaseCrashlytics _crashlytics;

  FirebaseCrashlyticsService(FirebaseCrashlytics crashlytics) :
        _crashlytics = crashlytics;

  @override
  void recordError({
    required dynamic exception,
    required StackTrace stackTrace,
    required String reason
  }) {
    _crashlytics.recordError(
        exception,
        stackTrace,
        reason: reason
    );
  }

  @override
  void log(String message) {
    _crashlytics.log(message);
  }

  @override
  void setUserId(String userId) {
    _crashlytics.setUserIdentifier(userId);
  }

}
