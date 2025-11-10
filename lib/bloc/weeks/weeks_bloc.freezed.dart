// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weeks_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$WeeksEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeksEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeeksEvent()';
}


}

/// @nodoc
class $WeeksEventCopyWith<$Res>  {
$WeeksEventCopyWith(WeeksEvent _, $Res Function(WeeksEvent) __);
}


/// Adds pattern-matching-related methods to [WeeksEvent].
extension WeeksEventPatterns on WeeksEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetWeeksEvent value)?  queryWeeks,TResult Function( ReceiveUpdateWeeksEvent value)?  receiveUpdate,TResult Function( WeeksErrorEvent value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetWeeksEvent() when queryWeeks != null:
return queryWeeks(_that);case ReceiveUpdateWeeksEvent() when receiveUpdate != null:
return receiveUpdate(_that);case WeeksErrorEvent() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetWeeksEvent value)  queryWeeks,required TResult Function( ReceiveUpdateWeeksEvent value)  receiveUpdate,required TResult Function( WeeksErrorEvent value)  error,}){
final _that = this;
switch (_that) {
case GetWeeksEvent():
return queryWeeks(_that);case ReceiveUpdateWeeksEvent():
return receiveUpdate(_that);case WeeksErrorEvent():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetWeeksEvent value)?  queryWeeks,TResult? Function( ReceiveUpdateWeeksEvent value)?  receiveUpdate,TResult? Function( WeeksErrorEvent value)?  error,}){
final _that = this;
switch (_that) {
case GetWeeksEvent() when queryWeeks != null:
return queryWeeks(_that);case ReceiveUpdateWeeksEvent() when receiveUpdate != null:
return receiveUpdate(_that);case WeeksErrorEvent() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String profileId,  DateTime from,  DateTime to,  bool useStream)?  queryWeeks,TResult Function( List<Week> weeks)?  receiveUpdate,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetWeeksEvent() when queryWeeks != null:
return queryWeeks(_that.profileId,_that.from,_that.to,_that.useStream);case ReceiveUpdateWeeksEvent() when receiveUpdate != null:
return receiveUpdate(_that.weeks);case WeeksErrorEvent() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String profileId,  DateTime from,  DateTime to,  bool useStream)  queryWeeks,required TResult Function( List<Week> weeks)  receiveUpdate,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case GetWeeksEvent():
return queryWeeks(_that.profileId,_that.from,_that.to,_that.useStream);case ReceiveUpdateWeeksEvent():
return receiveUpdate(_that.weeks);case WeeksErrorEvent():
return error();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String profileId,  DateTime from,  DateTime to,  bool useStream)?  queryWeeks,TResult? Function( List<Week> weeks)?  receiveUpdate,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case GetWeeksEvent() when queryWeeks != null:
return queryWeeks(_that.profileId,_that.from,_that.to,_that.useStream);case ReceiveUpdateWeeksEvent() when receiveUpdate != null:
return receiveUpdate(_that.weeks);case WeeksErrorEvent() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class GetWeeksEvent extends WeeksEvent {
  const GetWeeksEvent({required this.profileId, required this.from, required this.to, this.useStream = false}): super._();
  

 final  String profileId;
 final  DateTime from;
 final  DateTime to;
@JsonKey() final  bool useStream;

/// Create a copy of WeeksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetWeeksEventCopyWith<GetWeeksEvent> get copyWith => _$GetWeeksEventCopyWithImpl<GetWeeksEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetWeeksEvent&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.useStream, useStream) || other.useStream == useStream));
}


@override
int get hashCode => Object.hash(runtimeType,profileId,from,to,useStream);

@override
String toString() {
  return 'WeeksEvent.queryWeeks(profileId: $profileId, from: $from, to: $to, useStream: $useStream)';
}


}

