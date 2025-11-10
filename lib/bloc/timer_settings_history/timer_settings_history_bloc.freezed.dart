// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimerSettingsHistoryEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsHistoryEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerSettingsHistoryEvent()';
}


}

/// @nodoc
class $TimerSettingsHistoryEventCopyWith<$Res>  {
$TimerSettingsHistoryEventCopyWith(TimerSettingsHistoryEvent _, $Res Function(TimerSettingsHistoryEvent) __);
}


/// Adds pattern-matching-related methods to [TimerSettingsHistoryEvent].
extension TimerSettingsHistoryEventPatterns on TimerSettingsHistoryEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Started value)?  started,TResult Function( SaveTimerSettingsHistoryEvent value)?  saveSettings,TResult Function( LoadTimerSettingsHistoryEvent value)?  loadSettingsList,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case SaveTimerSettingsHistoryEvent() when saveSettings != null:
return saveSettings(_that);case LoadTimerSettingsHistoryEvent() when loadSettingsList != null:
return loadSettingsList(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Started value)  started,required TResult Function( SaveTimerSettingsHistoryEvent value)  saveSettings,required TResult Function( LoadTimerSettingsHistoryEvent value)  loadSettingsList,}){
final _that = this;
switch (_that) {
case _Started():
return started(_that);case SaveTimerSettingsHistoryEvent():
return saveSettings(_that);case LoadTimerSettingsHistoryEvent():
return loadSettingsList(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Started value)?  started,TResult? Function( SaveTimerSettingsHistoryEvent value)?  saveSettings,TResult? Function( LoadTimerSettingsHistoryEvent value)?  loadSettingsList,}){
final _that = this;
switch (_that) {
case _Started() when started != null:
return started(_that);case SaveTimerSettingsHistoryEvent() when saveSettings != null:
return saveSettings(_that);case LoadTimerSettingsHistoryEvent() when loadSettingsList != null:
return loadSettingsList(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  started,TResult Function( String profileId,  TimerSettings timerSettings)?  saveSettings,TResult Function( String profileId)?  loadSettingsList,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case SaveTimerSettingsHistoryEvent() when saveSettings != null:
return saveSettings(_that.profileId,_that.timerSettings);case LoadTimerSettingsHistoryEvent() when loadSettingsList != null:
return loadSettingsList(_that.profileId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  started,required TResult Function( String profileId,  TimerSettings timerSettings)  saveSettings,required TResult Function( String profileId)  loadSettingsList,}) {final _that = this;
switch (_that) {
case _Started():
return started();case SaveTimerSettingsHistoryEvent():
return saveSettings(_that.profileId,_that.timerSettings);case LoadTimerSettingsHistoryEvent():
return loadSettingsList(_that.profileId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  started,TResult? Function( String profileId,  TimerSettings timerSettings)?  saveSettings,TResult? Function( String profileId)?  loadSettingsList,}) {final _that = this;
switch (_that) {
case _Started() when started != null:
return started();case SaveTimerSettingsHistoryEvent() when saveSettings != null:
return saveSettings(_that.profileId,_that.timerSettings);case LoadTimerSettingsHistoryEvent() when loadSettingsList != null:
return loadSettingsList(_that.profileId);case _:
  return null;

}
}

}

/// @nodoc


class _Started implements TimerSettingsHistoryEvent {
  const _Started();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Started);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TimerSettingsHistoryEvent.started()';
}


}




/// @nodoc


class SaveTimerSettingsHistoryEvent implements TimerSettingsHistoryEvent {
  const SaveTimerSettingsHistoryEvent({required this.profileId, required this.timerSettings});
  

 final  String profileId;
 final  TimerSettings timerSettings;

/// Create a copy of TimerSettingsHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SaveTimerSettingsHistoryEventCopyWith<SaveTimerSettingsHistoryEvent> get copyWith => _$SaveTimerSettingsHistoryEventCopyWithImpl<SaveTimerSettingsHistoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SaveTimerSettingsHistoryEvent&&(identical(other.profileId, profileId) || other.profileId == profileId)&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings));
}


@override
int get hashCode => Object.hash(runtimeType,profileId,timerSettings);

@override
String toString() {
  return 'TimerSettingsHistoryEvent.saveSettings(profileId: $profileId, timerSettings: $timerSettings)';
}


}

/// @nodoc
abstract mixin class $SaveTimerSettingsHistoryEventCopyWith<$Res> implements $TimerSettingsHistoryEventCopyWith<$Res> {
  factory $SaveTimerSettingsHistoryEventCopyWith(SaveTimerSettingsHistoryEvent value, $Res Function(SaveTimerSettingsHistoryEvent) _then) = _$SaveTimerSettingsHistoryEventCopyWithImpl;
@useResult
$Res call({
 String profileId, TimerSettings timerSettings
});


$TimerSettingsCopyWith<$Res> get timerSettings;

}
/// @nodoc
class _$SaveTimerSettingsHistoryEventCopyWithImpl<$Res>
    implements $SaveTimerSettingsHistoryEventCopyWith<$Res> {
  _$SaveTimerSettingsHistoryEventCopyWithImpl(this._self, this._then);

  final SaveTimerSettingsHistoryEvent _self;
  final $Res Function(SaveTimerSettingsHistoryEvent) _then;

/// Create a copy of TimerSettingsHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileId = null,Object? timerSettings = null,}) {
  return _then(SaveTimerSettingsHistoryEvent(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,timerSettings: null == timerSettings ? _self.timerSettings : timerSettings // ignore: cast_nullable_to_non_nullable
as TimerSettings,
  ));
}

/// Create a copy of TimerSettingsHistoryEvent
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


class LoadTimerSettingsHistoryEvent implements TimerSettingsHistoryEvent {
  const LoadTimerSettingsHistoryEvent({required this.profileId});
  

 final  String profileId;

/// Create a copy of TimerSettingsHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoadTimerSettingsHistoryEventCopyWith<LoadTimerSettingsHistoryEvent> get copyWith => _$LoadTimerSettingsHistoryEventCopyWithImpl<LoadTimerSettingsHistoryEvent>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoadTimerSettingsHistoryEvent&&(identical(other.profileId, profileId) || other.profileId == profileId));
}


@override
int get hashCode => Object.hash(runtimeType,profileId);

@override
String toString() {
  return 'TimerSettingsHistoryEvent.loadSettingsList(profileId: $profileId)';
}


}

/// @nodoc
abstract mixin class $LoadTimerSettingsHistoryEventCopyWith<$Res> implements $TimerSettingsHistoryEventCopyWith<$Res> {
  factory $LoadTimerSettingsHistoryEventCopyWith(LoadTimerSettingsHistoryEvent value, $Res Function(LoadTimerSettingsHistoryEvent) _then) = _$LoadTimerSettingsHistoryEventCopyWithImpl;
@useResult
$Res call({
 String profileId
});




}
/// @nodoc
class _$LoadTimerSettingsHistoryEventCopyWithImpl<$Res>
    implements $LoadTimerSettingsHistoryEventCopyWith<$Res> {
  _$LoadTimerSettingsHistoryEventCopyWithImpl(this._self, this._then);

  final LoadTimerSettingsHistoryEvent _self;
  final $Res Function(LoadTimerSettingsHistoryEvent) _then;

/// Create a copy of TimerSettingsHistoryEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profileId = null,}) {
  return _then(LoadTimerSettingsHistoryEvent(
profileId: null == profileId ? _self.profileId : profileId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

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
