// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatsSession implements DiagnosticableTreeMixin {

 String get id; StatsSessionType get type;@DateTimeConverter() DateTime get startTime;@DateTimeConverter() DateTime get endTime;@DurationConverter() Duration get duration;
/// Create a copy of StatsSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsSessionCopyWith<StatsSession> get copyWith => _$StatsSessionCopyWithImpl<StatsSession>(this as StatsSession, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StatsSession'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('endTime', endTime))..add(DiagnosticsProperty('duration', duration));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsSession&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,startTime,endTime,duration);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StatsSession(id: $id, type: $type, startTime: $startTime, endTime: $endTime, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $StatsSessionCopyWith<$Res>  {
  factory $StatsSessionCopyWith(StatsSession value, $Res Function(StatsSession) _then) = _$StatsSessionCopyWithImpl;
@useResult
$Res call({
 String id, StatsSessionType type,@DateTimeConverter() DateTime startTime,@DateTimeConverter() DateTime endTime,@DurationConverter() Duration duration
});




}
/// @nodoc
class _$StatsSessionCopyWithImpl<$Res>
    implements $StatsSessionCopyWith<$Res> {
  _$StatsSessionCopyWithImpl(this._self, this._then);

  final StatsSession _self;
  final $Res Function(StatsSession) _then;

/// Create a copy of StatsSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? startTime = null,Object? endTime = null,Object? duration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StatsSessionType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [StatsSession].
extension StatsSessionPatterns on StatsSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatsSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatsSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatsSession value)  $default,){
final _that = this;
switch (_that) {
case _StatsSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatsSession value)?  $default,){
final _that = this;
switch (_that) {
case _StatsSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  StatsSessionType type, @DateTimeConverter()  DateTime startTime, @DateTimeConverter()  DateTime endTime, @DurationConverter()  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatsSession() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  StatsSessionType type, @DateTimeConverter()  DateTime startTime, @DateTimeConverter()  DateTime endTime, @DurationConverter()  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _StatsSession():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  StatsSessionType type, @DateTimeConverter()  DateTime startTime, @DateTimeConverter()  DateTime endTime, @DurationConverter()  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _StatsSession() when $default != null:
return $default(_that.id,_that.type,_that.startTime,_that.endTime,_that.duration);case _:
  return null;

}
}

}

/// @nodoc


class _StatsSession extends StatsSession with DiagnosticableTreeMixin {
  const _StatsSession({required this.id, required this.type, @DateTimeConverter() required this.startTime, @DateTimeConverter() required this.endTime, @DurationConverter() required this.duration}): super._();
  

@override final  String id;
@override final  StatsSessionType type;
@override@DateTimeConverter() final  DateTime startTime;
@override@DateTimeConverter() final  DateTime endTime;
@override@DurationConverter() final  Duration duration;

/// Create a copy of StatsSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsSessionCopyWith<_StatsSession> get copyWith => __$StatsSessionCopyWithImpl<_StatsSession>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StatsSession'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('endTime', endTime))..add(DiagnosticsProperty('duration', duration));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsSession&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,startTime,endTime,duration);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StatsSession(id: $id, type: $type, startTime: $startTime, endTime: $endTime, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$StatsSessionCopyWith<$Res> implements $StatsSessionCopyWith<$Res> {
  factory _$StatsSessionCopyWith(_StatsSession value, $Res Function(_StatsSession) _then) = __$StatsSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, StatsSessionType type,@DateTimeConverter() DateTime startTime,@DateTimeConverter() DateTime endTime,@DurationConverter() Duration duration
});




}
/// @nodoc
class __$StatsSessionCopyWithImpl<$Res>
    implements _$StatsSessionCopyWith<$Res> {
  __$StatsSessionCopyWithImpl(this._self, this._then);

  final _StatsSession _self;
  final $Res Function(_StatsSession) _then;

/// Create a copy of StatsSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? startTime = null,Object? endTime = null,Object? duration = null,}) {
  return _then(_StatsSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StatsSessionType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
