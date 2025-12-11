// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_completed_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionCompletedState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCompletedState()';
}


}

/// @nodoc
class $SessionCompletedStateCopyWith<$Res>  {
$SessionCompletedStateCopyWith(SessionCompletedState _, $Res Function(SessionCompletedState) __);
}


/// Adds pattern-matching-related methods to [SessionCompletedState].
extension SessionCompletedStatePatterns on SessionCompletedState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionCompletedInitialState value)?  initial,TResult Function( SessionCompletedLoadingState value)?  loading,TResult Function( SessionCompletedErrorState value)?  error,TResult Function( SessionCompletedSavingState value)?  saving,TResult Function( SessionCompletedSavedState value)?  saved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionCompletedInitialState() when initial != null:
return initial(_that);case SessionCompletedLoadingState() when loading != null:
return loading(_that);case SessionCompletedErrorState() when error != null:
return error(_that);case SessionCompletedSavingState() when saving != null:
return saving(_that);case SessionCompletedSavedState() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionCompletedInitialState value)  initial,required TResult Function( SessionCompletedLoadingState value)  loading,required TResult Function( SessionCompletedErrorState value)  error,required TResult Function( SessionCompletedSavingState value)  saving,required TResult Function( SessionCompletedSavedState value)  saved,}){
final _that = this;
switch (_that) {
case SessionCompletedInitialState():
return initial(_that);case SessionCompletedLoadingState():
return loading(_that);case SessionCompletedErrorState():
return error(_that);case SessionCompletedSavingState():
return saving(_that);case SessionCompletedSavedState():
return saved(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionCompletedInitialState value)?  initial,TResult? Function( SessionCompletedLoadingState value)?  loading,TResult? Function( SessionCompletedErrorState value)?  error,TResult? Function( SessionCompletedSavingState value)?  saving,TResult? Function( SessionCompletedSavedState value)?  saved,}){
final _that = this;
switch (_that) {
case SessionCompletedInitialState() when initial != null:
return initial(_that);case SessionCompletedLoadingState() when loading != null:
return loading(_that);case SessionCompletedErrorState() when error != null:
return error(_that);case SessionCompletedSavingState() when saving != null:
return saving(_that);case SessionCompletedSavedState() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  error,TResult Function( UpdateProfileStatsResult updateResult)?  saving,TResult Function( UpdateProfileStatsResult updateResult)?  saved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionCompletedInitialState() when initial != null:
return initial();case SessionCompletedLoadingState() when loading != null:
return loading();case SessionCompletedErrorState() when error != null:
return error();case SessionCompletedSavingState() when saving != null:
return saving(_that.updateResult);case SessionCompletedSavedState() when saved != null:
return saved(_that.updateResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  error,required TResult Function( UpdateProfileStatsResult updateResult)  saving,required TResult Function( UpdateProfileStatsResult updateResult)  saved,}) {final _that = this;
switch (_that) {
case SessionCompletedInitialState():
return initial();case SessionCompletedLoadingState():
return loading();case SessionCompletedErrorState():
return error();case SessionCompletedSavingState():
return saving(_that.updateResult);case SessionCompletedSavedState():
return saved(_that.updateResult);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  error,TResult? Function( UpdateProfileStatsResult updateResult)?  saving,TResult? Function( UpdateProfileStatsResult updateResult)?  saved,}) {final _that = this;
switch (_that) {
case SessionCompletedInitialState() when initial != null:
return initial();case SessionCompletedLoadingState() when loading != null:
return loading();case SessionCompletedErrorState() when error != null:
return error();case SessionCompletedSavingState() when saving != null:
return saving(_that.updateResult);case SessionCompletedSavedState() when saved != null:
return saved(_that.updateResult);case _:
  return null;

}
}

}

/// @nodoc


class SessionCompletedInitialState extends SessionCompletedState {
  const SessionCompletedInitialState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedInitialState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCompletedState.initial()';
}


}




/// @nodoc


class SessionCompletedLoadingState extends SessionCompletedState {
  const SessionCompletedLoadingState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCompletedState.loading()';
}


}




/// @nodoc


class SessionCompletedErrorState extends SessionCompletedState {
  const SessionCompletedErrorState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCompletedState.error()';
}


}




