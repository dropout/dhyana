// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'months_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonthsEvent {

 String get profileId; DateTime get from; DateTime? get to;
/// Create a copy of MonthsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthsEventCopyWith<MonthsEvent> get copyWith => _$MonthsEventCopyWithImpl<MonthsEvent>(this as MonthsEvent, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthsEvent&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}


@override
int get hashCode => Object.hash(runtimeType,profileId,from,to);

@override
String toString() {
  return 'MonthsEvent(profileId: $profileId, from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class $MonthsEventCopyWith<$Res>  {
  factory $MonthsEventCopyWith(MonthsEvent value, $Res Function(MonthsEvent) _then) = _$MonthsEventCopyWithImpl;
@useResult
$Res call({
 String profileId, DateTime from, DateTime? to
});




}
/// @nodoc
class _$MonthsEventCopyWithImpl<$Res>
    implements $MonthsEventCopyWith<$Res> {
  _$MonthsEventCopyWithImpl(this._self, this._then);

  final MonthsEvent _self;
  final $Res Function(MonthsEvent) _then;

/// Create a copy of MonthsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? profileId = null,Object? from = null,Object? to = freezed,}) {
  return _then(_self.copyWith(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthsEvent].
extension MonthsEventPatterns on MonthsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( QueryMonthsEvent value)?  queryMonths,required TResult orElse(),}){
final _that = this;
switch (_that) {
case QueryMonthsEvent() when queryMonths != null:
return queryMonths(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( QueryMonthsEvent value)  queryMonths,}){
final _that = this;
switch (_that) {
case QueryMonthsEvent():
return queryMonths(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( QueryMonthsEvent value)?  queryMonths,}){
final _that = this;
switch (_that) {
case QueryMonthsEvent() when queryMonths != null:
return queryMonths(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String profileId,  DateTime from,  DateTime? to)?  queryMonths,required TResult orElse(),}) {final _that = this;
switch (_that) {
case QueryMonthsEvent() when queryMonths != null:
return queryMonths(_that.profileId,_that.from,_that.to);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String profileId,  DateTime from,  DateTime? to)  queryMonths,}) {final _that = this;
switch (_that) {
case QueryMonthsEvent():
return queryMonths(_that.profileId,_that.from,_that.to);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String profileId,  DateTime from,  DateTime? to)?  queryMonths,}) {final _that = this;
switch (_that) {
case QueryMonthsEvent() when queryMonths != null:
return queryMonths(_that.profileId,_that.from,_that.to);case _:
  return null;

}
}

}

/// @nodoc


class QueryMonthsEvent implements MonthsEvent {
  const QueryMonthsEvent({required this.profileId, required this.from, this.to});
  

@override final  String profileId;
@override final  DateTime from;
@override final  DateTime? to;

/// Create a copy of MonthsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QueryMonthsEventCopyWith<QueryMonthsEvent> get copyWith => _$QueryMonthsEventCopyWithImpl<QueryMonthsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QueryMonthsEvent&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to));
}


@override
int get hashCode => Object.hash(runtimeType,profileId,from,to);

@override
String toString() {
  return 'MonthsEvent.queryMonths(profileId: $profileId, from: $from, to: $to)';
}


}

/// @nodoc
abstract mixin class $QueryMonthsEventCopyWith<$Res> implements $MonthsEventCopyWith<$Res> {
  factory $QueryMonthsEventCopyWith(QueryMonthsEvent value, $Res Function(QueryMonthsEvent) _then) = _$QueryMonthsEventCopyWithImpl;
@override @useResult
$Res call({
 String profileId, DateTime from, DateTime? to
});




}
/// @nodoc
class _$QueryMonthsEventCopyWithImpl<$Res>
    implements $QueryMonthsEventCopyWith<$Res> {
  _$QueryMonthsEventCopyWithImpl(this._self, this._then);

  final QueryMonthsEvent _self;
  final $Res Function(QueryMonthsEvent) _then;

/// Create a copy of MonthsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? profileId = null,Object? from = null,Object? to = freezed,}) {
  return _then(QueryMonthsEvent(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
mixin _$MonthsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthsState()';
}


}

/// @nodoc
class $MonthsStateCopyWith<$Res>  {
$MonthsStateCopyWith(MonthsState _, $Res Function(MonthsState) __);
}


/// Adds pattern-matching-related methods to [MonthsState].
extension MonthsStatePatterns on MonthsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( MonthsLoadingState value)?  loading,TResult Function( MonthsLoadedState value)?  loaded,TResult Function( MonthsLoadingErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case MonthsLoadingState() when loading != null:
return loading(_that);case MonthsLoadedState() when loaded != null:
return loaded(_that);case MonthsLoadingErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( MonthsLoadingState value)  loading,required TResult Function( MonthsLoadedState value)  loaded,required TResult Function( MonthsLoadingErrorState value)  error,}){
final _that = this;
switch (_that) {
case MonthsLoadingState():
return loading(_that);case MonthsLoadedState():
return loaded(_that);case MonthsLoadingErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( MonthsLoadingState value)?  loading,TResult? Function( MonthsLoadedState value)?  loaded,TResult? Function( MonthsLoadingErrorState value)?  error,}){
final _that = this;
switch (_that) {
case MonthsLoadingState() when loading != null:
return loading(_that);case MonthsLoadedState() when loaded != null:
return loaded(_that);case MonthsLoadingErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<Month> months)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case MonthsLoadingState() when loading != null:
return loading();case MonthsLoadedState() when loaded != null:
return loaded(_that.months);case MonthsLoadingErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<Month> months)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case MonthsLoadingState():
return loading();case MonthsLoadedState():
return loaded(_that.months);case MonthsLoadingErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<Month> months)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case MonthsLoadingState() when loading != null:
return loading();case MonthsLoadedState() when loaded != null:
return loaded(_that.months);case MonthsLoadingErrorState() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class MonthsLoadingState implements MonthsState {
  const MonthsLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthsLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthsState.loading()';
}


}




/// @nodoc


class MonthsLoadedState implements MonthsState {
  const MonthsLoadedState({required final  List<Month> months}): _months = months;
  

 final  List<Month> _months;
 List<Month> get months {
  if (_months is EqualUnmodifiableListView) return _months;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_months);
}


/// Create a copy of MonthsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthsLoadedStateCopyWith<MonthsLoadedState> get copyWith => _$MonthsLoadedStateCopyWithImpl<MonthsLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthsLoadedState&&const DeepCollectionEquality().equals(other._months, _months));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_months));

@override
String toString() {
  return 'MonthsState.loaded(months: $months)';
}


}

/// @nodoc
abstract mixin class $MonthsLoadedStateCopyWith<$Res> implements $MonthsStateCopyWith<$Res> {
  factory $MonthsLoadedStateCopyWith(MonthsLoadedState value, $Res Function(MonthsLoadedState) _then) = _$MonthsLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<Month> months
});




}
/// @nodoc
class _$MonthsLoadedStateCopyWithImpl<$Res>
    implements $MonthsLoadedStateCopyWith<$Res> {
  _$MonthsLoadedStateCopyWithImpl(this._self, this._then);

  final MonthsLoadedState _self;
  final $Res Function(MonthsLoadedState) _then;

/// Create a copy of MonthsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? months = null,}) {
  return _then(MonthsLoadedState(
months: null == months ? _self._months : months // ignore: cast_nullable_to_non_nullable
as List<Month>,
  ));
}


}

/// @nodoc


class MonthsLoadingErrorState implements MonthsState {
  const MonthsLoadingErrorState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthsLoadingErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MonthsState.error()';
}


}




// dart format on
