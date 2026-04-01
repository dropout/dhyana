import 'package:dhyana/data_provider/firebase/firebase_id_generator.dart';
import 'package:dhyana/data_provider/storage_data_provider.dart';
import 'package:dhyana/service/analytics_service.dart';
import 'package:dhyana/service/audio_service.dart';
import 'package:dhyana/service/cache_manager_service.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/default/audio_handler_audio_service.dart';
import 'package:dhyana/service/default/default_cache_manager_service.dart';
import 'package:dhyana/service/default/dhyana_audio_handler.dart';
import 'package:dhyana/service/default/default_haptics_service.dart';
import 'package:dhyana/service/default/default_lyrics_service.dart';
import 'package:dhyana/service/default/default_overlay_service.dart';
import 'package:dhyana/service/default/default_resource_resolver.dart';
import 'package:dhyana/service/default/default_shader_service.dart';
import 'package:dhyana/service/default/default_wakelock_service.dart';
import 'package:dhyana/service/default/shared_preferences_service_default.dart';
import 'package:dhyana/service/firebase/firebase_analytics_service.dart';
import 'package:dhyana/service/firebase/firebase_crashlytics_service.dart';
import 'package:dhyana/service/firebase/firebase_functions_service.dart';
import 'package:dhyana/service/firebase/firebase_remote_settings_service.dart';
import 'package:dhyana/service/functions_service.dart';
import 'package:dhyana/service/haptics_service.dart';
import 'package:dhyana/service/id_generator_service.dart';
import 'package:dhyana/service/lyrics_service.dart';
import 'package:dhyana/service/overlay_service.dart';
import 'package:dhyana/service/remote_settings_service.dart';
import 'package:dhyana/service/resource_resolver.dart';
import 'package:dhyana/service/shader_service.dart';
import 'package:dhyana/service/shared_preferences_service.dart';
import 'package:dhyana/service/timer_settings_shared_prefs_service.dart';
import 'package:dhyana/service/wakelock_service.dart';
import 'package:dhyana/util/firebase_provider.dart';
import 'package:dhyana/util/launch_url.dart';
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
  final AudioService audioService;
  final TimerSettingsSharedPrefsService timerSettingsSharedPrefsService;
  final SharedPreferencesService sharedPreferencesService;
  final ShaderService shaderService;
  final IdGeneratorService idGeneratorService;
  final OverlayService overlayService;
  final CacheManagerService cacheManagerService;
  final WakelockService wakelockService;
  final FunctionsService functionsService;
  final UrlLauncher urlLauncher;
  final LyricsService lyricsService;

  Services({
    required this.analyticsService,
    required this.crashlyticsService,
    required this.hapticsService,
    required this.remoteSettingsService,
    required this.resourceResolver,
    required this.shaderService,
    required this.audioService,
    required this.overlayService,
    required this.cacheManagerService,
    required this.timerSettingsSharedPrefsService,
    required this.sharedPreferencesService,
    required this.idGeneratorService,
    required this.wakelockService,
    required this.functionsService,
    required this.urlLauncher,
    required this.lyricsService,
  });

}

class ServicesBuilder {

  late AudioService _audioService;
  late OverlayService _overlayService;
  late HapticsService _hapticsService;
  late AnalyticsService _analyticsService;
  late CrashlyticsService _crashlyticsService;
  late RemoteSettingsService _remoteConfigService;
  late ResourceResolver _resourceResolver;
  late IdGeneratorService _idGeneratorService;
  late CacheManagerService _cacheManagerService;
  late WakelockService _wakelockService;
  late TimerSettingsSharedPrefsService _timerSettingsSharedPrefsService;
  late SharedPreferencesService _sharedPreferencesService;
  late ShaderService _shaderService;
  late FunctionsService _functionsService;
  late UrlLauncher _urlLauncher;
  late LyricsService _lyricsService;

  ServicesBuilder({
    required FirebaseProvider firebaseProvider,
    required StorageDataProvider storageDataProvider,
    required SharedPreferences sharedPreferences,
    required DhyanaAudioHandler audioHandler,
  }) {
    _audioService = AudioHandlerAudioService(audioHandler);
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

    _timerSettingsSharedPrefsService =
      TimerSettingsSharedPrefsService(
        crashlyticsService: _crashlyticsService,
        sharedPrefs: sharedPreferences,
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
  }

  Services build() {
    return Services(
      audioService: _audioService,
      overlayService: _overlayService,
      hapticsService: _hapticsService,
      analyticsService: _analyticsService,
      crashlyticsService: _crashlyticsService,
      remoteSettingsService: _remoteConfigService,
      resourceResolver: _resourceResolver,
      idGeneratorService: _idGeneratorService,
      cacheManagerService: _cacheManagerService,
      wakelockService: _wakelockService,
      timerSettingsSharedPrefsService: _timerSettingsSharedPrefsService,
      sharedPreferencesService: _sharedPreferencesService,
      shaderService: _shaderService,
      functionsService: _functionsService,
      urlLauncher: _urlLauncher,
      lyricsService: _lyricsService,
    );
  }

}