/// @nodoc


class SessionCompletedSavingState extends SessionCompletedState {
  const SessionCompletedSavingState({required this.updateResult}): super._();
  

 final  UpdateProfileStatsResult updateResult;

/// Create a copy of SessionCompletedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCompletedSavingStateCopyWith<SessionCompletedSavingState> get copyWith => _$SessionCompletedSavingStateCopyWithImpl<SessionCompletedSavingState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedSavingState&&(identical(other.updateResult, updateResult) || other.updateResult == updateResult));
}


@override
int get hashCode => Object.hash(runtimeType,updateResult);

@override
String toString() {
  return 'SessionCompletedState.saving(updateResult: $updateResult)';
}


}

/// @nodoc
abstract mixin class $SessionCompletedSavingStateCopyWith<$Res> implements $SessionCompletedStateCopyWith<$Res> {
  factory $SessionCompletedSavingStateCopyWith(SessionCompletedSavingState value, $Res Function(SessionCompletedSavingState) _then) = _$SessionCompletedSavingStateCopyWithImpl;
@useResult
$Res call({
 UpdateProfileStatsResult updateResult
});


$UpdateProfileStatsResultCopyWith<$Res> get updateResult;

}
/// @nodoc
class _$SessionCompletedSavingStateCopyWithImpl<$Res>
    implements $SessionCompletedSavingStateCopyWith<$Res> {
  _$SessionCompletedSavingStateCopyWithImpl(this._self, this._then);

  final SessionCompletedSavingState _self;
  final $Res Function(SessionCompletedSavingState) _then;

/// Create a copy of SessionCompletedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updateResult = null,}) {
  return _then(SessionCompletedSavingState(
updateResult: null == updateResult ? _self.updateResult : updateResult // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatsResult,
  ));
}

/// Create a copy of SessionCompletedState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateProfileStatsResultCopyWith<$Res> get updateResult {
  
  return $UpdateProfileStatsResultCopyWith<$Res>(_self.updateResult, (value) {
    return _then(_self.copyWith(updateResult: value));
  });
}
}

/// @nodoc


class SessionCompletedSavedState extends SessionCompletedState {
  const SessionCompletedSavedState({required this.updateResult}): super._();
  

 final  UpdateProfileStatsResult updateResult;

/// Create a copy of SessionCompletedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCompletedSavedStateCopyWith<SessionCompletedSavedState> get copyWith => _$SessionCompletedSavedStateCopyWithImpl<SessionCompletedSavedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedSavedState&&(identical(other.updateResult, updateResult) || other.updateResult == updateResult));
}


@override
int get hashCode => Object.hash(runtimeType,updateResult);

@override
String toString() {
  return 'SessionCompletedState.saved(updateResult: $updateResult)';
}


}

/// @nodoc
abstract mixin class $SessionCompletedSavedStateCopyWith<$Res> implements $SessionCompletedStateCopyWith<$Res> {
  factory $SessionCompletedSavedStateCopyWith(SessionCompletedSavedState value, $Res Function(SessionCompletedSavedState) _then) = _$SessionCompletedSavedStateCopyWithImpl;
@useResult
$Res call({
 UpdateProfileStatsResult updateResult
});


$UpdateProfileStatsResultCopyWith<$Res> get updateResult;

}
/// @nodoc
class _$SessionCompletedSavedStateCopyWithImpl<$Res>
    implements $SessionCompletedSavedStateCopyWith<$Res> {
  _$SessionCompletedSavedStateCopyWithImpl(this._self, this._then);

  final SessionCompletedSavedState _self;
  final $Res Function(SessionCompletedSavedState) _then;

/// Create a copy of SessionCompletedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updateResult = null,}) {
  return _then(SessionCompletedSavedState(
updateResult: null == updateResult ? _self.updateResult : updateResult // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatsResult,
  ));
}

/// Create a copy of SessionCompletedState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateProfileStatsResultCopyWith<$Res> get updateResult {
  
  return $UpdateProfileStatsResultCopyWith<$Res>(_self.updateResult, (value) {
    return _then(_self.copyWith(updateResult: value));
  });
}
}

// dart format on
