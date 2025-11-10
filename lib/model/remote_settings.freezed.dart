// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RemoteSettings implements DiagnosticableTreeMixin {

 bool get maintenanceModeEnabled; String get minimumRequiredAppVersion; String get contactUrl; String get eventsUrl; String get privacyPolicyUrl; String get termsOfServiceUrl;
/// Create a copy of RemoteSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteSettingsCopyWith<RemoteSettings> get copyWith => _$RemoteSettingsCopyWithImpl<RemoteSettings>(this as RemoteSettings, _$identity);

  /// Serializes this RemoteSettings to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RemoteSettings'))
    ..add(DiagnosticsProperty('maintenanceModeEnabled', maintenanceModeEnabled))..add(DiagnosticsProperty('minimumRequiredAppVersion', minimumRequiredAppVersion))..add(DiagnosticsProperty('contactUrl', contactUrl))..add(DiagnosticsProperty('eventsUrl', eventsUrl))..add(DiagnosticsProperty('privacyPolicyUrl', privacyPolicyUrl))..add(DiagnosticsProperty('termsOfServiceUrl', termsOfServiceUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteSettings&&(identical(other.maintenanceModeEnabled, maintenanceModeEnabled) || other.maintenanceModeEnabled == maintenanceModeEnabled)&&(identical(other.minimumRequiredAppVersion, minimumRequiredAppVersion) || other.minimumRequiredAppVersion == minimumRequiredAppVersion)&&(identical(other.contactUrl, contactUrl) || other.contactUrl == contactUrl)&&(identical(other.eventsUrl, eventsUrl) || other.eventsUrl == eventsUrl)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl)&&(identical(other.termsOfServiceUrl, termsOfServiceUrl) || other.termsOfServiceUrl == termsOfServiceUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maintenanceModeEnabled,minimumRequiredAppVersion,contactUrl,eventsUrl,privacyPolicyUrl,termsOfServiceUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RemoteSettings(maintenanceModeEnabled: $maintenanceModeEnabled, minimumRequiredAppVersion: $minimumRequiredAppVersion, contactUrl: $contactUrl, eventsUrl: $eventsUrl, privacyPolicyUrl: $privacyPolicyUrl, termsOfServiceUrl: $termsOfServiceUrl)';
}


}

