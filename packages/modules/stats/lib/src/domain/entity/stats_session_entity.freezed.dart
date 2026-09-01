// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_session_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatsSessionEntity implements DiagnosticableTreeMixin {

 String get id; StatsSessionEntityType get type;@DateTimeConverter() DateTime get startTime;@DateTimeConverter() DateTime get endTime;@DurationConverter() Duration get duration;
/// Create a copy of StatsSessionEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsSessionEntityCopyWith<StatsSessionEntity> get copyWith => _$StatsSessionEntityCopyWithImpl<StatsSessionEntity>(this as StatsSessionEntity, _$identity);

  /// Serializes this StatsSessionEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StatsSessionEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('endTime', endTime))..add(DiagnosticsProperty('duration', duration));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsSessionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,startTime,endTime,duration);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StatsSessionEntity(id: $id, type: $type, startTime: $startTime, endTime: $endTime, duration: $duration)';
}


}

/// @nodoc
abstract mixin class $StatsSessionEntityCopyWith<$Res>  {
  factory $StatsSessionEntityCopyWith(StatsSessionEntity value, $Res Function(StatsSessionEntity) _then) = _$StatsSessionEntityCopyWithImpl;
@useResult
$Res call({
 String id, StatsSessionEntityType type,@DateTimeConverter() DateTime startTime,@DateTimeConverter() DateTime endTime,@DurationConverter() Duration duration
});




}
/// @nodoc
class _$StatsSessionEntityCopyWithImpl<$Res>
    implements $StatsSessionEntityCopyWith<$Res> {
  _$StatsSessionEntityCopyWithImpl(this._self, this._then);

  final StatsSessionEntity _self;
  final $Res Function(StatsSessionEntity) _then;

/// Create a copy of StatsSessionEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? startTime = null,Object? endTime = null,Object? duration = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StatsSessionEntityType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [StatsSessionEntity].
extension StatsSessionEntityPatterns on StatsSessionEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StatsSessionEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StatsSessionEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StatsSessionEntity value)  $default,){
final _that = this;
switch (_that) {
case _StatsSessionEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StatsSessionEntity value)?  $default,){
final _that = this;
switch (_that) {
case _StatsSessionEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  StatsSessionEntityType type, @DateTimeConverter()  DateTime startTime, @DateTimeConverter()  DateTime endTime, @DurationConverter()  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StatsSessionEntity() when $default != null:
return $default(_that.id,_that.type,_that.startTime,_that.endTime,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  StatsSessionEntityType type, @DateTimeConverter()  DateTime startTime, @DateTimeConverter()  DateTime endTime, @DurationConverter()  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _StatsSessionEntity():
return $default(_that.id,_that.type,_that.startTime,_that.endTime,_that.duration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  StatsSessionEntityType type, @DateTimeConverter()  DateTime startTime, @DateTimeConverter()  DateTime endTime, @DurationConverter()  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _StatsSessionEntity() when $default != null:
return $default(_that.id,_that.type,_that.startTime,_that.endTime,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StatsSessionEntity extends StatsSessionEntity with DiagnosticableTreeMixin {
  const _StatsSessionEntity({required this.id, required this.type, @DateTimeConverter() required this.startTime, @DateTimeConverter() required this.endTime, @DurationConverter() required this.duration}): super._();
  factory _StatsSessionEntity.fromJson(Map<String, dynamic> json) => _$StatsSessionEntityFromJson(json);

@override final  String id;
@override final  StatsSessionEntityType type;
@override@DateTimeConverter() final  DateTime startTime;
@override@DateTimeConverter() final  DateTime endTime;
@override@DurationConverter() final  Duration duration;

/// Create a copy of StatsSessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StatsSessionEntityCopyWith<_StatsSessionEntity> get copyWith => __$StatsSessionEntityCopyWithImpl<_StatsSessionEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StatsSessionEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'StatsSessionEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('startTime', startTime))..add(DiagnosticsProperty('endTime', endTime))..add(DiagnosticsProperty('duration', duration));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StatsSessionEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,type,startTime,endTime,duration);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'StatsSessionEntity(id: $id, type: $type, startTime: $startTime, endTime: $endTime, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$StatsSessionEntityCopyWith<$Res> implements $StatsSessionEntityCopyWith<$Res> {
  factory _$StatsSessionEntityCopyWith(_StatsSessionEntity value, $Res Function(_StatsSessionEntity) _then) = __$StatsSessionEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, StatsSessionEntityType type,@DateTimeConverter() DateTime startTime,@DateTimeConverter() DateTime endTime,@DurationConverter() Duration duration
});




}
/// @nodoc
class __$StatsSessionEntityCopyWithImpl<$Res>
    implements _$StatsSessionEntityCopyWith<$Res> {
  __$StatsSessionEntityCopyWithImpl(this._self, this._then);

  final _StatsSessionEntity _self;
  final $Res Function(_StatsSessionEntity) _then;

/// Create a copy of StatsSessionEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? startTime = null,Object? endTime = null,Object? duration = null,}) {
  return _then(_StatsSessionEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as StatsSessionEntityType,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as DateTime,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as DateTime,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
