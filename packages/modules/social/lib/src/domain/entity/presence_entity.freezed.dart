// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresenceEntity implements DiagnosticableTreeMixin {

 String get id; SocialProfileEntity get profile;@DateTimeConverter() DateTime get startedAt; Location? get location;
/// Create a copy of PresenceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresenceEntityCopyWith<PresenceEntity> get copyWith => _$PresenceEntityCopyWithImpl<PresenceEntity>(this as PresenceEntity, _$identity);

  /// Serializes this PresenceEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PresenceEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('profile', profile))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('location', location));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,profile,startedAt,location);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PresenceEntity(id: $id, profile: $profile, startedAt: $startedAt, location: $location)';
}


}

/// @nodoc
abstract mixin class $PresenceEntityCopyWith<$Res>  {
  factory $PresenceEntityCopyWith(PresenceEntity value, $Res Function(PresenceEntity) _then) = _$PresenceEntityCopyWithImpl;
@useResult
$Res call({
 String id, SocialProfileEntity profile,@DateTimeConverter() DateTime startedAt, Location? location
});


$SocialProfileEntityCopyWith<$Res> get profile;$LocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$PresenceEntityCopyWithImpl<$Res>
    implements $PresenceEntityCopyWith<$Res> {
  _$PresenceEntityCopyWithImpl(this._self, this._then);

  final PresenceEntity _self;
  final $Res Function(PresenceEntity) _then;

/// Create a copy of PresenceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? profile = null,Object? startedAt = null,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as SocialProfileEntity,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}
/// Create a copy of PresenceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SocialProfileEntityCopyWith<$Res> get profile {
  
  return $SocialProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of PresenceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [PresenceEntity].
extension PresenceEntityPatterns on PresenceEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresenceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresenceEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresenceEntity value)  $default,){
final _that = this;
switch (_that) {
case _PresenceEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresenceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PresenceEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  SocialProfileEntity profile, @DateTimeConverter()  DateTime startedAt,  Location? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresenceEntity() when $default != null:
return $default(_that.id,_that.profile,_that.startedAt,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  SocialProfileEntity profile, @DateTimeConverter()  DateTime startedAt,  Location? location)  $default,) {final _that = this;
switch (_that) {
case _PresenceEntity():
return $default(_that.id,_that.profile,_that.startedAt,_that.location);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  SocialProfileEntity profile, @DateTimeConverter()  DateTime startedAt,  Location? location)?  $default,) {final _that = this;
switch (_that) {
case _PresenceEntity() when $default != null:
return $default(_that.id,_that.profile,_that.startedAt,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresenceEntity extends PresenceEntity with DiagnosticableTreeMixin {
  const _PresenceEntity({required this.id, required this.profile, @DateTimeConverter() required this.startedAt, this.location}): super._();
  factory _PresenceEntity.fromJson(Map<String, dynamic> json) => _$PresenceEntityFromJson(json);

@override final  String id;
@override final  SocialProfileEntity profile;
@override@DateTimeConverter() final  DateTime startedAt;
@override final  Location? location;

/// Create a copy of PresenceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresenceEntityCopyWith<_PresenceEntity> get copyWith => __$PresenceEntityCopyWithImpl<_PresenceEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresenceEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'PresenceEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('profile', profile))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('location', location));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresenceEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.profile, profile) || other.profile == profile)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,profile,startedAt,location);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PresenceEntity(id: $id, profile: $profile, startedAt: $startedAt, location: $location)';
}


}

/// @nodoc
abstract mixin class _$PresenceEntityCopyWith<$Res> implements $PresenceEntityCopyWith<$Res> {
  factory _$PresenceEntityCopyWith(_PresenceEntity value, $Res Function(_PresenceEntity) _then) = __$PresenceEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, SocialProfileEntity profile,@DateTimeConverter() DateTime startedAt, Location? location
});


@override $SocialProfileEntityCopyWith<$Res> get profile;@override $LocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$PresenceEntityCopyWithImpl<$Res>
    implements _$PresenceEntityCopyWith<$Res> {
  __$PresenceEntityCopyWithImpl(this._self, this._then);

  final _PresenceEntity _self;
  final $Res Function(_PresenceEntity) _then;

/// Create a copy of PresenceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? profile = null,Object? startedAt = null,Object? location = freezed,}) {
  return _then(_PresenceEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as SocialProfileEntity,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}

/// Create a copy of PresenceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SocialProfileEntityCopyWith<$Res> get profile {
  
  return $SocialProfileEntityCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}/// Create a copy of PresenceEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
