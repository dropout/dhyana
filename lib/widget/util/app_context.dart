import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/init/all.dart';
import 'package:dhyana/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension AppContext on BuildContext {

  void hapticsTap() => services.hapticsService.tap();

  void logEvent({
    required String name,
    Map<String, Object>? parameters,
  }) => services.analyticsService.logEvent(
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
    Provider.of<Services>(this, listen: false);

  Repositories get repos =>
    Provider.of<Repositories>(this, listen: false);

  InitResult get initResult =>
    Provider.of<InitResult>(this, listen: false);

  bool get isSignedIn {
    AuthBloc authBloc = Provider.of<AuthBloc>(this, listen: false);
    return (authBloc.state is AuthStateSignedIn);
  }

  AppLocalizations get localizations =>
    AppLocalizations.of(this);

  ThemeData get theme =>
    Theme.of(this);

}
