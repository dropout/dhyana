import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'remote_settings.freezed.dart';
part 'remote_settings.g.dart';

@freezed
sealed class RemoteSettings with _$RemoteSettings {

  const RemoteSettings._();

  factory RemoteSettings({
    @Default(false) bool maintenanceModeEnabled,
    @Default("1.0.0") String minimumRequiredAppVersion,
    @Default("https://lazits.app/kapcsolat") String contactUrl,
    @Default("https://lazits.app/adatkezeles") String privacyPolicyUrl,
    @Default("https://lazits.app/aszf") String termsOfServiceUrl,
  }) = _RemoteSettings;

  factory RemoteSettings.fromJson(Map<String, Object?> json) =>
    _$RemoteSettingsFromJson(json);

}
