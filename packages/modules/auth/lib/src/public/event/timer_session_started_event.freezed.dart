// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_session_started_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimerSessionStartedEvent {

 DateTime get timestamp;
/// Create a copy of TimerSessionStartedEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSessionStartedEventCopyWith<TimerSessionStartedEvent> get copyWith => _$TimerSessionStartedEventCopyWithImpl<TimerSessionStartedEvent>(this as TimerSessionStartedEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSessionStartedEvent&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp);

@override
String toString() {
  return 'TimerSessionStartedEvent(timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class $TimerSessionStartedEventCopyWith<$Res>  {
  factory $TimerSessionStartedEventCopyWith(TimerSessionStartedEvent value, $Res Function(TimerSessionStartedEvent) _then) = _$TimerSessionStartedEventCopyWithImpl;
@useResult
$Res call({
 DateTime timestamp
});




}
/// @nodoc
class _$TimerSessionStartedEventCopyWithImpl<$Res>
    implements $TimerSessionStartedEventCopyWith<$Res> {
  _$TimerSessionStartedEventCopyWithImpl(this._self, this._then);

  final TimerSessionStartedEvent _self;
  final $Res Function(TimerSessionStartedEvent) _then;

/// Create a copy of TimerSessionStartedEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timestamp = null,}) {
  return _then(_self.copyWith(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [TimerSessionStartedEvent].
extension TimerSessionStartedEventPatterns on TimerSessionStartedEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerSessionStartedEvent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerSessionStartedEvent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerSessionStartedEvent value)  $default,){
final _that = this;
switch (_that) {
case _TimerSessionStartedEvent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerSessionStartedEvent value)?  $default,){
final _that = this;
switch (_that) {
case _TimerSessionStartedEvent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime timestamp)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerSessionStartedEvent() when $default != null:
return $default(_that.timestamp);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime timestamp)  $default,) {final _that = this;
switch (_that) {
case _TimerSessionStartedEvent():
return $default(_that.timestamp);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime timestamp)?  $default,) {final _that = this;
switch (_that) {
case _TimerSessionStartedEvent() when $default != null:
return $default(_that.timestamp);case _:
  return null;

}
}

}

/// @nodoc


class _TimerSessionStartedEvent implements TimerSessionStartedEvent {
  const _TimerSessionStartedEvent({required this.timestamp});
  

@override final  DateTime timestamp;

/// Create a copy of TimerSessionStartedEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerSessionStartedEventCopyWith<_TimerSessionStartedEvent> get copyWith => __$TimerSessionStartedEventCopyWithImpl<_TimerSessionStartedEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerSessionStartedEvent&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp));
}


@override
int get hashCode => Object.hash(runtimeType,timestamp);

@override
String toString() {
  return 'TimerSessionStartedEvent(timestamp: $timestamp)';
}


}

/// @nodoc
abstract mixin class _$TimerSessionStartedEventCopyWith<$Res> implements $TimerSessionStartedEventCopyWith<$Res> {
  factory _$TimerSessionStartedEventCopyWith(_TimerSessionStartedEvent value, $Res Function(_TimerSessionStartedEvent) _then) = __$TimerSessionStartedEventCopyWithImpl;
@override @useResult
$Res call({
 DateTime timestamp
});




}
/// @nodoc
class __$TimerSessionStartedEventCopyWithImpl<$Res>
    implements _$TimerSessionStartedEventCopyWith<$Res> {
  __$TimerSessionStartedEventCopyWithImpl(this._self, this._then);

  final _TimerSessionStartedEvent _self;
  final $Res Function(_TimerSessionStartedEvent) _then;

/// Create a copy of TimerSessionStartedEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timestamp = null,}) {
  return _then(_TimerSessionStartedEvent(
timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
