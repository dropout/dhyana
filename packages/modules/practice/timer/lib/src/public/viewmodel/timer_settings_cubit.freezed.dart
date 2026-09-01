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

 TimerSettings get timerSettings;
/// Create a copy of TimerSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSettingsStateCopyWith<TimerSettingsState> get copyWith => _$TimerSettingsStateCopyWithImpl<TimerSettingsState>(this as TimerSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsState&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings));
}


@override
int get hashCode => Object.hash(runtimeType,timerSettings);

@override
String toString() {
  return 'TimerSettingsState(timerSettings: $timerSettings)';
}


}

/// @nodoc
abstract mixin class $TimerSettingsStateCopyWith<$Res>  {
  factory $TimerSettingsStateCopyWith(TimerSettingsState value, $Res Function(TimerSettingsState) _then) = _$TimerSettingsStateCopyWithImpl;
@useResult
$Res call({
 TimerSettings timerSettings
});


$TimerSettingsCopyWith<$Res> get timerSettings;

}
/// @nodoc
class _$TimerSettingsStateCopyWithImpl<$Res>
    implements $TimerSettingsStateCopyWith<$Res> {
  _$TimerSettingsStateCopyWithImpl(this._self, this._then);

  final TimerSettingsState _self;
  final $Res Function(TimerSettingsState) _then;

/// Create a copy of TimerSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timerSettings = null,}) {
  return _then(_self.copyWith(
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _TimerSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _TimerSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TimerSettings timerSettings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerSettingsState() when $default != null:
return $default(_that.timerSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TimerSettings timerSettings)  $default,) {final _that = this;
switch (_that) {
case _TimerSettingsState():
return $default(_that.timerSettings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TimerSettings timerSettings)?  $default,) {final _that = this;
switch (_that) {
case _TimerSettingsState() when $default != null:
return $default(_that.timerSettings);case _:
  return null;

}
}

}

/// @nodoc


class _TimerSettingsState extends TimerSettingsState {
  const _TimerSettingsState({required this.timerSettings}): super._();
  

@override final  TimerSettings timerSettings;

/// Create a copy of TimerSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerSettingsStateCopyWith<_TimerSettingsState> get copyWith => __$TimerSettingsStateCopyWithImpl<_TimerSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerSettingsState&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings));
}


@override
int get hashCode => Object.hash(runtimeType,timerSettings);

@override
String toString() {
  return 'TimerSettingsState(timerSettings: $timerSettings)';
}


}

/// @nodoc
abstract mixin class _$TimerSettingsStateCopyWith<$Res> implements $TimerSettingsStateCopyWith<$Res> {
  factory _$TimerSettingsStateCopyWith(_TimerSettingsState value, $Res Function(_TimerSettingsState) _then) = __$TimerSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 TimerSettings timerSettings
});


@override $TimerSettingsCopyWith<$Res> get timerSettings;

}
/// @nodoc
class __$TimerSettingsStateCopyWithImpl<$Res>
    implements _$TimerSettingsStateCopyWith<$Res> {
  __$TimerSettingsStateCopyWithImpl(this._self, this._then);

  final _TimerSettingsState _self;
  final $Res Function(_TimerSettingsState) _then;

/// Create a copy of TimerSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timerSettings = null,}) {
  return _then(_TimerSettingsState(
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

// dart format on
