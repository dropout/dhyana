import 'package:dhyana/init/all.dart';
import 'package:dhyana/service/analytics_service.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension AppContext on BuildContext {

  void hapticsTap() {
    Services services = Provider.of<Services>(this, listen: false);
    services.hapticsService.tap();
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

  Services get services {
    return Provider.of<Services>(this, listen: false);
  }

  Repositories get repos {
    return Provider.of<Repositories>(this, listen: false);
  }

}
