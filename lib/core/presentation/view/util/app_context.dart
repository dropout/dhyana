import 'package:dhyana/core/bootstrap/init_result.dart';
import 'package:dhyana/core/di/repositories.dart';
import 'package:dhyana/core/di/services.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension AppContext on BuildContext {

  void hapticsTap() =>
    services.hapticsService.tap();

  void logEvent({required String name, Map<String, Object>? parameters}) =>
    services.analyticsService.logEvent(
      name: name,
      parameters: parameters
    );

  void recordError(Object? error, StackTrace? stackTrace, String? reason) =>
    services.crashlyticsService.recordError(
      exception: error,
      stackTrace: stackTrace,
      reason: reason,
    );

  Services get services =>
    read<Services>();

  Repositories get repos =>
    read<Repositories>();

  InitResult get initResult =>
    read<InitResult>();

  AppLocalizations get l10n =>
    AppLocalizations.of(this);

  ThemeData get theme =>
    Theme.of(this);

}
