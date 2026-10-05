// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileSession {

 String get id; ProfileSessionType get type;@DateTimeConverter() DateTime get startTime;@DateTimeConverter() DateTime get endTime;@DurationConverter() Duration get duration;
/// Create a copy of ProfileSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSessionCopyWith<ProfileSession> get copyWith => _$ProfileSessionCopyWithImpl<ProfileSession>(this as ProfileSession, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as ProfileSession;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSession&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.type, _this.type) || other.type == _this.type)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime)&&(identical(other.duration, _this.duration) || other.duration == _this.duration));
}


@override
int get hashCode {
  final _this = this as ProfileSession;
  return Object.hash(runtimeType,_this.id,_this.type,_this.startTime,_this.endTime,_this.duration);
}

@override
String toString() {
  final _this = this as ProfileSession;
  return 'ProfileSession(id: ${_this.id}, type: ${_this.type}, startTime: ${_this.startTime}, endTime: ${_this.endTime}, duration: ${_this.duration})';
}


}

/// @nodoc
abstract mixin class $ProfileSessionCopyWith<$Res>  {
  factory $ProfileSessionCopyWith(ProfileSession value, $Res Function(ProfileSession) _then) = _$ProfileSessionCopyWithImpl;
@useResult
$Res call({
 String id, ProfileSessionType type,@DateTimeConverter() DateTime startTime,@DateTimeConverter() DateTime endTime,@DurationConverter() Duration duration
});




}
/// @nodoc
class _$ProfileSessionCopyWithImpl<$Res>
    implements $ProfileSessionCopyWith<$Res> {
  _$ProfileSessionCopyWithImpl(this._self, this._then);

  final ProfileSession _self;
  final $Res Function(ProfileSession) _then;

/// Create a copy of ProfileSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? startTime = null,Object? endTime = null,Object? duration = null,}) {
  return _then(ProfileSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProfileSessionType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileSession].
extension ProfileSessionPatterns on ProfileSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileSession value)  $default,){
final _that = this;
switch (_that) {
case _ProfileSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileSession value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  ProfileSessionType type, @DateTimeConverter()  DateTime startTime, @DateTimeConverter()  DateTime endTime, @DurationConverter()  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSession() when $default != null:
return $default(_that.id,_that.type,_that.startTime,_that.endTime,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  ProfileSessionType type, @DateTimeConverter()  DateTime startTime, @DateTimeConverter()  DateTime endTime, @DurationConverter()  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _ProfileSession():
return $default(_that.id,_that.type,_that.startTime,_that.endTime,_that.duration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  ProfileSessionType type, @DateTimeConverter()  DateTime startTime, @DateTimeConverter()  DateTime endTime, @DurationConverter()  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSession() when $default != null:
return $default(_that.id,_that.type,_that.startTime,_that.endTime,_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileSession implements ProfileSession {
  const _ProfileSession({required this.id, required this.type, @DateTimeConverter() required this.startTime, @DateTimeConverter() required this.endTime, @DurationConverter() required this.duration});
  

@override final  String id;
@override final  ProfileSessionType type;
@override@DateTimeConverter() final  DateTime startTime;
@override@DateTimeConverter() final  DateTime endTime;
@override@DurationConverter() final  Duration duration;

/// Create a copy of ProfileSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSessionCopyWith<_ProfileSession> get copyWith => __$ProfileSessionCopyWithImpl<_ProfileSession>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSession&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,type,startTime,endTime,duration);
}

@override
String toString() {
    return 'ProfileSession(id: $id, type: $type, startTime: $startTime, endTime: $endTime, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$ProfileSessionCopyWith<$Res> implements $ProfileSessionCopyWith<$Res> {
  factory _$ProfileSessionCopyWith(_ProfileSession value, $Res Function(_ProfileSession) _then) = __$ProfileSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, ProfileSessionType type,@DateTimeConverter() DateTime startTime,@DateTimeConverter() DateTime endTime,@DurationConverter() Duration duration
});




}
/// @nodoc
class __$ProfileSessionCopyWithImpl<$Res>
    implements _$ProfileSessionCopyWith<$Res> {
  __$ProfileSessionCopyWithImpl(this._self, this._then);

  final _ProfileSession _self;
  final $Res Function(_ProfileSession) _then;

/// Create a copy of ProfileSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? startTime = null,Object? endTime = null,Object? duration = null,}) {
  return _then(_ProfileSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as ProfileSessionType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
