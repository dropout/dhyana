// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerSettingsEntity {

@DurationConverter() Duration get warmup;@DurationConverter() Duration get duration; int get intervalCount; Sound get intervalSound; Sound get startingSound; Sound get endingSound;@DateTimeOrNullConverter() DateTime? get lastUsed;
/// Create a copy of TimerSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSettingsEntityCopyWith<TimerSettingsEntity> get copyWith => _$TimerSettingsEntityCopyWithImpl<TimerSettingsEntity>(this as TimerSettingsEntity, _$identity);

  /// Serializes this TimerSettingsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TimerSettingsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsEntity&&(identical(other.warmup, _this.warmup) || other.warmup == _this.warmup)&&(identical(other.duration, _this.duration) || other.duration == _this.duration)&&(identical(other.intervalCount, _this.intervalCount) || other.intervalCount == _this.intervalCount)&&(identical(other.intervalSound, _this.intervalSound) || other.intervalSound == _this.intervalSound)&&(identical(other.startingSound, _this.startingSound) || other.startingSound == _this.startingSound)&&(identical(other.endingSound, _this.endingSound) || other.endingSound == _this.endingSound)&&(identical(other.lastUsed, _this.lastUsed) || other.lastUsed == _this.lastUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TimerSettingsEntity;
  return Object.hash(runtimeType,_this.warmup,_this.duration,_this.intervalCount,_this.intervalSound,_this.startingSound,_this.endingSound,_this.lastUsed);
}

@override
String toString() {
  final _this = this as TimerSettingsEntity;
  return 'TimerSettingsEntity(warmup: ${_this.warmup}, duration: ${_this.duration}, intervalCount: ${_this.intervalCount}, intervalSound: ${_this.intervalSound}, startingSound: ${_this.startingSound}, endingSound: ${_this.endingSound}, lastUsed: ${_this.lastUsed})';
}


}

