import 'package:core/src/infrastructure/platform/default_safe_image_detector.dart';
import 'package:core/src/navigator/donate_navigator.dart';
import 'package:core/src/navigator/stats_navigator.dart';
import 'package:core/src/service/safe_image_detector.dart';
import 'package:get_it/get_it.dart';

import 'package:core/src/navigator/auth_navigator.dart';
import 'package:core/src/navigator/home_navigator.dart';
import 'package:core/src/navigator/profile_navigator.dart';
import 'package:core/src/navigator/session_navigator.dart';
import 'package:core/src/navigator/social_navigator.dart';
import 'package:core/src/navigator/timer_navigator.dart';

import 'package:core/src/service/analytics_service.dart';
import 'package:core/src/service/crashlytics_service.dart';
import 'package:core/src/service/functions_service.dart';
import 'package:core/src/service/haptics_service.dart';
import 'package:core/src/service/mindful_minutes_service.dart';
import 'package:core/src/service/overlay_service.dart';
import 'package:core/src/service/remote_settings_service.dart';
import 'package:core/src/service/resource_resolver.dart';
import 'package:core/src/service/shader_service.dart';
import 'package:core/src/service/wakelock_service.dart';

import 'package:core/src/util/launch_url.dart';


/// A container for services exposed to the UI.
class Services {

  final AnalyticsService analyticsService;
  final CrashlyticsService crashlyticsService;
  final HapticsService hapticsService;
  final RemoteSettingsService remoteSettingsService;
  final ResourceResolver resourceResolver;

  final ShaderService shaderService;
  final OverlayService overlayService;
  final WakelockService wakelockService;
  final FunctionsService functionsService;
  final UrlLauncher urlLauncher;
  final MindfulMinutesService mindfulMinutesService;  

  final HomeNavigator homeNavigator;
  final ProfileNavigator profileNavigator;
  final AuthNavigator authNavigator;
  final SessionNavigator sessionNavigator;
  final SocialNavigator socialNavigator;
  final TimerNavigator timerNavigator;
  final StatsNavigator statsNavigator;
  final DonateNavigator donateNavigator;

  final SafeImageDetectorFactory safeImageDetectorFactory;

  Services({
    required this.analyticsService,
    required this.crashlyticsService,
    required this.hapticsService,
    required this.remoteSettingsService,
    required this.resourceResolver,
    required this.shaderService,
    required this.overlayService,
    required this.wakelockService,
    required this.functionsService,
    required this.urlLauncher,
    required this.mindfulMinutesService,
    required this.safeImageDetectorFactory,
    
    required this.homeNavigator,
    required this.profileNavigator,
    required this.authNavigator,
    required this.sessionNavigator,
    required this.socialNavigator,
    required this.timerNavigator,
    required this.statsNavigator,
    required this.donateNavigator,
  });
}

class ServicesBuilder {
  late UrlLauncher _urlLauncher;
  late SafeImageDetectorFactory _safeImageDetectorFactory;

  ServicesBuilder() {
    _urlLauncher = const UrlLauncher();
    //TODO: Revisit how safe image detector factory is used, aim to remove it from services
    _safeImageDetectorFactory = const DefaultSafeImageDetectorFactory();
  }

  Services build() {
    return Services(
      overlayService: GetIt.I.get<OverlayService>(),
      hapticsService: GetIt.I.get<HapticsService>(),
      analyticsService: GetIt.I.get<AnalyticsService>(),
      crashlyticsService: GetIt.I.get<CrashlyticsService>(),
      remoteSettingsService: GetIt.I.get<RemoteSettingsService>(),
      resourceResolver: GetIt.I.get<ResourceResolver>(),
      wakelockService: GetIt.I.get<WakelockService>(),

      homeNavigator: GetIt.I.get<HomeNavigator>(),
      profileNavigator: GetIt.I.get<ProfileNavigator>(),
      authNavigator: GetIt.I.get<AuthNavigator>(),
      sessionNavigator: GetIt.I.get<SessionNavigator>(),
      socialNavigator: GetIt.I.get<SocialNavigator>(),
      timerNavigator: GetIt.I.get<TimerNavigator>(),
      statsNavigator: GetIt.I.get<StatsNavigator>(),
      donateNavigator: GetIt.I.get<DonateNavigator>(),

      shaderService: GetIt.I.get<ShaderService>(),
      functionsService: GetIt.I.get<FunctionsService>(),
      urlLauncher: _urlLauncher,
      mindfulMinutesService: GetIt.I.get<MindfulMinutesService>(),
      
      safeImageDetectorFactory: _safeImageDetectorFactory,
    );
  }
}
