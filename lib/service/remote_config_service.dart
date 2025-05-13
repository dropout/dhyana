import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';



class RemoteConfigService {

  static const String maintenanceModeEnabledKey = 'maintenance_mode_enabled';

  final FirebaseRemoteConfig _remoteConfig;

  RemoteConfigService._create({
    required FirebaseRemoteConfig remoteConfig,
    required FirebaseCrashlytics firebaseCrashlytics,
  }) :
    _remoteConfig = remoteConfig;

  static Future<RemoteConfigService> create(
    FirebaseRemoteConfig remoteConfig,
    FirebaseCrashlytics firebaseCrashlytics,
  ) async {
    try {
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(seconds: 10),
          minimumFetchInterval: const Duration(minutes: 1),
        )
      );
      await remoteConfig.setDefaults(
        <String, dynamic>{
          RemoteConfigService.maintenanceModeEnabledKey: false,
        },
      );
      await remoteConfig.fetchAndActivate();
    } on Exception catch (e, stack) {
      firebaseCrashlytics.recordError(
        e,
        stack,
        reason: 'Failed to fetch remote config',
      );
    }
    return RemoteConfigService._create(
      remoteConfig: remoteConfig,
      firebaseCrashlytics: firebaseCrashlytics
    );
  }

  bool get maintenanceModeEnabled =>
    _remoteConfig.getBool(RemoteConfigService.maintenanceModeEnabledKey);

}
