// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimerSettingsEvent implements DiagnosticableTreeMixin {

 TimerSettings? get timerSettings;
/// Create a copy of TimerSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSettingsEventCopyWith<TimerSettingsEvent> get copyWith => _$TimerSettingsEventCopyWithImpl<TimerSettingsEvent>(this as TimerSettingsEvent, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsEvent'))
    ..add(DiagnosticsProperty('timerSettings', timerSettings));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsEvent&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings));
}


@override
int get hashCode => Object.hash(runtimeType,timerSettings);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimerSettingsEvent(timerSettings: $timerSettings)';
}


}

/// @nodoc
abstract mixin class $TimerSettingsEventCopyWith<$Res>  {
  factory $TimerSettingsEventCopyWith(TimerSettingsEvent value, $Res Function(TimerSettingsEvent) _then) = _$TimerSettingsEventCopyWithImpl;
@useResult
$Res call({
 TimerSettings timerSettings
});


$TimerSettingsCopyWith<$Res>? get timerSettings;

}
/// @nodoc
class _$TimerSettingsEventCopyWithImpl<$Res>
    implements $TimerSettingsEventCopyWith<$Res> {
  _$TimerSettingsEventCopyWithImpl(this._self, this._then);

  final TimerSettingsEvent _self;
  final $Res Function(TimerSettingsEvent) _then;

/// Create a copy of TimerSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timerSettings = null,}) {
  return _then(_self.copyWith(
timerSettings: null == timerSettings ? _self.timerSettings! : timerSettings // ignore: cast_nullable_to_non_nullable
as TimerSettings,
  ));
}
/// Create a copy of TimerSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimerSettingsCopyWith<$Res>? get timerSettings {
    if (_self.timerSettings == null) {
    return null;
  }

  return $TimerSettingsCopyWith<$Res>(_self.timerSettings!, (value) {
    return _then(_self.copyWith(timerSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [TimerSettingsEvent].
extension TimerSettingsEventPatterns on TimerSettingsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoadTimerSettingsData value)?  load,TResult Function( TimerSettingsChanged value)?  changed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoadTimerSettingsData() when load != null:
return load(_that);case TimerSettingsChanged() when changed != null:
return changed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoadTimerSettingsData value)  load,required TResult Function( TimerSettingsChanged value)  changed,}){
final _that = this;
switch (_that) {
case LoadTimerSettingsData():
return load(_that);case TimerSettingsChanged():
return changed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoadTimerSettingsData value)?  load,TResult? Function( TimerSettingsChanged value)?  changed,}){
final _that = this;
switch (_that) {
case LoadTimerSettingsData() when load != null:
return load(_that);case TimerSettingsChanged() when changed != null:
return changed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( TimerSettings? timerSettings)?  load,TResult Function( TimerSettings timerSettings)?  changed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoadTimerSettingsData() when load != null:
return load(_that.timerSettings);case TimerSettingsChanged() when changed != null:
return changed(_that.timerSettings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( TimerSettings? timerSettings)  load,required TResult Function( TimerSettings timerSettings)  changed,}) {final _that = this;
switch (_that) {
case LoadTimerSettingsData():
return load(_that.timerSettings);case TimerSettingsChanged():
return changed(_that.timerSettings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( TimerSettings? timerSettings)?  load,TResult? Function( TimerSettings timerSettings)?  changed,}) {final _that = this;
switch (_that) {
case LoadTimerSettingsData() when load != null:
return load(_that.timerSettings);case TimerSettingsChanged() when changed != null:
return changed(_that.timerSettings);case _:
  return null;

}
}

}

/// @nodoc


class LoadTimerSettingsData extends TimerSettingsEvent with DiagnosticableTreeMixin {
  const LoadTimerSettingsData({this.timerSettings}): super._();
  

@override final  TimerSettings? timerSettings;

/// Create a copy of TimerSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadTimerSettingsDataCopyWith<LoadTimerSettingsData> get copyWith => _$LoadTimerSettingsDataCopyWithImpl<LoadTimerSettingsData>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsEvent.load'))
    ..add(DiagnosticsProperty('timerSettings', timerSettings));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTimerSettingsData&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings));
}


@override
int get hashCode => Object.hash(runtimeType,timerSettings);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimerSettingsEvent.load(timerSettings: $timerSettings)';
}


}

