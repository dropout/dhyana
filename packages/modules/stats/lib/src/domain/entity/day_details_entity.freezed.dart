// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_details_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DayDetailsEntity {

 String get id; DateTime get startDate; List<StatsSessionEntity> get sessions; int get consecutiveDaysCount;
/// Create a copy of DayDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayDetailsEntityCopyWith<DayDetailsEntity> get copyWith => _$DayDetailsEntityCopyWithImpl<DayDetailsEntity>(this as DayDetailsEntity, _$identity);

  /// Serializes this DayDetailsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DayDetailsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayDetailsEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&const DeepCollectionEquality().equals(other.sessions, _this.sessions)&&(identical(other.consecutiveDaysCount, _this.consecutiveDaysCount) || other.consecutiveDaysCount == _this.consecutiveDaysCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DayDetailsEntity;
  return Object.hash(runtimeType,_this.id,_this.startDate,const DeepCollectionEquality().hash(_this.sessions),_this.consecutiveDaysCount);
}

@override
String toString() {
  final _this = this as DayDetailsEntity;
  return 'DayDetailsEntity(id: ${_this.id}, startDate: ${_this.startDate}, sessions: ${_this.sessions}, consecutiveDaysCount: ${_this.consecutiveDaysCount})';
}


}

/// @nodoc
abstract mixin class $DayDetailsEntityCopyWith<$Res>  {
  factory $DayDetailsEntityCopyWith(DayDetailsEntity value, $Res Function(DayDetailsEntity) _then) = _$DayDetailsEntityCopyWithImpl;
@useResult
$Res call({
 String id, DateTime startDate, List<StatsSessionEntity> sessions, int consecutiveDaysCount
});




}
/// @nodoc
class _$DayDetailsEntityCopyWithImpl<$Res>
    implements $DayDetailsEntityCopyWith<$Res> {
  _$DayDetailsEntityCopyWithImpl(this._self, this._then);

  final DayDetailsEntity _self;
  final $Res Function(DayDetailsEntity) _then;

/// Create a copy of DayDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startDate = null,Object? sessions = null,Object? consecutiveDaysCount = null,}) {
  return _then(DayDetailsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<StatsSessionEntity>,consecutiveDaysCount: null == consecutiveDaysCount ? _self.consecutiveDaysCount : consecutiveDaysCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [DayDetailsEntity].
extension DayDetailsEntityPatterns on DayDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _DayDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DayDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  DateTime startDate,  List<StatsSessionEntity> sessions,  int consecutiveDaysCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DayDetailsEntity() when $default != null:
return $default(_that.id,_that.startDate,_that.sessions,_that.consecutiveDaysCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  DateTime startDate,  List<StatsSessionEntity> sessions,  int consecutiveDaysCount)  $default,) {final _that = this;
switch (_that) {
case _DayDetailsEntity():
return $default(_that.id,_that.startDate,_that.sessions,_that.consecutiveDaysCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  DateTime startDate,  List<StatsSessionEntity> sessions,  int consecutiveDaysCount)?  $default,) {final _that = this;
switch (_that) {
case _DayDetailsEntity() when $default != null:
return $default(_that.id,_that.startDate,_that.sessions,_that.consecutiveDaysCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DayDetailsEntity extends DayDetailsEntity {
  const _DayDetailsEntity({required this.id, required this.startDate,  List<StatsSessionEntity> sessions = const [], this.consecutiveDaysCount = 0}): _sessions = sessions,super._();
  factory _DayDetailsEntity.fromJson(Map<String, dynamic> json) => _$DayDetailsEntityFromJson(json);

@override final  String id;
@override final  DateTime startDate;
 final  List<StatsSessionEntity> _sessions;
@override@JsonKey() List<StatsSessionEntity> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@override@JsonKey() final  int consecutiveDaysCount;

/// Create a copy of DayDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayDetailsEntityCopyWith<_DayDetailsEntity> get copyWith => __$DayDetailsEntityCopyWithImpl<_DayDetailsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayDetailsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayDetailsEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&const DeepCollectionEquality().equals(other.sessions, _sessions)&&(identical(other.consecutiveDaysCount, consecutiveDaysCount) || other.consecutiveDaysCount == consecutiveDaysCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startDate,const DeepCollectionEquality().hash(_sessions),consecutiveDaysCount);
}

@override
String toString() {
    return 'DayDetailsEntity(id: $id, startDate: $startDate, sessions: $sessions, consecutiveDaysCount: $consecutiveDaysCount)';
}


}

/// @nodoc
abstract mixin class _$DayDetailsEntityCopyWith<$Res> implements $DayDetailsEntityCopyWith<$Res> {
  factory _$DayDetailsEntityCopyWith(_DayDetailsEntity value, $Res Function(_DayDetailsEntity) _then) = __$DayDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, DateTime startDate, List<StatsSessionEntity> sessions, int consecutiveDaysCount
});




}
/// @nodoc
class __$DayDetailsEntityCopyWithImpl<$Res>
    implements _$DayDetailsEntityCopyWith<$Res> {
  __$DayDetailsEntityCopyWithImpl(this._self, this._then);

  final _DayDetailsEntity _self;
  final $Res Function(_DayDetailsEntity) _then;

/// Create a copy of DayDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? sessions = null,Object? consecutiveDaysCount = null,}) {
  return _then(_DayDetailsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<StatsSessionEntity>,consecutiveDaysCount: null == consecutiveDaysCount ? _self.consecutiveDaysCount : consecutiveDaysCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
