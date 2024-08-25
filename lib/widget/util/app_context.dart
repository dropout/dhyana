import 'package:dhyana/service/analytics_service.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension AppContext on BuildContext {

  void hapticsTap() {
    HapticsService hapticsService = Provider.of<HapticsService>(this, listen: false);
    hapticsService.tap();
  }

  void logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) {
    Provider.of<AnalyticsService>(this, listen: false).logEvent(
      name: name,
      parameters: parameters
    );
  }

  void recordError(Object? error, StackTrace? stackTrace, String? reason) {
    Provider.of<CrashlyticsService>(this, listen: false).recordError(
      exception: error,
      stackTrace: stackTrace,
      reason: reason,
    );
  }

}
