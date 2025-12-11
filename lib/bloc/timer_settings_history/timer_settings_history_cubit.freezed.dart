// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_history_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimerSettingsHistoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsHistoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerSettingsHistoryState()';
}


}

/// @nodoc
class $TimerSettingsHistoryStateCopyWith<$Res>  {
$TimerSettingsHistoryStateCopyWith(TimerSettingsHistoryState _, $Res Function(TimerSettingsHistoryState) __);
}


/// Adds pattern-matching-related methods to [TimerSettingsHistoryState].
extension TimerSettingsHistoryStatePatterns on TimerSettingsHistoryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( TimerSettingsHistoryLoading value)?  loading,TResult Function( TimerSettingsHistoryLoaded value)?  loaded,TResult Function( TimerSettingsHistoryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case TimerSettingsHistoryLoading() when loading != null:
return loading(_that);case TimerSettingsHistoryLoaded() when loaded != null:
return loaded(_that);case TimerSettingsHistoryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( TimerSettingsHistoryLoading value)  loading,required TResult Function( TimerSettingsHistoryLoaded value)  loaded,required TResult Function( TimerSettingsHistoryError value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case TimerSettingsHistoryLoading():
return loading(_that);case TimerSettingsHistoryLoaded():
return loaded(_that);case TimerSettingsHistoryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( TimerSettingsHistoryLoading value)?  loading,TResult? Function( TimerSettingsHistoryLoaded value)?  loaded,TResult? Function( TimerSettingsHistoryError value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case TimerSettingsHistoryLoading() when loading != null:
return loading(_that);case TimerSettingsHistoryLoaded() when loaded != null:
return loaded(_that);case TimerSettingsHistoryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<TimerSettingsHistoryRecord> timerSettingsList)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case TimerSettingsHistoryLoading() when loading != null:
return loading();case TimerSettingsHistoryLoaded() when loaded != null:
return loaded(_that.timerSettingsList);case TimerSettingsHistoryError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<TimerSettingsHistoryRecord> timerSettingsList)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case TimerSettingsHistoryLoading():
return loading();case TimerSettingsHistoryLoaded():
return loaded(_that.timerSettingsList);case TimerSettingsHistoryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<TimerSettingsHistoryRecord> timerSettingsList)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case TimerSettingsHistoryLoading() when loading != null:
return loading();case TimerSettingsHistoryLoaded() when loaded != null:
return loaded(_that.timerSettingsList);case TimerSettingsHistoryError() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements TimerSettingsHistoryState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerSettingsHistoryState.initial()';
}


}




/// @nodoc


class TimerSettingsHistoryLoading implements TimerSettingsHistoryState {
  const TimerSettingsHistoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsHistoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerSettingsHistoryState.loading()';
}


}




/// @nodoc


class TimerSettingsHistoryLoaded implements TimerSettingsHistoryState {
  const TimerSettingsHistoryLoaded({required final  List<TimerSettingsHistoryRecord> timerSettingsList}): _timerSettingsList = timerSettingsList;
  

 final  List<TimerSettingsHistoryRecord> _timerSettingsList;
 List<TimerSettingsHistoryRecord> get timerSettingsList {
  if (_timerSettingsList is EqualUnmodifiableListView) return _timerSettingsList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_timerSettingsList);
}


/// Create a copy of TimerSettingsHistoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSettingsHistoryLoadedCopyWith<TimerSettingsHistoryLoaded> get copyWith => _$TimerSettingsHistoryLoadedCopyWithImpl<TimerSettingsHistoryLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsHistoryLoaded&&const DeepCollectionEquality().equals(other._timerSettingsList, _timerSettingsList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_timerSettingsList));

@override
String toString() {
  return 'TimerSettingsHistoryState.loaded(timerSettingsList: $timerSettingsList)';
}


}

/// @nodoc
abstract mixin class $TimerSettingsHistoryLoadedCopyWith<$Res> implements $TimerSettingsHistoryStateCopyWith<$Res> {
  factory $TimerSettingsHistoryLoadedCopyWith(TimerSettingsHistoryLoaded value, $Res Function(TimerSettingsHistoryLoaded) _then) = _$TimerSettingsHistoryLoadedCopyWithImpl;
@useResult
$Res call({
 List<TimerSettingsHistoryRecord> timerSettingsList
});




}
/// @nodoc
class _$TimerSettingsHistoryLoadedCopyWithImpl<$Res>
    implements $TimerSettingsHistoryLoadedCopyWith<$Res> {
  _$TimerSettingsHistoryLoadedCopyWithImpl(this._self, this._then);

  final TimerSettingsHistoryLoaded _self;
  final $Res Function(TimerSettingsHistoryLoaded) _then;

/// Create a copy of TimerSettingsHistoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timerSettingsList = null,}) {
  return _then(TimerSettingsHistoryLoaded(
timerSettingsList: null == timerSettingsList ? _self._timerSettingsList : timerSettingsList // ignore: cast_nullable_to_non_nullable
as List<TimerSettingsHistoryRecord>,
  ));
}


}

/// @nodoc


class TimerSettingsHistoryError implements TimerSettingsHistoryState {
  const TimerSettingsHistoryError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsHistoryError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerSettingsHistoryState.error()';
}


}




// dart format on
