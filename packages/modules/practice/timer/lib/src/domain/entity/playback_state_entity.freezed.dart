// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playback_state_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaybackStateEntity {

 PlaybackStatus get status; Duration get position;
/// Create a copy of PlaybackStateEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaybackStateEntityCopyWith<PlaybackStateEntity> get copyWith => _$PlaybackStateEntityCopyWithImpl<PlaybackStateEntity>(this as PlaybackStateEntity, _$identity);

  /// Serializes this PlaybackStateEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PlaybackStateEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaybackStateEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.position, _this.position) || other.position == _this.position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PlaybackStateEntity;
  return Object.hash(runtimeType,_this.status,_this.position);
}

@override
String toString() {
  final _this = this as PlaybackStateEntity;
  return 'PlaybackStateEntity(status: ${_this.status}, position: ${_this.position})';
}


}

/// @nodoc
abstract mixin class $PlaybackStateEntityCopyWith<$Res>  {
  factory $PlaybackStateEntityCopyWith(PlaybackStateEntity value, $Res Function(PlaybackStateEntity) _then) = _$PlaybackStateEntityCopyWithImpl;
@useResult
$Res call({
 PlaybackStatus status, Duration position
});




}
/// @nodoc
class _$PlaybackStateEntityCopyWithImpl<$Res>
    implements $PlaybackStateEntityCopyWith<$Res> {
  _$PlaybackStateEntityCopyWithImpl(this._self, this._then);

  final PlaybackStateEntity _self;
  final $Res Function(PlaybackStateEntity) _then;

/// Create a copy of PlaybackStateEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? position = null,}) {
  return _then(PlaybackStateEntity(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PlaybackStatus,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [PlaybackStateEntity].
extension PlaybackStateEntityPatterns on PlaybackStateEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaybackStateEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaybackStateEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaybackStateEntity value)  $default,){
final _that = this;
switch (_that) {
case _PlaybackStateEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaybackStateEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PlaybackStateEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlaybackStatus status,  Duration position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaybackStateEntity() when $default != null:
return $default(_that.status,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlaybackStatus status,  Duration position)  $default,) {final _that = this;
switch (_that) {
case _PlaybackStateEntity():
return $default(_that.status,_that.position);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlaybackStatus status,  Duration position)?  $default,) {final _that = this;
switch (_that) {
case _PlaybackStateEntity() when $default != null:
return $default(_that.status,_that.position);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlaybackStateEntity implements PlaybackStateEntity {
  const _PlaybackStateEntity({required this.status, required this.position});
  factory _PlaybackStateEntity.fromJson(Map<String, dynamic> json) => _$PlaybackStateEntityFromJson(json);

@override final  PlaybackStatus status;
@override final  Duration position;

/// Create a copy of PlaybackStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaybackStateEntityCopyWith<_PlaybackStateEntity> get copyWith => __$PlaybackStateEntityCopyWithImpl<_PlaybackStateEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlaybackStateEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaybackStateEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,position);
}

@override
String toString() {
    return 'PlaybackStateEntity(status: $status, position: $position)';
}


}

/// @nodoc
abstract mixin class _$PlaybackStateEntityCopyWith<$Res> implements $PlaybackStateEntityCopyWith<$Res> {
  factory _$PlaybackStateEntityCopyWith(_PlaybackStateEntity value, $Res Function(_PlaybackStateEntity) _then) = __$PlaybackStateEntityCopyWithImpl;
@override @useResult
$Res call({
 PlaybackStatus status, Duration position
});




}
/// @nodoc
class __$PlaybackStateEntityCopyWithImpl<$Res>
    implements _$PlaybackStateEntityCopyWith<$Res> {
  __$PlaybackStateEntityCopyWithImpl(this._self, this._then);

  final _PlaybackStateEntity _self;
  final $Res Function(_PlaybackStateEntity) _then;

/// Create a copy of PlaybackStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? position = null,}) {
  return _then(_PlaybackStateEntity(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PlaybackStatus,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
