// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weeks_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
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
