import 'package:get_it/get_it.dart';

import 'package:dhyana/core/service/analytics_service.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/service/functions_service.dart';
import 'package:dhyana/core/service/haptics_service.dart';
import 'package:dhyana/core/service/mindful_minutes_service.dart';
import 'package:dhyana/core/service/overlay_service.dart';
import 'package:dhyana/core/service/remote_settings_service.dart';
import 'package:dhyana/core/service/resource_resolver.dart';
import 'package:dhyana/core/service/shader_service.dart';
import 'package:dhyana/core/service/wakelock_service.dart';
import 'package:dhyana/core/util/launch_url.dart';

import 'package:dhyana/modules/profile/domain/service/safe_image_detector.dart';
import 'package:dhyana/modules/profile/data/service/default_safe_image_detector.dart';


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

      shaderService: GetIt.I.get<ShaderService>(),
      functionsService: GetIt.I.get<FunctionsService>(),
      urlLauncher: _urlLauncher,
      mindfulMinutesService: GetIt.I.get<MindfulMinutesService>(),
      safeImageDetectorFactory: _safeImageDetectorFactory,
    );
  }
}
