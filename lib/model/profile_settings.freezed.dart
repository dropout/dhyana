// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileSettings {

 String get id; bool get showTimeOnTimerSettingsScreen; bool get showStatsOnFinishScreen; bool get usePresenceFeature;
/// Create a copy of ProfileSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSettingsCopyWith<ProfileSettings> get copyWith => _$ProfileSettingsCopyWithImpl<ProfileSettings>(this as ProfileSettings, _$identity);

  /// Serializes this ProfileSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.showTimeOnTimerSettingsScreen, showTimeOnTimerSettingsScreen) || other.showTimeOnTimerSettingsScreen == showTimeOnTimerSettingsScreen)&&(identical(other.showStatsOnFinishScreen, showStatsOnFinishScreen) || other.showStatsOnFinishScreen == showStatsOnFinishScreen)&&(identical(other.usePresenceFeature, usePresenceFeature) || other.usePresenceFeature == usePresenceFeature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,showTimeOnTimerSettingsScreen,showStatsOnFinishScreen,usePresenceFeature);

@override
String toString() {
  return 'ProfileSettings(id: $id, showTimeOnTimerSettingsScreen: $showTimeOnTimerSettingsScreen, showStatsOnFinishScreen: $showStatsOnFinishScreen, usePresenceFeature: $usePresenceFeature)';
}


}

/// @nodoc
abstract mixin class $ProfileSettingsCopyWith<$Res>  {
  factory $ProfileSettingsCopyWith(ProfileSettings value, $Res Function(ProfileSettings) _then) = _$ProfileSettingsCopyWithImpl;
@useResult
$Res call({
 String id, bool showTimeOnTimerSettingsScreen, bool showStatsOnFinishScreen, bool usePresenceFeature
});




}
/// @nodoc
class _$ProfileSettingsCopyWithImpl<$Res>
    implements $ProfileSettingsCopyWith<$Res> {
  _$ProfileSettingsCopyWithImpl(this._self, this._then);

  final ProfileSettings _self;
  final $Res Function(ProfileSettings) _then;

/// Create a copy of ProfileSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? showTimeOnTimerSettingsScreen = null,Object? showStatsOnFinishScreen = null,Object? usePresenceFeature = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,showTimeOnTimerSettingsScreen: null == showTimeOnTimerSettingsScreen ? _self.showTimeOnTimerSettingsScreen : showTimeOnTimerSettingsScreen // ignore: cast_nullable_to_non_nullable
as bool,showStatsOnFinishScreen: null == showStatsOnFinishScreen ? _self.showStatsOnFinishScreen : showStatsOnFinishScreen // ignore: cast_nullable_to_non_nullable
as bool,usePresenceFeature: null == usePresenceFeature ? _self.usePresenceFeature : usePresenceFeature // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileSettings].
extension ProfileSettingsPatterns on ProfileSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileSettings value)  $default,){
final _that = this;
switch (_that) {
case _ProfileSettings():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool showTimeOnTimerSettingsScreen,  bool showStatsOnFinishScreen,  bool usePresenceFeature)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSettings() when $default != null:
return $default(_that.id,_that.showTimeOnTimerSettingsScreen,_that.showStatsOnFinishScreen,_that.usePresenceFeature);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool showTimeOnTimerSettingsScreen,  bool showStatsOnFinishScreen,  bool usePresenceFeature)  $default,) {final _that = this;
switch (_that) {
case _ProfileSettings():
return $default(_that.id,_that.showTimeOnTimerSettingsScreen,_that.showStatsOnFinishScreen,_that.usePresenceFeature);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool showTimeOnTimerSettingsScreen,  bool showStatsOnFinishScreen,  bool usePresenceFeature)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSettings() when $default != null:
return $default(_that.id,_that.showTimeOnTimerSettingsScreen,_that.showStatsOnFinishScreen,_that.usePresenceFeature);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileSettings implements ProfileSettings {
  const _ProfileSettings({required this.id, this.showTimeOnTimerSettingsScreen = false, this.showStatsOnFinishScreen = true, this.usePresenceFeature = true});
  factory _ProfileSettings.fromJson(Map<String, dynamic> json) => _$ProfileSettingsFromJson(json);

@override final  String id;
@override@JsonKey() final  bool showTimeOnTimerSettingsScreen;
@override@JsonKey() final  bool showStatsOnFinishScreen;
@override@JsonKey() final  bool usePresenceFeature;

/// Create a copy of ProfileSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSettingsCopyWith<_ProfileSettings> get copyWith => __$ProfileSettingsCopyWithImpl<_ProfileSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.showTimeOnTimerSettingsScreen, showTimeOnTimerSettingsScreen) || other.showTimeOnTimerSettingsScreen == showTimeOnTimerSettingsScreen)&&(identical(other.showStatsOnFinishScreen, showStatsOnFinishScreen) || other.showStatsOnFinishScreen == showStatsOnFinishScreen)&&(identical(other.usePresenceFeature, usePresenceFeature) || other.usePresenceFeature == usePresenceFeature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,showTimeOnTimerSettingsScreen,showStatsOnFinishScreen,usePresenceFeature);

@override
String toString() {
  return 'ProfileSettings(id: $id, showTimeOnTimerSettingsScreen: $showTimeOnTimerSettingsScreen, showStatsOnFinishScreen: $showStatsOnFinishScreen, usePresenceFeature: $usePresenceFeature)';
}


}

/// @nodoc
abstract mixin class _$ProfileSettingsCopyWith<$Res> implements $ProfileSettingsCopyWith<$Res> {
  factory _$ProfileSettingsCopyWith(_ProfileSettings value, $Res Function(_ProfileSettings) _then) = __$ProfileSettingsCopyWithImpl;
@override @useResult
$Res call({
 String id, bool showTimeOnTimerSettingsScreen, bool showStatsOnFinishScreen, bool usePresenceFeature
});




}
/// @nodoc
class __$ProfileSettingsCopyWithImpl<$Res>
    implements _$ProfileSettingsCopyWith<$Res> {
  __$ProfileSettingsCopyWithImpl(this._self, this._then);

  final _ProfileSettings _self;
  final $Res Function(_ProfileSettings) _then;

/// Create a copy of ProfileSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? showTimeOnTimerSettingsScreen = null,Object? showStatsOnFinishScreen = null,Object? usePresenceFeature = null,}) {
  return _then(_ProfileSettings(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,showTimeOnTimerSettingsScreen: null == showTimeOnTimerSettingsScreen ? _self.showTimeOnTimerSettingsScreen : showTimeOnTimerSettingsScreen // ignore: cast_nullable_to_non_nullable
as bool,showStatsOnFinishScreen: null == showStatsOnFinishScreen ? _self.showStatsOnFinishScreen : showStatsOnFinishScreen // ignore: cast_nullable_to_non_nullable
as bool,usePresenceFeature: null == usePresenceFeature ? _self.usePresenceFeature : usePresenceFeature // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
