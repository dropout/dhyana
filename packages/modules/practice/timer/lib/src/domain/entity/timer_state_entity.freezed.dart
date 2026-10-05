// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerStateEntity {

 TimerSettingsEntity get timerSettings; TimerStatus get timerStatus; TimerStage get timerStage; Duration get elapsedWarmupTime; Duration get elapsedTime; DateTime? get startTime; DateTime? get endTime;
/// Create a copy of TimerStateEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerStateEntityCopyWith<TimerStateEntity> get copyWith => _$TimerStateEntityCopyWithImpl<TimerStateEntity>(this as TimerStateEntity, _$identity);

  /// Serializes this TimerStateEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TimerStateEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerStateEntity&&(identical(other.timerSettings, _this.timerSettings) || other.timerSettings == _this.timerSettings)&&(identical(other.timerStatus, _this.timerStatus) || other.timerStatus == _this.timerStatus)&&(identical(other.timerStage, _this.timerStage) || other.timerStage == _this.timerStage)&&(identical(other.elapsedWarmupTime, _this.elapsedWarmupTime) || other.elapsedWarmupTime == _this.elapsedWarmupTime)&&(identical(other.elapsedTime, _this.elapsedTime) || other.elapsedTime == _this.elapsedTime)&&(identical(other.startTime, _this.startTime) || other.startTime == _this.startTime)&&(identical(other.endTime, _this.endTime) || other.endTime == _this.endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimerStateEntity;
  return Object.hash(runtimeType,_this.timerSettings,_this.timerStatus,_this.timerStage,_this.elapsedWarmupTime,_this.elapsedTime,_this.startTime,_this.endTime);
}

@override
String toString() {
  final _this = this as TimerStateEntity;
  return 'TimerStateEntity(timerSettings: ${_this.timerSettings}, timerStatus: ${_this.timerStatus}, timerStage: ${_this.timerStage}, elapsedWarmupTime: ${_this.elapsedWarmupTime}, elapsedTime: ${_this.elapsedTime}, startTime: ${_this.startTime}, endTime: ${_this.endTime})';
}


}

