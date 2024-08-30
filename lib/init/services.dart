import 'package:dhyana/service/all.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/service/shader_service.dart';

class Services {

  final AnalyticsService analyticsService;
  final CrashlyticsService crashlyticsService;
  final TimerSettingsSharedPrefsService timerSettingsSharedPrefsService;
  final ShaderService shaderService;
  final HapticsService hapticsService;
  final ResourceResolver resourceResolver;

  const Services({
    required this.analyticsService,
    required this.crashlyticsService,
    required this.timerSettingsSharedPrefsService,
    required this.resourceResolver,
    required this.shaderService,
    required this.hapticsService,
  });

}
