// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_meta_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UserMetaDataEntity {

 DateTime? get creationTime; DateTime? get lastSignInTime;
/// Create a copy of UserMetaDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserMetaDataEntityCopyWith<UserMetaDataEntity> get copyWith => _$UserMetaDataEntityCopyWithImpl<UserMetaDataEntity>(this as UserMetaDataEntity, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as UserMetaDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserMetaDataEntity&&(identical(other.creationTime, _this.creationTime) || other.creationTime == _this.creationTime)&&(identical(other.lastSignInTime, _this.lastSignInTime) || other.lastSignInTime == _this.lastSignInTime));
}


@override
int get hashCode {
  final _this = this as UserMetaDataEntity;
  return Object.hash(runtimeType,_this.creationTime,_this.lastSignInTime);
}

@override
String toString() {
  final _this = this as UserMetaDataEntity;
  return 'UserMetaDataEntity(creationTime: ${_this.creationTime}, lastSignInTime: ${_this.lastSignInTime})';
}


}

/// @nodoc
abstract mixin class $UserMetaDataEntityCopyWith<$Res>  {
  factory $UserMetaDataEntityCopyWith(UserMetaDataEntity value, $Res Function(UserMetaDataEntity) _then) = _$UserMetaDataEntityCopyWithImpl;
@useResult
$Res call({
 DateTime? creationTime, DateTime? lastSignInTime
});




}
/// @nodoc
class _$UserMetaDataEntityCopyWithImpl<$Res>
    implements $UserMetaDataEntityCopyWith<$Res> {
  _$UserMetaDataEntityCopyWithImpl(this._self, this._then);

  final UserMetaDataEntity _self;
  final $Res Function(UserMetaDataEntity) _then;

/// Create a copy of UserMetaDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? creationTime = freezed,Object? lastSignInTime = freezed,}) {
  return _then(UserMetaDataEntity(
creationTime: freezed == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSignInTime: freezed == lastSignInTime ? _self.lastSignInTime : lastSignInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [UserMetaDataEntity].
extension UserMetaDataEntityPatterns on UserMetaDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserMetaDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserMetaDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserMetaDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserMetaDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserMetaDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserMetaDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? creationTime,  DateTime? lastSignInTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserMetaDataEntity() when $default != null:
return $default(_that.creationTime,_that.lastSignInTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? creationTime,  DateTime? lastSignInTime)  $default,) {final _that = this;
switch (_that) {
case _UserMetaDataEntity():
return $default(_that.creationTime,_that.lastSignInTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? creationTime,  DateTime? lastSignInTime)?  $default,) {final _that = this;
switch (_that) {
case _UserMetaDataEntity() when $default != null:
return $default(_that.creationTime,_that.lastSignInTime);case _:
  return null;

}
}

}

/// @nodoc


class _UserMetaDataEntity extends UserMetaDataEntity {
  const _UserMetaDataEntity({this.creationTime, this.lastSignInTime}): super._();
  

@override final  DateTime? creationTime;
@override final  DateTime? lastSignInTime;

/// Create a copy of UserMetaDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserMetaDataEntityCopyWith<_UserMetaDataEntity> get copyWith => __$UserMetaDataEntityCopyWithImpl<_UserMetaDataEntity>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserMetaDataEntity&&(identical(other.creationTime, creationTime) || other.creationTime == creationTime)&&(identical(other.lastSignInTime, lastSignInTime) || other.lastSignInTime == lastSignInTime));
}


@override
int get hashCode {
    return Object.hash(runtimeType,creationTime,lastSignInTime);
}

@override
String toString() {
    return 'UserMetaDataEntity(creationTime: $creationTime, lastSignInTime: $lastSignInTime)';
}


}

/// @nodoc
abstract mixin class _$UserMetaDataEntityCopyWith<$Res> implements $UserMetaDataEntityCopyWith<$Res> {
  factory _$UserMetaDataEntityCopyWith(_UserMetaDataEntity value, $Res Function(_UserMetaDataEntity) _then) = __$UserMetaDataEntityCopyWithImpl;
@override @useResult
$Res call({
 DateTime? creationTime, DateTime? lastSignInTime
});




}
/// @nodoc
class __$UserMetaDataEntityCopyWithImpl<$Res>
    implements _$UserMetaDataEntityCopyWith<$Res> {
  __$UserMetaDataEntityCopyWithImpl(this._self, this._then);

  final _UserMetaDataEntity _self;
  final $Res Function(_UserMetaDataEntity) _then;

/// Create a copy of UserMetaDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? creationTime = freezed,Object? lastSignInTime = freezed,}) {
  return _then(_UserMetaDataEntity(
creationTime: freezed == creationTime ? _self.creationTime : creationTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSignInTime: freezed == lastSignInTime ? _self.lastSignInTime : lastSignInTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