/// @nodoc
abstract mixin class $LoadTimerSettingsDataCopyWith<$Res> implements $TimerSettingsEventCopyWith<$Res> {
  factory $LoadTimerSettingsDataCopyWith(LoadTimerSettingsData value, $Res Function(LoadTimerSettingsData) _then) = _$LoadTimerSettingsDataCopyWithImpl;
@override @useResult
$Res call({
 TimerSettings? timerSettings
});


@override $TimerSettingsCopyWith<$Res>? get timerSettings;

}
/// @nodoc
class _$LoadTimerSettingsDataCopyWithImpl<$Res>
    implements $LoadTimerSettingsDataCopyWith<$Res> {
  _$LoadTimerSettingsDataCopyWithImpl(this._self, this._then);

  final LoadTimerSettingsData _self;
  final $Res Function(LoadTimerSettingsData) _then;

/// Create a copy of TimerSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timerSettings = freezed,}) {
  return _then(LoadTimerSettingsData(
timerSettings: freezed == timerSettings ? _self.timerSettings : timerSettings // ignore: cast_nullable_to_non_nullable
as TimerSettings?,
  ));
}

/// Create a copy of TimerSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimerSettingsCopyWith<$Res>? get timerSettings {
    if (_self.timerSettings == null) {
    return null;
  }

  return $TimerSettingsCopyWith<$Res>(_self.timerSettings!, (value) {
    return _then(_self.copyWith(timerSettings: value));
  });
}
}

/// @nodoc


class TimerSettingsChanged extends TimerSettingsEvent with DiagnosticableTreeMixin {
  const TimerSettingsChanged({required this.timerSettings}): super._();
  

@override final  TimerSettings timerSettings;

/// Create a copy of TimerSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSettingsChangedCopyWith<TimerSettingsChanged> get copyWith => _$TimerSettingsChangedCopyWithImpl<TimerSettingsChanged>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsEvent.changed'))
    ..add(DiagnosticsProperty('timerSettings', timerSettings));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsChanged&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings));
}


@override
int get hashCode => Object.hash(runtimeType,timerSettings);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimerSettingsEvent.changed(timerSettings: $timerSettings)';
}


}

/// @nodoc
abstract mixin class $TimerSettingsChangedCopyWith<$Res> implements $TimerSettingsEventCopyWith<$Res> {
  factory $TimerSettingsChangedCopyWith(TimerSettingsChanged value, $Res Function(TimerSettingsChanged) _then) = _$TimerSettingsChangedCopyWithImpl;
@override @useResult
$Res call({
 TimerSettings timerSettings
});


@override $TimerSettingsCopyWith<$Res> get timerSettings;

}
/// @nodoc
class _$TimerSettingsChangedCopyWithImpl<$Res>
    implements $TimerSettingsChangedCopyWith<$Res> {
  _$TimerSettingsChangedCopyWithImpl(this._self, this._then);

  final TimerSettingsChanged _self;
  final $Res Function(TimerSettingsChanged) _then;

/// Create a copy of TimerSettingsEvent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timerSettings = null,}) {
  return _then(TimerSettingsChanged(
timerSettings: null == timerSettings ? _self.timerSettings : timerSettings // ignore: cast_nullable_to_non_nullable
as TimerSettings,
  ));
}

/// Create a copy of TimerSettingsEvent
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
mixin _$TimerSettingsState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class TimerSettingsDataLoadingState extends TimerSettingsState with DiagnosticableTreeMixin {
  const TimerSettingsDataLoadingState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsState.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsDataLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimerSettingsState.loading()';
}


}




/// @nodoc


class TimerSettingsDataLoadedState extends TimerSettingsState with DiagnosticableTreeMixin {
  const TimerSettingsDataLoadedState({required this.timerSettings}): super._();
  

 final  TimerSettings timerSettings;

/// Create a copy of TimerSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSettingsDataLoadedStateCopyWith<TimerSettingsDataLoadedState> get copyWith => _$TimerSettingsDataLoadedStateCopyWithImpl<TimerSettingsDataLoadedState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsState.loaded'))
    ..add(DiagnosticsProperty('timerSettings', timerSettings));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsDataLoadedState&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings));
}


@override
int get hashCode => Object.hash(runtimeType,timerSettings);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class TimerSettingsDataErrorState extends TimerSettingsState with DiagnosticableTreeMixin {
  const TimerSettingsDataErrorState(): super._();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsState.error'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsDataErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimerSettingsState.error()';
}


}




// dart format on
