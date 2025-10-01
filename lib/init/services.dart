import 'package:dhyana/service/default_shader_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dhyana/service/all.dart';

abstract class Services {
  AnalyticsService get analyticsService;
  CrashlyticsService get crashlyticsService;
  TimerSettingsSharedPrefsService get timerSettingsSharedPrefsService;
  ShaderService get shaderService;
  HapticsService get hapticsService;
  ResourceResolver get resourceResolver;
  IdGeneratorService get idGeneratorService;
  RemoteConfigService get remoteConfigService;
  AudioService get audioService;
  OverlayService get overlayService;
  CacheManagerService get cacheManagerService;
  WakelockService get wakelockService;
}

class DefaultServices extends Services {

  final AnalyticsService _analyticsService;
  final CrashlyticsService _crashlyticsService;
  final TimerSettingsSharedPrefsService _timerSettingsSharedPrefsService;
  final ShaderService _shaderService;
  final HapticsService _hapticsService;
  final ResourceResolver _resourceResolver;
  final IdGeneratorService _idGeneratorService;
  final RemoteConfigService _remoteConfigService;
  final AudioService _audioService;
  final OverlayService _overlayService;
  final CacheManagerService _cacheManagerService;
  final WakelockService _wakelockService;

  DefaultServices({
    required HapticsService hapticsService,
    required RemoteConfigService remoteConfigService,
    required ResourceResolver resourceResolver,
    required AudioService audioService,
    required OverlayService overlayService,
    required CacheManagerService cacheManagerService,
    required SharedPreferences sharedPreferences,
    required IdGeneratorService idGeneratorService,
    required AnalyticsService analyticsService,
    required CrashlyticsService crashlyticsService,
    required WakelockService wakelockService,
  })  : _hapticsService = hapticsService,
    _remoteConfigService = remoteConfigService,
    _resourceResolver = resourceResolver,
    _audioService = audioService,
    _overlayService = overlayService,
    _analyticsService = analyticsService,
    _crashlyticsService = crashlyticsService,
    _timerSettingsSharedPrefsService = TimerSettingsSharedPrefsService(
      crashlyticsService: crashlyticsService,
      sharedPrefs: sharedPreferences,
    ),
    _shaderService = DefaultShaderService(),
    _idGeneratorService = idGeneratorService,
    _cacheManagerService = cacheManagerService,
    _wakelockService = wakelockService;

  @override
  AnalyticsService get analyticsService => _analyticsService;

  @override
  CrashlyticsService get crashlyticsService => _crashlyticsService;

  @override
  TimerSettingsSharedPrefsService get timerSettingsSharedPrefsService =>
    _timerSettingsSharedPrefsService;

  @override
  ShaderService get shaderService => _shaderService;

  @override
  HapticsService get hapticsService => _hapticsService;

  @override
  ResourceResolver get resourceResolver => _resourceResolver;

  @override
  IdGeneratorService get idGeneratorService => _idGeneratorService;

  @override
  RemoteConfigService get remoteConfigService => _remoteConfigService;

  @override
  AudioService get audioService => _audioService;

  @override
  OverlayService get overlayService => _overlayService;

  @override
  CacheManagerService get cacheManagerService => _cacheManagerService;

  @override
  WakelockService get wakelockService => _wakelockService;

}
