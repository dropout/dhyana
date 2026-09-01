// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialProfileEntity implements DiagnosticableTreeMixin {

 String get id; String get firstName; String get lastName; String? get photoUrl; String? get photoBlurhash; Location? get location;
/// Create a copy of SocialProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SocialProfileEntityCopyWith<SocialProfileEntity> get copyWith => _$SocialProfileEntityCopyWithImpl<SocialProfileEntity>(this as SocialProfileEntity, _$identity);

  /// Serializes this SocialProfileEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SocialProfileEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('firstName', firstName))..add(DiagnosticsProperty('lastName', lastName))..add(DiagnosticsProperty('photoUrl', photoUrl))..add(DiagnosticsProperty('photoBlurhash', photoBlurhash))..add(DiagnosticsProperty('location', location));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SocialProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoBlurhash, photoBlurhash) || other.photoBlurhash == photoBlurhash)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,photoUrl,photoBlurhash,location);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SocialProfileEntity(id: $id, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl, photoBlurhash: $photoBlurhash, location: $location)';
}


}

/// @nodoc
abstract mixin class $SocialProfileEntityCopyWith<$Res>  {
  factory $SocialProfileEntityCopyWith(SocialProfileEntity value, $Res Function(SocialProfileEntity) _then) = _$SocialProfileEntityCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String? photoUrl, String? photoBlurhash, Location? location
});


$LocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$SocialProfileEntityCopyWithImpl<$Res>
    implements $SocialProfileEntityCopyWith<$Res> {
  _$SocialProfileEntityCopyWithImpl(this._self, this._then);

  final SocialProfileEntity _self;
  final $Res Function(SocialProfileEntity) _then;

/// Create a copy of SocialProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? photoUrl = freezed,Object? photoBlurhash = freezed,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoBlurhash: freezed == photoBlurhash ? _self.photoBlurhash : photoBlurhash // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}
/// Create a copy of SocialProfileEntity
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


/// Adds pattern-matching-related methods to [SocialProfileEntity].
extension SocialProfileEntityPatterns on SocialProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SocialProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SocialProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SocialProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _SocialProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SocialProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SocialProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? photoUrl,  String? photoBlurhash,  Location? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SocialProfileEntity() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.photoUrl,_that.photoBlurhash,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String? photoUrl,  String? photoBlurhash,  Location? location)  $default,) {final _that = this;
switch (_that) {
case _SocialProfileEntity():
return $default(_that.id,_that.firstName,_that.lastName,_that.photoUrl,_that.photoBlurhash,_that.location);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String? photoUrl,  String? photoBlurhash,  Location? location)?  $default,) {final _that = this;
switch (_that) {
case _SocialProfileEntity() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.photoUrl,_that.photoBlurhash,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SocialProfileEntity extends SocialProfileEntity with DiagnosticableTreeMixin {
  const _SocialProfileEntity({required this.id, required this.firstName, required this.lastName, required this.photoUrl, required this.photoBlurhash, this.location}): super._();
  factory _SocialProfileEntity.fromJson(Map<String, dynamic> json) => _$SocialProfileEntityFromJson(json);

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String? photoUrl;
@override final  String? photoBlurhash;
@override final  Location? location;

/// Create a copy of SocialProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SocialProfileEntityCopyWith<_SocialProfileEntity> get copyWith => __$SocialProfileEntityCopyWithImpl<_SocialProfileEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SocialProfileEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SocialProfileEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('firstName', firstName))..add(DiagnosticsProperty('lastName', lastName))..add(DiagnosticsProperty('photoUrl', photoUrl))..add(DiagnosticsProperty('photoBlurhash', photoBlurhash))..add(DiagnosticsProperty('location', location));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SocialProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoBlurhash, photoBlurhash) || other.photoBlurhash == photoBlurhash)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,photoUrl,photoBlurhash,location);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SocialProfileEntity(id: $id, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl, photoBlurhash: $photoBlurhash, location: $location)';
}


}

/// @nodoc
abstract mixin class _$SocialProfileEntityCopyWith<$Res> implements $SocialProfileEntityCopyWith<$Res> {
  factory _$SocialProfileEntityCopyWith(_SocialProfileEntity value, $Res Function(_SocialProfileEntity) _then) = __$SocialProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String? photoUrl, String? photoBlurhash, Location? location
});


@override $LocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$SocialProfileEntityCopyWithImpl<$Res>
    implements _$SocialProfileEntityCopyWith<$Res> {
  __$SocialProfileEntityCopyWithImpl(this._self, this._then);

  final _SocialProfileEntity _self;
  final $Res Function(_SocialProfileEntity) _then;

/// Create a copy of SocialProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? photoUrl = freezed,Object? photoBlurhash = freezed,Object? location = freezed,}) {
  return _then(_SocialProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoBlurhash: freezed == photoBlurhash ? _self.photoBlurhash : photoBlurhash // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}

/// Create a copy of SocialProfileEntity
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
