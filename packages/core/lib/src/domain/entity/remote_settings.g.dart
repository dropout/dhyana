// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RemoteSettings _$RemoteSettingsFromJson(
  Map<String, dynamic> json,
) => _RemoteSettings(
  maintenanceModeEnabled: json['maintenanceModeEnabled'] as bool? ?? false,
  minimumRequiredAppVersion:
      json['minimumRequiredAppVersion'] as String? ?? "1.0.0",
  contactUrl: json['contactUrl'] as String? ?? "https://lazits.app/kapcsolat",
  privacyPolicyUrl:
      json['privacyPolicyUrl'] as String? ?? "https://lazits.app/adatkezeles",
  termsOfServiceUrl:
      json['termsOfServiceUrl'] as String? ?? "https://lazits.app/aszf",
);

Map<String, dynamic> _$RemoteSettingsToJson(_RemoteSettings instance) =>
    <String, dynamic>{
      'maintenanceModeEnabled': instance.maintenanceModeEnabled,
      'minimumRequiredAppVersion': instance.minimumRequiredAppVersion,
      'contactUrl': instance.contactUrl,
      'privacyPolicyUrl': instance.privacyPolicyUrl,
      'termsOfServiceUrl': instance.termsOfServiceUrl,
    };
