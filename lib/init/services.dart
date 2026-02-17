import 'package:dhyana/data_provider/firebase/firebase_id_generator.dart';
import 'package:dhyana/data_provider/storage_data_provider.dart';
import 'package:dhyana/service/all.dart';
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
  final ShaderService shaderService;
  final IdGeneratorService idGeneratorService;
  final OverlayService overlayService;
  final CacheManagerService cacheManagerService;
  final WakelockService wakelockService;
  final FunctionsService functionsService;
  final UrlLauncher urlLauncher;

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
    required this.idGeneratorService,
    required this.wakelockService,
    required this.functionsService,
    required this.urlLauncher,
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
  late ShaderService _shaderService;
  late FunctionsService _functionsService;

  ServicesBuilder({
    required FirebaseProvider firebaseProvider,
    required StorageDataProvider storageDataProvider,
    required SharedPreferences sharedPreferences,
  }) {
    _audioService = DefaultAudioService();
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

    _shaderService = DefaultShaderService();
    _functionsService = FirebaseFunctionsService(
      fbFunctions: firebaseProvider.functions,
    );
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
      shaderService: _shaderService,
      functionsService: _functionsService,
      urlLauncher: const UrlLauncher(),
    );
  }

}
