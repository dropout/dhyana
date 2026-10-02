// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileSettingsEntity {

 bool get showStats; bool get usePresenceFeature; bool get statsAuditEnabled;
/// Create a copy of ProfileSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSettingsEntityCopyWith<ProfileSettingsEntity> get copyWith => _$ProfileSettingsEntityCopyWithImpl<ProfileSettingsEntity>(this as ProfileSettingsEntity, _$identity);

  /// Serializes this ProfileSettingsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileSettingsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSettingsEntity&&(identical(other.showStats, _this.showStats) || other.showStats == _this.showStats)&&(identical(other.usePresenceFeature, _this.usePresenceFeature) || other.usePresenceFeature == _this.usePresenceFeature)&&(identical(other.statsAuditEnabled, _this.statsAuditEnabled) || other.statsAuditEnabled == _this.statsAuditEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileSettingsEntity;
  return Object.hash(runtimeType,_this.showStats,_this.usePresenceFeature,_this.statsAuditEnabled);
}

@override
String toString() {
  final _this = this as ProfileSettingsEntity;
  return 'ProfileSettingsEntity(showStats: ${_this.showStats}, usePresenceFeature: ${_this.usePresenceFeature}, statsAuditEnabled: ${_this.statsAuditEnabled})';
}


}

/// @nodoc
abstract mixin class $ProfileSettingsEntityCopyWith<$Res>  {
  factory $ProfileSettingsEntityCopyWith(ProfileSettingsEntity value, $Res Function(ProfileSettingsEntity) _then) = _$ProfileSettingsEntityCopyWithImpl;
@useResult
$Res call({
 bool showStats, bool usePresenceFeature, bool statsAuditEnabled
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
@pragma('vm:prefer-inline') @override $Res call({Object? showStats = null,Object? usePresenceFeature = null,Object? statsAuditEnabled = null,}) {
  return _then(ProfileSettingsEntity(
showStats: null == showStats ? _self.showStats : showStats // ignore: cast_nullable_to_non_nullable
as bool,usePresenceFeature: null == usePresenceFeature ? _self.usePresenceFeature : usePresenceFeature // ignore: cast_nullable_to_non_nullable
as bool,statsAuditEnabled: null == statsAuditEnabled ? _self.statsAuditEnabled : statsAuditEnabled // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool showStats,  bool usePresenceFeature,  bool statsAuditEnabled)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSettingsEntity() when $default != null:
return $default(_that.showStats,_that.usePresenceFeature,_that.statsAuditEnabled);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool showStats,  bool usePresenceFeature,  bool statsAuditEnabled)  $default,) {final _that = this;
switch (_that) {
case _ProfileSettingsEntity():
return $default(_that.showStats,_that.usePresenceFeature,_that.statsAuditEnabled);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool showStats,  bool usePresenceFeature,  bool statsAuditEnabled)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSettingsEntity() when $default != null:
return $default(_that.showStats,_that.usePresenceFeature,_that.statsAuditEnabled);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileSettingsEntity implements ProfileSettingsEntity {
  const _ProfileSettingsEntity({this.showStats = true, this.usePresenceFeature = true, this.statsAuditEnabled = false});
  factory _ProfileSettingsEntity.fromJson(Map<String, dynamic> json) => _$ProfileSettingsEntityFromJson(json);

@override@JsonKey() final  bool showStats;
@override@JsonKey() final  bool usePresenceFeature;
@override@JsonKey() final  bool statsAuditEnabled;

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
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSettingsEntity&&(identical(other.showStats, showStats) || other.showStats == showStats)&&(identical(other.usePresenceFeature, usePresenceFeature) || other.usePresenceFeature == usePresenceFeature)&&(identical(other.statsAuditEnabled, statsAuditEnabled) || other.statsAuditEnabled == statsAuditEnabled));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,showStats,usePresenceFeature,statsAuditEnabled);
}

@override
String toString() {
    return 'ProfileSettingsEntity(showStats: $showStats, usePresenceFeature: $usePresenceFeature, statsAuditEnabled: $statsAuditEnabled)';
}


}

/// @nodoc
abstract mixin class _$ProfileSettingsEntityCopyWith<$Res> implements $ProfileSettingsEntityCopyWith<$Res> {
  factory _$ProfileSettingsEntityCopyWith(_ProfileSettingsEntity value, $Res Function(_ProfileSettingsEntity) _then) = __$ProfileSettingsEntityCopyWithImpl;
@override @useResult
$Res call({
 bool showStats, bool usePresenceFeature, bool statsAuditEnabled
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
@override @pragma('vm:prefer-inline') $Res call({Object? showStats = null,Object? usePresenceFeature = null,Object? statsAuditEnabled = null,}) {
  return _then(_ProfileSettingsEntity(
showStats: null == showStats ? _self.showStats : showStats // ignore: cast_nullable_to_non_nullable
as bool,usePresenceFeature: null == usePresenceFeature ? _self.usePresenceFeature : usePresenceFeature // ignore: cast_nullable_to_non_nullable
as bool,statsAuditEnabled: null == statsAuditEnabled ? _self.statsAuditEnabled : statsAuditEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
