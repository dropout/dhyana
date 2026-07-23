import 'package:dhyana/audio/app_audio_handler.dart';
import 'package:dhyana/data_provider/firebase/tools/firebase_id_generator.dart';
import 'package:dhyana/data_provider/storage_data_provider.dart';
import 'package:dhyana/core/domain/service/analytics_service.dart';
import 'package:dhyana/service/cache_manager_service.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/service/default/default_cache_manager_service.dart';
import 'package:dhyana/core/infrastructure/platform/default_haptics_service.dart';
import 'package:dhyana/modules/practice/chanting/infrastructure/default_lyrics_service.dart';
import 'package:dhyana/service/default/default_mindful_minutes_service.dart';
import 'package:dhyana/service/default/default_overlay_service.dart';
import 'package:dhyana/core/infrastructure/platform/default_resource_resolver.dart';
import 'package:dhyana/service/default/default_safe_image_detector.dart';
import 'package:dhyana/core/infrastructure/platform/default_shader_service.dart';
import 'package:dhyana/core/infrastructure/platform/default_wakelock_service.dart';
import 'package:dhyana/service/default/shared_preferences_service_default.dart';
import 'package:dhyana/core/infrastructure/firebase/firebase_analytics_service.dart';
import 'package:dhyana/core/infrastructure/firebase/firebase_crashlytics_service.dart';
import 'package:dhyana/core/infrastructure/firebase/firebase_functions_service.dart';
import 'package:dhyana/core/infrastructure/firebase/firebase_remote_settings_service.dart';
import 'package:dhyana/core/domain/service/functions_service.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/core/domain/service/id_generator_service.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/lyrics_service.dart';
import 'package:dhyana/service/mindful_minutes_service.dart';
import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/core/domain/service/remote_settings_service.dart';
import 'package:dhyana/core/domain/service/resource_resolver.dart';
import 'package:dhyana/service/safe_image_detector.dart';
import 'package:dhyana/core/domain/service/shader_service.dart';
import 'package:dhyana/service/shared_preferences_service.dart';
import 'package:dhyana/core/domain/service/wakelock_service.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:dhyana/util/launch_url.dart';
import 'package:flutter_mindful_minutes/flutter_mindful_minutes.dart';
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
  final CacheManagerService cacheManagerService;
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
    required this.cacheManagerService,
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

  late OverlayService _overlayService;
  late HapticsService _hapticsService;
  late AnalyticsService _analyticsService;
  late CrashlyticsService _crashlyticsService;
  late RemoteSettingsService _remoteConfigService;
  late ResourceResolver _resourceResolver;
  late IdGeneratorService _idGeneratorService;
  late CacheManagerService _cacheManagerService;
  late WakelockService _wakelockService;
  late SharedPreferencesService _sharedPreferencesService;
  late ShaderService _shaderService;
  late FunctionsService _functionsService;
  late UrlLauncher _urlLauncher;
  late LyricsService _lyricsService;
  late AppAudioHandler _audioHandler;
  late MindfulMinutesService _mindfulMinutesService;
  late SafeImageDetectorFactory _safeImageDetectorFactory;

  ServicesBuilder({
    required FirebaseProvider firebaseProvider,
    required StorageDataProvider storageDataProvider,
    required SharedPreferences sharedPreferences,
    required AppAudioHandler audioHandler,
  }) {
    _audioHandler = audioHandler;
    _overlayService = DefaultOverlayService();
    _hapticsService = DefaultHapticsService();
    _analyticsService = FirebaseAnalyticsService(
      firebaseProvider.analytics,
    );
    _crashlyticsService = FirebaseCrashlyticsService(
      firebaseProvider.crashlytics,
    );
    _idGeneratorService = IdGeneratorService(
      FirebaseIdGenerator(firebaseProvider.firestore),
    );
    _resourceResolver = DefaultResourceResolver(
      storageDataProvider: storageDataProvider,
    );
    _cacheManagerService = DefaultCacheManagerService();
    _wakelockService = DefaultWakelockService();

    _remoteConfigService = FirebaseRemoteSettingsService(
      firebaseProvider.remoteConfig,
    );

    _sharedPreferencesService = DefaultSharedPreferencesService(
      sharedPreferences
    );

    _shaderService = DefaultShaderService();
    _functionsService = FirebaseFunctionsService(
      fbFunctions: firebaseProvider.functions,
    );
    _urlLauncher = const UrlLauncher();
    _lyricsService = DefaultLyricsService();
    _mindfulMinutesService = DefaultMindfulMinutesService(
      flutterMindfulMinutes: FlutterMindfulMinutes(),
    );
    _safeImageDetectorFactory = const DefaultSafeImageDetectorFactory();
  }

  Services build() {
    return Services(
      overlayService: _overlayService,
      hapticsService: _hapticsService,
      analyticsService: _analyticsService,
      crashlyticsService: _crashlyticsService,
      remoteSettingsService: _remoteConfigService,
      resourceResolver: _resourceResolver,
      idGeneratorService: _idGeneratorService,
      cacheManagerService: _cacheManagerService,
      wakelockService: _wakelockService,
      sharedPreferencesService: _sharedPreferencesService,
      shaderService: _shaderService,
      functionsService: _functionsService,
      urlLauncher: _urlLauncher,
      lyricsService: _lyricsService,
      audioHandler: _audioHandler,
      mindfulMinutesService: _mindfulMinutesService,
      safeImageDetectorFactory: _safeImageDetectorFactory,
    );
  }

}