/// @nodoc
abstract mixin class $GetWeeksEventCopyWith<$Res> implements $WeeksEventCopyWith<$Res> {
  factory $GetWeeksEventCopyWith(GetWeeksEvent value, $Res Function(GetWeeksEvent) _then) = _$GetWeeksEventCopyWithImpl;
@useResult
$Res call({
 String profileId, DateTime from, DateTime to, bool useStream
});




}
/// @nodoc
class _$GetWeeksEventCopyWithImpl<$Res>
    implements $GetWeeksEventCopyWith<$Res> {
  _$GetWeeksEventCopyWithImpl(this._self, this._then);

  final GetWeeksEvent _self;
  final $Res Function(GetWeeksEvent) _then;

/// Create a copy of WeeksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileId = null,Object? from = null,Object? to = null,Object? useStream = null,}) {
  return _then(GetWeeksEvent(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,useStream: null == useStream ? _self.useStream : useStream // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class ReceiveUpdateWeeksEvent extends WeeksEvent {
  const ReceiveUpdateWeeksEvent({required final  List<Week> weeks}): _weeks = weeks,super._();
  

 final  List<Week> _weeks;
 List<Week> get weeks {
  if (_weeks is EqualUnmodifiableListView) return _weeks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeks);
}


/// Create a copy of WeeksEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReceiveUpdateWeeksEventCopyWith<ReceiveUpdateWeeksEvent> get copyWith => _$ReceiveUpdateWeeksEventCopyWithImpl<ReceiveUpdateWeeksEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReceiveUpdateWeeksEvent&&const DeepCollectionEquality().equals(other._weeks, _weeks));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_weeks));

@override
String toString() {
  return 'WeeksEvent.receiveUpdate(weeks: $weeks)';
}


}

/// @nodoc
abstract mixin class $ReceiveUpdateWeeksEventCopyWith<$Res> implements $WeeksEventCopyWith<$Res> {
  factory $ReceiveUpdateWeeksEventCopyWith(ReceiveUpdateWeeksEvent value, $Res Function(ReceiveUpdateWeeksEvent) _then) = _$ReceiveUpdateWeeksEventCopyWithImpl;
@useResult
$Res call({
 List<Week> weeks
});




}
/// @nodoc
class _$ReceiveUpdateWeeksEventCopyWithImpl<$Res>
    implements $ReceiveUpdateWeeksEventCopyWith<$Res> {
  _$ReceiveUpdateWeeksEventCopyWithImpl(this._self, this._then);

  final ReceiveUpdateWeeksEvent _self;
  final $Res Function(ReceiveUpdateWeeksEvent) _then;

/// Create a copy of WeeksEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? weeks = null,}) {
  return _then(ReceiveUpdateWeeksEvent(
weeks: null == weeks ? _self._weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<Week>,
  ));
}


}

/// @nodoc


class WeeksErrorEvent extends WeeksEvent {
  const WeeksErrorEvent(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeksErrorEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeeksEvent.error()';
}


}




/// @nodoc
mixin _$WeeksState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeksState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeeksState()';
}


}

/// @nodoc
class $WeeksStateCopyWith<$Res>  {
$WeeksStateCopyWith(WeeksState _, $Res Function(WeeksState) __);
}


