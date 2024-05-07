import 'package:dhyana/service/all.dart';
import 'package:dhyana/service/resource_resolver.dart';

class Services {

  final AnalyticsService analyticsService;
  final CrashlyticsService crashlyticsService;
  final TimerSettingsSharedPrefsService timerSettingsSharedPrefsService;
  final ResourceResolver resourceResolver;

  const Services({
    required this.analyticsService,
    required this.crashlyticsService,
    required this.timerSettingsSharedPrefsService,
    required this.resourceResolver,
  });

}
