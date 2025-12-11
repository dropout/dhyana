// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimerSettingsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerSettingsState()';
}


}

/// @nodoc
class $TimerSettingsStateCopyWith<$Res>  {
$TimerSettingsStateCopyWith(TimerSettingsState _, $Res Function(TimerSettingsState) __);
}


/// Adds pattern-matching-related methods to [TimerSettingsState].
extension TimerSettingsStatePatterns on TimerSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TimerSettingsDataLoadingState value)?  loading,TResult Function( TimerSettingsDataLoadedState value)?  loaded,TResult Function( TimerSettingsDataErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TimerSettingsDataLoadingState() when loading != null:
return loading(_that);case TimerSettingsDataLoadedState() when loaded != null:
return loaded(_that);case TimerSettingsDataErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TimerSettingsDataLoadingState value)  loading,required TResult Function( TimerSettingsDataLoadedState value)  loaded,required TResult Function( TimerSettingsDataErrorState value)  error,}){
final _that = this;
switch (_that) {
case TimerSettingsDataLoadingState():
return loading(_that);case TimerSettingsDataLoadedState():
return loaded(_that);case TimerSettingsDataErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TimerSettingsDataLoadingState value)?  loading,TResult? Function( TimerSettingsDataLoadedState value)?  loaded,TResult? Function( TimerSettingsDataErrorState value)?  error,}){
final _that = this;
switch (_that) {
case TimerSettingsDataLoadingState() when loading != null:
return loading(_that);case TimerSettingsDataLoadedState() when loaded != null:
return loaded(_that);case TimerSettingsDataErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( TimerSettings timerSettings)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TimerSettingsDataLoadingState() when loading != null:
return loading();case TimerSettingsDataLoadedState() when loaded != null:
return loaded(_that.timerSettings);case TimerSettingsDataErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( TimerSettings timerSettings)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case TimerSettingsDataLoadingState():
return loading();case TimerSettingsDataLoadedState():
return loaded(_that.timerSettings);case TimerSettingsDataErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( TimerSettings timerSettings)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case TimerSettingsDataLoadingState() when loading != null:
return loading();case TimerSettingsDataLoadedState() when loaded != null:
return loaded(_that.timerSettings);case TimerSettingsDataErrorState() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class TimerSettingsDataLoadingState extends TimerSettingsState {
  const TimerSettingsDataLoadingState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsDataLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerSettingsState.loading()';
}


}




/// @nodoc


class TimerSettingsDataLoadedState extends TimerSettingsState {
  const TimerSettingsDataLoadedState({required this.timerSettings}): super._();
  

 final  TimerSettings timerSettings;

/// Create a copy of TimerSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSettingsDataLoadedStateCopyWith<TimerSettingsDataLoadedState> get copyWith => _$TimerSettingsDataLoadedStateCopyWithImpl<TimerSettingsDataLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsDataLoadedState&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings));
}


@override
int get hashCode => Object.hash(runtimeType,timerSettings);

@override
String toString() {
  return 'TimerSettingsState.loaded(timerSettings: $timerSettings)';
}


}

/// @nodoc
abstract mixin class $TimerSettingsDataLoadedStateCopyWith<$Res> implements $TimerSettingsStateCopyWith<$Res> {
  factory $TimerSettingsDataLoadedStateCopyWith(TimerSettingsDataLoadedState value, $Res Function(TimerSettingsDataLoadedState) _then) = _$TimerSettingsDataLoadedStateCopyWithImpl;
@useResult
$Res call({
 TimerSettings timerSettings
});


$TimerSettingsCopyWith<$Res> get timerSettings;

}
/// @nodoc
class _$TimerSettingsDataLoadedStateCopyWithImpl<$Res>
    implements $TimerSettingsDataLoadedStateCopyWith<$Res> {
  _$TimerSettingsDataLoadedStateCopyWithImpl(this._self, this._then);

  final TimerSettingsDataLoadedState _self;
  final $Res Function(TimerSettingsDataLoadedState) _then;

/// Create a copy of TimerSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? timerSettings = null,}) {
  return _then(TimerSettingsDataLoadedState(
timerSettings: null == timerSettings ? _self.timerSettings : timerSettings // ignore: cast_nullable_to_non_nullable
as TimerSettings,
  ));
}

/// Create a copy of TimerSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimerSettingsCopyWith<$Res> get timerSettings {
  
  return $TimerSettingsCopyWith<$Res>(_self.timerSettings, (value) {
    return _then(_self.copyWith(timerSettings: value));
  });
}
}

/// @nodoc


class TimerSettingsDataErrorState extends TimerSettingsState {
  const TimerSettingsDataErrorState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsDataErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerSettingsState.error()';
}


}




// dart format on