/// Adds pattern-matching-related methods to [WeeksState].
extension WeeksStatePatterns on WeeksState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( WeeksLoadingState value)?  loading,TResult Function( WeeksLoadedState value)?  loaded,TResult Function( WeeksLoadingErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case WeeksLoadingState() when loading != null:
return loading(_that);case WeeksLoadedState() when loaded != null:
return loaded(_that);case WeeksLoadingErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( WeeksLoadingState value)  loading,required TResult Function( WeeksLoadedState value)  loaded,required TResult Function( WeeksLoadingErrorState value)  error,}){
final _that = this;
switch (_that) {
case WeeksLoadingState():
return loading(_that);case WeeksLoadedState():
return loaded(_that);case WeeksLoadingErrorState():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( WeeksLoadingState value)?  loading,TResult? Function( WeeksLoadedState value)?  loaded,TResult? Function( WeeksLoadingErrorState value)?  error,}){
final _that = this;
switch (_that) {
case WeeksLoadingState() when loading != null:
return loading(_that);case WeeksLoadedState() when loaded != null:
return loaded(_that);case WeeksLoadingErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( DateTime from,  DateTime to,  List<Week> weeks,  CalculatedStats calculatedStats)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case WeeksLoadingState() when loading != null:
return loading();case WeeksLoadedState() when loaded != null:
return loaded(_that.from,_that.to,_that.weeks,_that.calculatedStats);case WeeksLoadingErrorState() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( DateTime from,  DateTime to,  List<Week> weeks,  CalculatedStats calculatedStats)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case WeeksLoadingState():
return loading();case WeeksLoadedState():
return loaded(_that.from,_that.to,_that.weeks,_that.calculatedStats);case WeeksLoadingErrorState():
return error();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( DateTime from,  DateTime to,  List<Week> weeks,  CalculatedStats calculatedStats)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case WeeksLoadingState() when loading != null:
return loading();case WeeksLoadedState() when loaded != null:
return loaded(_that.from,_that.to,_that.weeks,_that.calculatedStats);case WeeksLoadingErrorState() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class WeeksLoadingState implements WeeksState {
  const WeeksLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeksLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeeksState.loading()';
}


}




/// @nodoc


class WeeksLoadedState implements WeeksState {
  const WeeksLoadedState({required this.from, required this.to, required final  List<Week> weeks, required this.calculatedStats}): _weeks = weeks;
  

 final  DateTime from;
 final  DateTime to;
 final  List<Week> _weeks;
 List<Week> get weeks {
  if (_weeks is EqualUnmodifiableListView) return _weeks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_weeks);
}

 final  CalculatedStats calculatedStats;

/// Create a copy of WeeksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeeksLoadedStateCopyWith<WeeksLoadedState> get copyWith => _$WeeksLoadedStateCopyWithImpl<WeeksLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeksLoadedState&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&const DeepCollectionEquality().equals(other._weeks, _weeks)&&(identical(other.calculatedStats, calculatedStats) || other.calculatedStats == calculatedStats));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,const DeepCollectionEquality().hash(_weeks),calculatedStats);

@override
String toString() {
  return 'WeeksState.loaded(from: $from, to: $to, weeks: $weeks, calculatedStats: $calculatedStats)';
}


}

/// @nodoc
abstract mixin class $WeeksLoadedStateCopyWith<$Res> implements $WeeksStateCopyWith<$Res> {
  factory $WeeksLoadedStateCopyWith(WeeksLoadedState value, $Res Function(WeeksLoadedState) _then) = _$WeeksLoadedStateCopyWithImpl;
@useResult
$Res call({
 DateTime from, DateTime to, List<Week> weeks, CalculatedStats calculatedStats
});


$CalculatedStatsCopyWith<$Res> get calculatedStats;

}
/// @nodoc
class _$WeeksLoadedStateCopyWithImpl<$Res>
    implements $WeeksLoadedStateCopyWith<$Res> {
  _$WeeksLoadedStateCopyWithImpl(this._self, this._then);

  final WeeksLoadedState _self;
  final $Res Function(WeeksLoadedState) _then;

/// Create a copy of WeeksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? weeks = null,Object? calculatedStats = null,}) {
  return _then(WeeksLoadedState(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,weeks: null == weeks ? _self._weeks : weeks // ignore: cast_nullable_to_non_nullable
as List<Week>,calculatedStats: null == calculatedStats ? _self.calculatedStats : calculatedStats // ignore: cast_nullable_to_non_nullable
as CalculatedStats,
  ));
}

/// Create a copy of WeeksState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CalculatedStatsCopyWith<$Res> get calculatedStats {
  
  return $CalculatedStatsCopyWith<$Res>(_self.calculatedStats, (value) {
    return _then(_self.copyWith(calculatedStats: value));
  });
}
}

/// @nodoc


class WeeksLoadingErrorState implements WeeksState {
  const WeeksLoadingErrorState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeeksLoadingErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'WeeksState.error()';
}


}




// dart format on
