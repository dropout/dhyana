import 'package:dhyana/core/audio/app_audio_handler.dart';
import 'package:dhyana/core/data/datasource/storage/storage_data_provider.dart';
import 'package:dhyana/core/service/analytics_service.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/modules/practice/chanting/infrastructure/default_lyrics_service.dart';
import 'package:dhyana/modules/profile/data/service/default_safe_image_detector.dart';
import 'package:dhyana/core/service/functions_service.dart';
import 'package:dhyana/core/service/haptics_service.dart';
import 'package:dhyana/core/service/id_generator_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/lyrics_service.dart';
import 'package:dhyana/core/service/mindful_minutes_service.dart';
import 'package:dhyana/core/service/overlay_service.dart';
import 'package:dhyana/core/service/remote_settings_service.dart';
import 'package:dhyana/core/service/resource_resolver.dart';
import 'package:dhyana/modules/profile/domain/service/safe_image_detector.dart';
import 'package:dhyana/core/service/shader_service.dart';
import 'package:dhyana/core/service/shared_preferences_service.dart';
import 'package:dhyana/core/service/wakelock_service.dart';
import 'package:dhyana/core/util/firebase_provider.dart';
import 'package:dhyana/core/util/launch_url.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A container for all services used in the app.
/// Available on the context object via Provider and BuildContext extension
/// convenience methods.
class Services {
  final AnalyticsService analyticsService;
  final CrashlyticsService crashlyticsService;
  final HapticsService hapticsService;
  final RemoteSettingsService remoteSettingsService;
  final ResourceResolver resourceResolver;
  final AppAudioHandler audioHandler;
  final SharedPreferencesService sharedPreferencesService;
  final ShaderService shaderService;
  final IdGeneratorService idGeneratorService;
  final OverlayService overlayService;
  final WakelockService wakelockService;
  final FunctionsService functionsService;
  final UrlLauncher urlLauncher;
  final LyricsService lyricsService;
  final MindfulMinutesService mindfulMinutesService;
  final SafeImageDetectorFactory safeImageDetectorFactory;

  Services({
    required this.analyticsService,
    required this.crashlyticsService,
    required this.hapticsService,
    required this.remoteSettingsService,
    required this.resourceResolver,
    required this.shaderService,
    required this.audioHandler,
    required this.overlayService,
    required this.sharedPreferencesService,
    required this.idGeneratorService,
    required this.wakelockService,
    required this.functionsService,
    required this.urlLauncher,
    required this.lyricsService,
    required this.mindfulMinutesService,
    required this.safeImageDetectorFactory,
  });
}

class ServicesBuilder {
  late UrlLauncher _urlLauncher;
  late LyricsService _lyricsService;
  late MindfulMinutesService _mindfulMinutesService;
  late SafeImageDetectorFactory _safeImageDetectorFactory;

  ServicesBuilder({
    required FirebaseProvider firebaseProvider,
    required StorageDataProvider storageDataProvider,
    required SharedPreferences sharedPreferences,
    required AppAudioHandler audioHandler,
  }) {
    _urlLauncher = const UrlLauncher();
    _lyricsService = DefaultLyricsService();
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
      idGeneratorService: GetIt.I.get<IdGeneratorService>(),
      wakelockService: GetIt.I.get<WakelockService>(),
      sharedPreferencesService: GetIt.I.get<SharedPreferencesService>(),
      shaderService: GetIt.I.get<ShaderService>(),
      functionsService: GetIt.I.get<FunctionsService>(),
      urlLauncher: _urlLauncher,
      lyricsService: _lyricsService,
      audioHandler: GetIt.I.get<AppAudioHandler>(),
      mindfulMinutesService: _mindfulMinutesService,
      safeImageDetectorFactory: _safeImageDetectorFactory,
    );
  }
}
