// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_history_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerSettingsHistoryRecord implements DiagnosticableTreeMixin {

 String get id; TimerSettings get timerSettings; int get useCount; DateTime get lastUsed;
/// Create a copy of TimerSettingsHistoryRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSettingsHistoryRecordCopyWith<TimerSettingsHistoryRecord> get copyWith => _$TimerSettingsHistoryRecordCopyWithImpl<TimerSettingsHistoryRecord>(this as TimerSettingsHistoryRecord, _$identity);

  /// Serializes this TimerSettingsHistoryRecord to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsHistoryRecord'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('timerSettings', timerSettings))..add(DiagnosticsProperty('useCount', useCount))..add(DiagnosticsProperty('lastUsed', lastUsed));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsHistoryRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings)&&(identical(other.useCount, useCount) || other.useCount == useCount)&&(identical(other.lastUsed, lastUsed) || other.lastUsed == lastUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timerSettings,useCount,lastUsed);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimerSettingsHistoryRecord(id: $id, timerSettings: $timerSettings, useCount: $useCount, lastUsed: $lastUsed)';
}


}

/// @nodoc
abstract mixin class $TimerSettingsHistoryRecordCopyWith<$Res>  {
  factory $TimerSettingsHistoryRecordCopyWith(TimerSettingsHistoryRecord value, $Res Function(TimerSettingsHistoryRecord) _then) = _$TimerSettingsHistoryRecordCopyWithImpl;
@useResult
$Res call({
 String id, TimerSettings timerSettings, int useCount, DateTime lastUsed
});


$TimerSettingsCopyWith<$Res> get timerSettings;

}
/// @nodoc
class _$TimerSettingsHistoryRecordCopyWithImpl<$Res>
    implements $TimerSettingsHistoryRecordCopyWith<$Res> {
  _$TimerSettingsHistoryRecordCopyWithImpl(this._self, this._then);

  final TimerSettingsHistoryRecord _self;
  final $Res Function(TimerSettingsHistoryRecord) _then;

/// Create a copy of TimerSettingsHistoryRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? timerSettings = null,Object? useCount = null,Object? lastUsed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timerSettings: null == timerSettings ? _self.timerSettings : timerSettings // ignore: cast_nullable_to_non_nullable
as TimerSettings,useCount: null == useCount ? _self.useCount : useCount // ignore: cast_nullable_to_non_nullable
as int,lastUsed: null == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of TimerSettingsHistoryRecord
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimerSettingsCopyWith<$Res> get timerSettings {
  
  return $TimerSettingsCopyWith<$Res>(_self.timerSettings, (value) {
    return _then(_self.copyWith(timerSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [TimerSettingsHistoryRecord].
extension TimerSettingsHistoryRecordPatterns on TimerSettingsHistoryRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerSettingsHistoryRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerSettingsHistoryRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerSettingsHistoryRecord value)  $default,){
final _that = this;
switch (_that) {
case _TimerSettingsHistoryRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerSettingsHistoryRecord value)?  $default,){
final _that = this;
switch (_that) {
case _TimerSettingsHistoryRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  TimerSettings timerSettings,  int useCount,  DateTime lastUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerSettingsHistoryRecord() when $default != null:
return $default(_that.id,_that.timerSettings,_that.useCount,_that.lastUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  TimerSettings timerSettings,  int useCount,  DateTime lastUsed)  $default,) {final _that = this;
switch (_that) {
case _TimerSettingsHistoryRecord():
return $default(_that.id,_that.timerSettings,_that.useCount,_that.lastUsed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  TimerSettings timerSettings,  int useCount,  DateTime lastUsed)?  $default,) {final _that = this;
switch (_that) {
case _TimerSettingsHistoryRecord() when $default != null:
return $default(_that.id,_that.timerSettings,_that.useCount,_that.lastUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimerSettingsHistoryRecord extends TimerSettingsHistoryRecord with DiagnosticableTreeMixin {
  const _TimerSettingsHistoryRecord({required this.id, required this.timerSettings, required this.useCount, required this.lastUsed}): super._();
  factory _TimerSettingsHistoryRecord.fromJson(Map<String, dynamic> json) => _$TimerSettingsHistoryRecordFromJson(json);

@override final  String id;
@override final  TimerSettings timerSettings;
@override final  int useCount;
@override final  DateTime lastUsed;

/// Create a copy of TimerSettingsHistoryRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerSettingsHistoryRecordCopyWith<_TimerSettingsHistoryRecord> get copyWith => __$TimerSettingsHistoryRecordCopyWithImpl<_TimerSettingsHistoryRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerSettingsHistoryRecordToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsHistoryRecord'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('timerSettings', timerSettings))..add(DiagnosticsProperty('useCount', useCount))..add(DiagnosticsProperty('lastUsed', lastUsed));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerSettingsHistoryRecord&&(identical(other.id, id) || other.id == id)&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings)&&(identical(other.useCount, useCount) || other.useCount == useCount)&&(identical(other.lastUsed, lastUsed) || other.lastUsed == lastUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,timerSettings,useCount,lastUsed);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimerSettingsHistoryRecord(id: $id, timerSettings: $timerSettings, useCount: $useCount, lastUsed: $lastUsed)';
}


}

/// @nodoc
abstract mixin class _$TimerSettingsHistoryRecordCopyWith<$Res> implements $TimerSettingsHistoryRecordCopyWith<$Res> {
  factory _$TimerSettingsHistoryRecordCopyWith(_TimerSettingsHistoryRecord value, $Res Function(_TimerSettingsHistoryRecord) _then) = __$TimerSettingsHistoryRecordCopyWithImpl;
@override @useResult
$Res call({
 String id, TimerSettings timerSettings, int useCount, DateTime lastUsed
});


@override $TimerSettingsCopyWith<$Res> get timerSettings;

}
/// @nodoc
class __$TimerSettingsHistoryRecordCopyWithImpl<$Res>
    implements _$TimerSettingsHistoryRecordCopyWith<$Res> {
  __$TimerSettingsHistoryRecordCopyWithImpl(this._self, this._then);

  final _TimerSettingsHistoryRecord _self;
  final $Res Function(_TimerSettingsHistoryRecord) _then;

/// Create a copy of TimerSettingsHistoryRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? timerSettings = null,Object? useCount = null,Object? lastUsed = null,}) {
  return _then(_TimerSettingsHistoryRecord(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,timerSettings: null == timerSettings ? _self.timerSettings : timerSettings // ignore: cast_nullable_to_non_nullable
as TimerSettings,useCount: null == useCount ? _self.useCount : useCount // ignore: cast_nullable_to_non_nullable
as int,lastUsed: null == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of TimerSettingsHistoryRecord
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
