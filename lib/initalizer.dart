import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/service/all.dart';
import 'package:dhyana/services.dart';
import 'package:dhyana/util/logger_factory.dart';

import 'model/timer_settings.dart';

/*
  Manages the initialization process.
  Creates and configures providers, services and all the necessary objects used
  in the application.
 */
class Initializer {

  Logger logger = getLogger('Initializer');

  Future<InitResult> init() async {
    logger.v('Starting initialization sequence');

    logger.v('Initialize services');
    Services services = Services(
      TimerSettingsSharedPrefsService(
        crashlyticsService: LoggingCrashlyticsService(),
        sharedPrefs: SharedPreferences.getInstance()
      )
    );

    logger.v('Initialize providers');
    List<Provider> providers = createProviders(
      services,
    );

    logger.v('Parsing timer settings from shared prefs');
    TimerSettings timerSettings = await services.timerSettingsSharedPrefsService.getTimerSettings();

    return InitResult(
      timerSettings,
      services,
      providers,
    );
  }

  /*
    Create a list of providers that will be used
    throughout the application.
   */
  List<Provider> createProviders(
    Services srvcs,
  ) {
    return [
    ];
  }

}

class InitResult {

  final TimerSettings timerSettings;
  final Services services;
  final List<Provider> providers;

  InitResult(
    this.timerSettings,
    this.services,
    this.providers,
  );

}