/// @nodoc
abstract mixin class $TimerSettingsEntityCopyWith<$Res>  {
  factory $TimerSettingsEntityCopyWith(TimerSettingsEntity value, $Res Function(TimerSettingsEntity) _then) = _$TimerSettingsEntityCopyWithImpl;
@useResult
$Res call({
@DurationConverter() Duration warmup,@DurationConverter() Duration duration, int intervalCount, Sound intervalSound, Sound startingSound, Sound endingSound,@DateTimeOrNullConverter() DateTime? lastUsed
});




}
/// @nodoc
class _$TimerSettingsEntityCopyWithImpl<$Res>
    implements $TimerSettingsEntityCopyWith<$Res> {
  _$TimerSettingsEntityCopyWithImpl(this._self, this._then);

  final TimerSettingsEntity _self;
  final $Res Function(TimerSettingsEntity) _then;

/// Create a copy of TimerSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? warmup = null,Object? duration = null,Object? intervalCount = null,Object? intervalSound = null,Object? startingSound = null,Object? endingSound = null,Object? lastUsed = freezed,}) {
  return _then(TimerSettingsEntity(
warmup: null == warmup ? _self.warmup : warmup // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,intervalCount: null == intervalCount ? _self.intervalCount : intervalCount // ignore: cast_nullable_to_non_nullable
as int,intervalSound: null == intervalSound ? _self.intervalSound : intervalSound // ignore: cast_nullable_to_non_nullable
as Sound,startingSound: null == startingSound ? _self.startingSound : startingSound // ignore: cast_nullable_to_non_nullable
as Sound,endingSound: null == endingSound ? _self.endingSound : endingSound // ignore: cast_nullable_to_non_nullable
as Sound,lastUsed: freezed == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimerSettingsEntity].
extension TimerSettingsEntityPatterns on TimerSettingsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerSettingsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerSettingsEntity value)  $default,){
final _that = this;
switch (_that) {
case _TimerSettingsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerSettingsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TimerSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DurationConverter()  Duration warmup, @DurationConverter()  Duration duration,  int intervalCount,  Sound intervalSound,  Sound startingSound,  Sound endingSound, @DateTimeOrNullConverter()  DateTime? lastUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerSettingsEntity() when $default != null:
return $default(_that.warmup,_that.duration,_that.intervalCount,_that.intervalSound,_that.startingSound,_that.endingSound,_that.lastUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DurationConverter()  Duration warmup, @DurationConverter()  Duration duration,  int intervalCount,  Sound intervalSound,  Sound startingSound,  Sound endingSound, @DateTimeOrNullConverter()  DateTime? lastUsed)  $default,) {final _that = this;
switch (_that) {
case _TimerSettingsEntity():
return $default(_that.warmup,_that.duration,_that.intervalCount,_that.intervalSound,_that.startingSound,_that.endingSound,_that.lastUsed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DurationConverter()  Duration warmup, @DurationConverter()  Duration duration,  int intervalCount,  Sound intervalSound,  Sound startingSound,  Sound endingSound, @DateTimeOrNullConverter()  DateTime? lastUsed)?  $default,) {final _that = this;
switch (_that) {
case _TimerSettingsEntity() when $default != null:
return $default(_that.warmup,_that.duration,_that.intervalCount,_that.intervalSound,_that.startingSound,_that.endingSound,_that.lastUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimerSettingsEntity extends TimerSettingsEntity {
  const _TimerSettingsEntity({@DurationConverter() this.warmup = const Duration(minutes: 1), @DurationConverter() this.duration = const Duration(minutes: 10), this.intervalCount = 0, this.intervalSound = Sound.triangle, this.startingSound = Sound.smallBell, this.endingSound = Sound.smallBell, @DateTimeOrNullConverter() this.lastUsed}): super._();
  factory _TimerSettingsEntity.fromJson(Map<String, dynamic> json) => _$TimerSettingsEntityFromJson(json);

@override@JsonKey()@DurationConverter() final  Duration warmup;
@override@JsonKey()@DurationConverter() final  Duration duration;
@override@JsonKey() final  int intervalCount;
@override@JsonKey() final  Sound intervalSound;
@override@JsonKey() final  Sound startingSound;
@override@JsonKey() final  Sound endingSound;
@override@DateTimeOrNullConverter() final  DateTime? lastUsed;

/// Create a copy of TimerSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerSettingsEntityCopyWith<_TimerSettingsEntity> get copyWith => __$TimerSettingsEntityCopyWithImpl<_TimerSettingsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerSettingsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerSettingsEntity&&(identical(other.warmup, warmup) || other.warmup == warmup)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.intervalCount, intervalCount) || other.intervalCount == intervalCount)&&(identical(other.intervalSound, intervalSound) || other.intervalSound == intervalSound)&&(identical(other.startingSound, startingSound) || other.startingSound == startingSound)&&(identical(other.endingSound, endingSound) || other.endingSound == endingSound)&&(identical(other.lastUsed, lastUsed) || other.lastUsed == lastUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,warmup,duration,intervalCount,intervalSound,startingSound,endingSound,lastUsed);
}

@override
String toString() {
    return 'TimerSettingsEntity(warmup: $warmup, duration: $duration, intervalCount: $intervalCount, intervalSound: $intervalSound, startingSound: $startingSound, endingSound: $endingSound, lastUsed: $lastUsed)';
}


}

/// @nodoc
abstract mixin class _$TimerSettingsEntityCopyWith<$Res> implements $TimerSettingsEntityCopyWith<$Res> {
  factory _$TimerSettingsEntityCopyWith(_TimerSettingsEntity value, $Res Function(_TimerSettingsEntity) _then) = __$TimerSettingsEntityCopyWithImpl;
@override @useResult
$Res call({
@DurationConverter() Duration warmup,@DurationConverter() Duration duration, int intervalCount, Sound intervalSound, Sound startingSound, Sound endingSound,@DateTimeOrNullConverter() DateTime? lastUsed
});




}
/// @nodoc
class __$TimerSettingsEntityCopyWithImpl<$Res>
    implements _$TimerSettingsEntityCopyWith<$Res> {
  __$TimerSettingsEntityCopyWithImpl(this._self, this._then);

  final _TimerSettingsEntity _self;
  final $Res Function(_TimerSettingsEntity) _then;

/// Create a copy of TimerSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? warmup = null,Object? duration = null,Object? intervalCount = null,Object? intervalSound = null,Object? startingSound = null,Object? endingSound = null,Object? lastUsed = freezed,}) {
  return _then(_TimerSettingsEntity(
warmup: null == warmup ? _self.warmup : warmup // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,intervalCount: null == intervalCount ? _self.intervalCount : intervalCount // ignore: cast_nullable_to_non_nullable
as int,intervalSound: null == intervalSound ? _self.intervalSound : intervalSound // ignore: cast_nullable_to_non_nullable
as Sound,startingSound: null == startingSound ? _self.startingSound : startingSound // ignore: cast_nullable_to_non_nullable
as Sound,endingSound: null == endingSound ? _self.endingSound : endingSound // ignore: cast_nullable_to_non_nullable
as Sound,lastUsed: freezed == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