/// @nodoc
abstract mixin class $TimerStateEntityCopyWith<$Res>  {
  factory $TimerStateEntityCopyWith(TimerStateEntity value, $Res Function(TimerStateEntity) _then) = _$TimerStateEntityCopyWithImpl;
@useResult
$Res call({
 TimerSettingsEntity timerSettings, TimerStatus timerStatus, TimerStage timerStage, Duration elapsedWarmupTime, Duration elapsedTime, DateTime? startTime, DateTime? endTime
});


$TimerSettingsEntityCopyWith<$Res> get timerSettings;

}
/// @nodoc
class _$TimerStateEntityCopyWithImpl<$Res>
    implements $TimerStateEntityCopyWith<$Res> {
  _$TimerStateEntityCopyWithImpl(this._self, this._then);

  final TimerStateEntity _self;
  final $Res Function(TimerStateEntity) _then;

/// Create a copy of TimerStateEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? timerSettings = null,Object? timerStatus = null,Object? timerStage = null,Object? elapsedWarmupTime = null,Object? elapsedTime = null,Object? startTime = freezed,Object? endTime = freezed,}) {
  return _then(TimerStateEntity(
timerSettings: null == timerSettings ? _self.timerSettings : timerSettings // ignore: cast_nullable_to_non_nullable
as TimerSettingsEntity,timerStatus: null == timerStatus ? _self.timerStatus : timerStatus // ignore: cast_nullable_to_non_nullable
as TimerStatus,timerStage: null == timerStage ? _self.timerStage : timerStage // ignore: cast_nullable_to_non_nullable
as TimerStage,elapsedWarmupTime: null == elapsedWarmupTime ? _self.elapsedWarmupTime : elapsedWarmupTime // ignore: cast_nullable_to_non_nullable
as Duration,elapsedTime: null == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as Duration,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of TimerStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimerSettingsEntityCopyWith<$Res> get timerSettings {
  
  return $TimerSettingsEntityCopyWith<$Res>(_self.timerSettings, (value) {
    return _then(_self.copyWith(timerSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [TimerStateEntity].
extension TimerStateEntityPatterns on TimerStateEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerStateEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerStateEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerStateEntity value)  $default,){
final _that = this;
switch (_that) {
case _TimerStateEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerStateEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TimerStateEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TimerSettingsEntity timerSettings,  TimerStatus timerStatus,  TimerStage timerStage,  Duration elapsedWarmupTime,  Duration elapsedTime,  DateTime? startTime,  DateTime? endTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerStateEntity() when $default != null:
return $default(_that.timerSettings,_that.timerStatus,_that.timerStage,_that.elapsedWarmupTime,_that.elapsedTime,_that.startTime,_that.endTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TimerSettingsEntity timerSettings,  TimerStatus timerStatus,  TimerStage timerStage,  Duration elapsedWarmupTime,  Duration elapsedTime,  DateTime? startTime,  DateTime? endTime)  $default,) {final _that = this;
switch (_that) {
case _TimerStateEntity():
return $default(_that.timerSettings,_that.timerStatus,_that.timerStage,_that.elapsedWarmupTime,_that.elapsedTime,_that.startTime,_that.endTime);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TimerSettingsEntity timerSettings,  TimerStatus timerStatus,  TimerStage timerStage,  Duration elapsedWarmupTime,  Duration elapsedTime,  DateTime? startTime,  DateTime? endTime)?  $default,) {final _that = this;
switch (_that) {
case _TimerStateEntity() when $default != null:
return $default(_that.timerSettings,_that.timerStatus,_that.timerStage,_that.elapsedWarmupTime,_that.elapsedTime,_that.startTime,_that.endTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimerStateEntity extends TimerStateEntity {
  const _TimerStateEntity({required this.timerSettings, required this.timerStatus, required this.timerStage, required this.elapsedWarmupTime, required this.elapsedTime, this.startTime, this.endTime}): super._();
  factory _TimerStateEntity.fromJson(Map<String, dynamic> json) => _$TimerStateEntityFromJson(json);

@override final  TimerSettingsEntity timerSettings;
@override final  TimerStatus timerStatus;
@override final  TimerStage timerStage;
@override final  Duration elapsedWarmupTime;
@override final  Duration elapsedTime;
@override final  DateTime? startTime;
@override final  DateTime? endTime;

/// Create a copy of TimerStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerStateEntityCopyWith<_TimerStateEntity> get copyWith => __$TimerStateEntityCopyWithImpl<_TimerStateEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerStateEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerStateEntity&&(identical(other.timerSettings, timerSettings) || other.timerSettings == timerSettings)&&(identical(other.timerStatus, timerStatus) || other.timerStatus == timerStatus)&&(identical(other.timerStage, timerStage) || other.timerStage == timerStage)&&(identical(other.elapsedWarmupTime, elapsedWarmupTime) || other.elapsedWarmupTime == elapsedWarmupTime)&&(identical(other.elapsedTime, elapsedTime) || other.elapsedTime == elapsedTime)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,timerSettings,timerStatus,timerStage,elapsedWarmupTime,elapsedTime,startTime,endTime);
}

@override
String toString() {
    return 'TimerStateEntity(timerSettings: $timerSettings, timerStatus: $timerStatus, timerStage: $timerStage, elapsedWarmupTime: $elapsedWarmupTime, elapsedTime: $elapsedTime, startTime: $startTime, endTime: $endTime)';
}


}

/// @nodoc
abstract mixin class _$TimerStateEntityCopyWith<$Res> implements $TimerStateEntityCopyWith<$Res> {
  factory _$TimerStateEntityCopyWith(_TimerStateEntity value, $Res Function(_TimerStateEntity) _then) = __$TimerStateEntityCopyWithImpl;
@override @useResult
$Res call({
 TimerSettingsEntity timerSettings, TimerStatus timerStatus, TimerStage timerStage, Duration elapsedWarmupTime, Duration elapsedTime, DateTime? startTime, DateTime? endTime
});


@override $TimerSettingsEntityCopyWith<$Res> get timerSettings;

}
/// @nodoc
class __$TimerStateEntityCopyWithImpl<$Res>
    implements _$TimerStateEntityCopyWith<$Res> {
  __$TimerStateEntityCopyWithImpl(this._self, this._then);

  final _TimerStateEntity _self;
  final $Res Function(_TimerStateEntity) _then;

/// Create a copy of TimerStateEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? timerSettings = null,Object? timerStatus = null,Object? timerStage = null,Object? elapsedWarmupTime = null,Object? elapsedTime = null,Object? startTime = freezed,Object? endTime = freezed,}) {
  return _then(_TimerStateEntity(
timerSettings: null == timerSettings ? _self.timerSettings : timerSettings // ignore: cast_nullable_to_non_nullable
as TimerSettingsEntity,timerStatus: null == timerStatus ? _self.timerStatus : timerStatus // ignore: cast_nullable_to_non_nullable
as TimerStatus,timerStage: null == timerStage ? _self.timerStage : timerStage // ignore: cast_nullable_to_non_nullable
as TimerStage,elapsedWarmupTime: null == elapsedWarmupTime ? _self.elapsedWarmupTime : elapsedWarmupTime // ignore: cast_nullable_to_non_nullable
as Duration,elapsedTime: null == elapsedTime ? _self.elapsedTime : elapsedTime // ignore: cast_nullable_to_non_nullable
as Duration,startTime: freezed == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime?,endTime: freezed == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of TimerStateEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TimerSettingsEntityCopyWith<$Res> get timerSettings {
  
  return $TimerSettingsEntityCopyWith<$Res>(_self.timerSettings, (value) {
    return _then(_self.copyWith(timerSettings: value));
  });
}
}

// dart format on
