import 'package:firebase_provider/firebase_provider.dart';

import 'package:core/src/service/crashlytics_service.dart';


class FirebaseCrashlyticsService implements CrashlyticsService {

  final FirebaseCrashlytics _crashlytics;

  FirebaseCrashlyticsService(FirebaseCrashlytics crashlytics) :
        _crashlytics = crashlytics;

  @override
  void recordError({
    required dynamic exception,
    StackTrace? stackTrace,
    String? reason
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
