// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileSettingsEntity {

 bool get showStatsOnFinishScreen; bool get usePresenceFeature;
/// Create a copy of ProfileSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSettingsEntityCopyWith<ProfileSettingsEntity> get copyWith => _$ProfileSettingsEntityCopyWithImpl<ProfileSettingsEntity>(this as ProfileSettingsEntity, _$identity);

  /// Serializes this ProfileSettingsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSettingsEntity&&(identical(other.showStatsOnFinishScreen, showStatsOnFinishScreen) || other.showStatsOnFinishScreen == showStatsOnFinishScreen)&&(identical(other.usePresenceFeature, usePresenceFeature) || other.usePresenceFeature == usePresenceFeature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showStatsOnFinishScreen,usePresenceFeature);

@override
String toString() {
  return 'ProfileSettingsEntity(showStatsOnFinishScreen: $showStatsOnFinishScreen, usePresenceFeature: $usePresenceFeature)';
}


}

/// @nodoc
abstract mixin class $ProfileSettingsEntityCopyWith<$Res>  {
  factory $ProfileSettingsEntityCopyWith(ProfileSettingsEntity value, $Res Function(ProfileSettingsEntity) _then) = _$ProfileSettingsEntityCopyWithImpl;
@useResult
$Res call({
 bool showStatsOnFinishScreen, bool usePresenceFeature
});




}
/// @nodoc
class _$ProfileSettingsEntityCopyWithImpl<$Res>
    implements $ProfileSettingsEntityCopyWith<$Res> {
  _$ProfileSettingsEntityCopyWithImpl(this._self, this._then);

  final ProfileSettingsEntity _self;
  final $Res Function(ProfileSettingsEntity) _then;

/// Create a copy of ProfileSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? showStatsOnFinishScreen = null,Object? usePresenceFeature = null,}) {
  return _then(_self.copyWith(
showStatsOnFinishScreen: null == showStatsOnFinishScreen ? _self.showStatsOnFinishScreen : showStatsOnFinishScreen // ignore: cast_nullable_to_non_nullable
as bool,usePresenceFeature: null == usePresenceFeature ? _self.usePresenceFeature : usePresenceFeature // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileSettingsEntity].
extension ProfileSettingsEntityPatterns on ProfileSettingsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileSettingsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileSettingsEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProfileSettingsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileSettingsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showStatsOnFinishScreen,  bool usePresenceFeature)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSettingsEntity() when $default != null:
return $default(_that.showStatsOnFinishScreen,_that.usePresenceFeature);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showStatsOnFinishScreen,  bool usePresenceFeature)  $default,) {final _that = this;
switch (_that) {
case _ProfileSettingsEntity():
return $default(_that.showStatsOnFinishScreen,_that.usePresenceFeature);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showStatsOnFinishScreen,  bool usePresenceFeature)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSettingsEntity() when $default != null:
return $default(_that.showStatsOnFinishScreen,_that.usePresenceFeature);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileSettingsEntity implements ProfileSettingsEntity {
  const _ProfileSettingsEntity({this.showStatsOnFinishScreen = true, this.usePresenceFeature = true});
  factory _ProfileSettingsEntity.fromJson(Map<String, dynamic> json) => _$ProfileSettingsEntityFromJson(json);

@override@JsonKey() final  bool showStatsOnFinishScreen;
@override@JsonKey() final  bool usePresenceFeature;

/// Create a copy of ProfileSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSettingsEntityCopyWith<_ProfileSettingsEntity> get copyWith => __$ProfileSettingsEntityCopyWithImpl<_ProfileSettingsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileSettingsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSettingsEntity&&(identical(other.showStatsOnFinishScreen, showStatsOnFinishScreen) || other.showStatsOnFinishScreen == showStatsOnFinishScreen)&&(identical(other.usePresenceFeature, usePresenceFeature) || other.usePresenceFeature == usePresenceFeature));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,showStatsOnFinishScreen,usePresenceFeature);

@override
String toString() {
  return 'ProfileSettingsEntity(showStatsOnFinishScreen: $showStatsOnFinishScreen, usePresenceFeature: $usePresenceFeature)';
}


}

/// @nodoc
abstract mixin class _$ProfileSettingsEntityCopyWith<$Res> implements $ProfileSettingsEntityCopyWith<$Res> {
  factory _$ProfileSettingsEntityCopyWith(_ProfileSettingsEntity value, $Res Function(_ProfileSettingsEntity) _then) = __$ProfileSettingsEntityCopyWithImpl;
@override @useResult
$Res call({
 bool showStatsOnFinishScreen, bool usePresenceFeature
});




}
/// @nodoc
class __$ProfileSettingsEntityCopyWithImpl<$Res>
    implements _$ProfileSettingsEntityCopyWith<$Res> {
  __$ProfileSettingsEntityCopyWithImpl(this._self, this._then);

  final _ProfileSettingsEntity _self;
  final $Res Function(_ProfileSettingsEntity) _then;

/// Create a copy of ProfileSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? showStatsOnFinishScreen = null,Object? usePresenceFeature = null,}) {
  return _then(_ProfileSettingsEntity(
showStatsOnFinishScreen: null == showStatsOnFinishScreen ? _self.showStatsOnFinishScreen : showStatsOnFinishScreen // ignore: cast_nullable_to_non_nullable
as bool,usePresenceFeature: null == usePresenceFeature ? _self.usePresenceFeature : usePresenceFeature // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
