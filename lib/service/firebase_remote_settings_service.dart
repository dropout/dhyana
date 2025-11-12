import 'dart:async';

import 'package:dhyana/model/remote_settings.dart';
import 'package:dhyana/service/remote_settings_service.dart';
import 'package:dhyana/util/debounce_stream_transformer.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:dhyana/util/remote_config_keys.dart' as remote_config_keys;

class FirebaseRemoteSettingsService implements RemoteSettingsService {

  final FirebaseRemoteConfig _remoteConfig;

  FirebaseRemoteSettingsService(FirebaseRemoteConfig remoteConfig)
    : _remoteConfig = remoteConfig;

  // Configure default values and return them.
  static Future<RemoteSettings> configureDefaults(
    FirebaseRemoteConfig remoteConfigInstance,
  ) async {
    // Set default values
    final RemoteSettings remoteSettings = RemoteSettings();
    await remoteConfigInstance.setDefaults(
      <String, dynamic>{
        remote_config_keys.maintenanceModeEnabledKey: remoteSettings.maintenanceModeEnabled,
        remote_config_keys.minimumRequiredAppVersionKey: remoteSettings.minimumRequiredAppVersion,
        remote_config_keys.contactUrlKey: remoteSettings.contactUrl,
        remote_config_keys.privacyPolicyUrlKey: remoteSettings.privacyPolicyUrl,
        remote_config_keys.termsOfServiceUrlKey: remoteSettings.termsOfServiceUrl,
      },
    );
    return remoteSettings;
  }

  @override
  RemoteSettings readRemoteSettings() {
    return RemoteSettings(
      maintenanceModeEnabled: _remoteConfig.getBool(remote_config_keys.maintenanceModeEnabledKey),
      minimumRequiredAppVersion: _remoteConfig.getString(remote_config_keys.minimumRequiredAppVersionKey),
      contactUrl: _remoteConfig.getString(remote_config_keys.contactUrlKey),
      privacyPolicyUrl: _remoteConfig.getString(remote_config_keys.privacyPolicyUrlKey),
      termsOfServiceUrl: _remoteConfig.getString(remote_config_keys.termsOfServiceUrlKey),
    );
  }

  @override
  Future<RemoteSettings> fetchRemoteSettings() async {
    _remoteConfig.fetchAndActivate();
    return readRemoteSettings();
  }

  @override
  Stream<RemoteSettings> get onRemoteSettingsChanged async* {
    // Transform the update stream with debounce
    // to avoid rapid successive updates that can happen after hot restart
    final Stream<RemoteConfigUpdate> debouncedStream = _remoteConfig.onConfigUpdated
      .transform(DebounceStreamTransformer(Duration(milliseconds: 500)));

    // Listen to debounced updates and yield new RemoteSettings
    await for (final _ in debouncedStream) {
      await _remoteConfig.activate();
      yield readRemoteSettings();
    }
  }

}