/// @nodoc
abstract mixin class $RemoteSettingsCopyWith<$Res>  {
  factory $RemoteSettingsCopyWith(RemoteSettings value, $Res Function(RemoteSettings) _then) = _$RemoteSettingsCopyWithImpl;
@useResult
$Res call({
 bool maintenanceModeEnabled, String minimumRequiredAppVersion, String contactUrl, String eventsUrl, String privacyPolicyUrl, String termsOfServiceUrl
});




}
/// @nodoc
class _$RemoteSettingsCopyWithImpl<$Res>
    implements $RemoteSettingsCopyWith<$Res> {
  _$RemoteSettingsCopyWithImpl(this._self, this._then);

  final RemoteSettings _self;
  final $Res Function(RemoteSettings) _then;

/// Create a copy of RemoteSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? maintenanceModeEnabled = null,Object? minimumRequiredAppVersion = null,Object? contactUrl = null,Object? eventsUrl = null,Object? privacyPolicyUrl = null,Object? termsOfServiceUrl = null,}) {
  return _then(_self.copyWith(
maintenanceModeEnabled: null == maintenanceModeEnabled ? _self.maintenanceModeEnabled : maintenanceModeEnabled // ignore: cast_nullable_to_non_nullable
as bool,minimumRequiredAppVersion: null == minimumRequiredAppVersion ? _self.minimumRequiredAppVersion : minimumRequiredAppVersion // ignore: cast_nullable_to_non_nullable
as String,contactUrl: null == contactUrl ? _self.contactUrl : contactUrl // ignore: cast_nullable_to_non_nullable
as String,eventsUrl: null == eventsUrl ? _self.eventsUrl : eventsUrl // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,termsOfServiceUrl: null == termsOfServiceUrl ? _self.termsOfServiceUrl : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RemoteSettings].
extension RemoteSettingsPatterns on RemoteSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RemoteSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RemoteSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RemoteSettings value)  $default,){
final _that = this;
switch (_that) {
case _RemoteSettings():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RemoteSettings value)?  $default,){
final _that = this;
switch (_that) {
case _RemoteSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool maintenanceModeEnabled,  String minimumRequiredAppVersion,  String contactUrl,  String eventsUrl,  String privacyPolicyUrl,  String termsOfServiceUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RemoteSettings() when $default != null:
return $default(_that.maintenanceModeEnabled,_that.minimumRequiredAppVersion,_that.contactUrl,_that.eventsUrl,_that.privacyPolicyUrl,_that.termsOfServiceUrl);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool maintenanceModeEnabled,  String minimumRequiredAppVersion,  String contactUrl,  String eventsUrl,  String privacyPolicyUrl,  String termsOfServiceUrl)  $default,) {final _that = this;
switch (_that) {
case _RemoteSettings():
return $default(_that.maintenanceModeEnabled,_that.minimumRequiredAppVersion,_that.contactUrl,_that.eventsUrl,_that.privacyPolicyUrl,_that.termsOfServiceUrl);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool maintenanceModeEnabled,  String minimumRequiredAppVersion,  String contactUrl,  String eventsUrl,  String privacyPolicyUrl,  String termsOfServiceUrl)?  $default,) {final _that = this;
switch (_that) {
case _RemoteSettings() when $default != null:
return $default(_that.maintenanceModeEnabled,_that.minimumRequiredAppVersion,_that.contactUrl,_that.eventsUrl,_that.privacyPolicyUrl,_that.termsOfServiceUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RemoteSettings extends RemoteSettings with DiagnosticableTreeMixin {
   _RemoteSettings({this.maintenanceModeEnabled = false, this.minimumRequiredAppVersion = "1.0.0", this.contactUrl = "https://lazits.app/kapcsolat", this.eventsUrl = "https://domjanaron.hu/agykontroll-tanfolyam", this.privacyPolicyUrl = "https://lazits.app/adatkezeles", this.termsOfServiceUrl = "https://lazits.app/aszf"}): super._();
  factory _RemoteSettings.fromJson(Map<String, dynamic> json) => _$RemoteSettingsFromJson(json);

@override@JsonKey() final  bool maintenanceModeEnabled;
@override@JsonKey() final  String minimumRequiredAppVersion;
@override@JsonKey() final  String contactUrl;
@override@JsonKey() final  String eventsUrl;
@override@JsonKey() final  String privacyPolicyUrl;
@override@JsonKey() final  String termsOfServiceUrl;

/// Create a copy of RemoteSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RemoteSettingsCopyWith<_RemoteSettings> get copyWith => __$RemoteSettingsCopyWithImpl<_RemoteSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RemoteSettingsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RemoteSettings'))
    ..add(DiagnosticsProperty('maintenanceModeEnabled', maintenanceModeEnabled))..add(DiagnosticsProperty('minimumRequiredAppVersion', minimumRequiredAppVersion))..add(DiagnosticsProperty('contactUrl', contactUrl))..add(DiagnosticsProperty('eventsUrl', eventsUrl))..add(DiagnosticsProperty('privacyPolicyUrl', privacyPolicyUrl))..add(DiagnosticsProperty('termsOfServiceUrl', termsOfServiceUrl));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RemoteSettings&&(identical(other.maintenanceModeEnabled, maintenanceModeEnabled) || other.maintenanceModeEnabled == maintenanceModeEnabled)&&(identical(other.minimumRequiredAppVersion, minimumRequiredAppVersion) || other.minimumRequiredAppVersion == minimumRequiredAppVersion)&&(identical(other.contactUrl, contactUrl) || other.contactUrl == contactUrl)&&(identical(other.eventsUrl, eventsUrl) || other.eventsUrl == eventsUrl)&&(identical(other.privacyPolicyUrl, privacyPolicyUrl) || other.privacyPolicyUrl == privacyPolicyUrl)&&(identical(other.termsOfServiceUrl, termsOfServiceUrl) || other.termsOfServiceUrl == termsOfServiceUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,maintenanceModeEnabled,minimumRequiredAppVersion,contactUrl,eventsUrl,privacyPolicyUrl,termsOfServiceUrl);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RemoteSettings(maintenanceModeEnabled: $maintenanceModeEnabled, minimumRequiredAppVersion: $minimumRequiredAppVersion, contactUrl: $contactUrl, eventsUrl: $eventsUrl, privacyPolicyUrl: $privacyPolicyUrl, termsOfServiceUrl: $termsOfServiceUrl)';
}


}

/// @nodoc
abstract mixin class _$RemoteSettingsCopyWith<$Res> implements $RemoteSettingsCopyWith<$Res> {
  factory _$RemoteSettingsCopyWith(_RemoteSettings value, $Res Function(_RemoteSettings) _then) = __$RemoteSettingsCopyWithImpl;
@override @useResult
$Res call({
 bool maintenanceModeEnabled, String minimumRequiredAppVersion, String contactUrl, String eventsUrl, String privacyPolicyUrl, String termsOfServiceUrl
});




}
/// @nodoc
class __$RemoteSettingsCopyWithImpl<$Res>
    implements _$RemoteSettingsCopyWith<$Res> {
  __$RemoteSettingsCopyWithImpl(this._self, this._then);

  final _RemoteSettings _self;
  final $Res Function(_RemoteSettings) _then;

/// Create a copy of RemoteSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? maintenanceModeEnabled = null,Object? minimumRequiredAppVersion = null,Object? contactUrl = null,Object? eventsUrl = null,Object? privacyPolicyUrl = null,Object? termsOfServiceUrl = null,}) {
  return _then(_RemoteSettings(
maintenanceModeEnabled: null == maintenanceModeEnabled ? _self.maintenanceModeEnabled : maintenanceModeEnabled // ignore: cast_nullable_to_non_nullable
as bool,minimumRequiredAppVersion: null == minimumRequiredAppVersion ? _self.minimumRequiredAppVersion : minimumRequiredAppVersion // ignore: cast_nullable_to_non_nullable
as String,contactUrl: null == contactUrl ? _self.contactUrl : contactUrl // ignore: cast_nullable_to_non_nullable
as String,eventsUrl: null == eventsUrl ? _self.eventsUrl : eventsUrl // ignore: cast_nullable_to_non_nullable
as String,privacyPolicyUrl: null == privacyPolicyUrl ? _self.privacyPolicyUrl : privacyPolicyUrl // ignore: cast_nullable_to_non_nullable
as String,termsOfServiceUrl: null == termsOfServiceUrl ? _self.termsOfServiceUrl : termsOfServiceUrl // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
