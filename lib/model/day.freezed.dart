// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Day implements DiagnosticableTreeMixin {

 String get id;@DateTimeConverter() DateTime get startDate; List<Session> get sessions; int get minutesCount; int get sessionCount; int get consecutiveDaysCount;
/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayCopyWith<Day> get copyWith => _$DayCopyWithImpl<Day>(this as Day, _$identity);

  /// Serializes this Day to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Day'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('startDate', startDate))..add(DiagnosticsProperty('sessions', sessions))..add(DiagnosticsProperty('minutesCount', minutesCount))..add(DiagnosticsProperty('sessionCount', sessionCount))..add(DiagnosticsProperty('consecutiveDaysCount', consecutiveDaysCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Day&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&const DeepCollectionEquality().equals(other.sessions, sessions)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount)&&(identical(other.consecutiveDaysCount, consecutiveDaysCount) || other.consecutiveDaysCount == consecutiveDaysCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,const DeepCollectionEquality().hash(sessions),minutesCount,sessionCount,consecutiveDaysCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Day(id: $id, startDate: $startDate, sessions: $sessions, minutesCount: $minutesCount, sessionCount: $sessionCount, consecutiveDaysCount: $consecutiveDaysCount)';
}


}

/// @nodoc
abstract mixin class $DayCopyWith<$Res>  {
  factory $DayCopyWith(Day value, $Res Function(Day) _then) = _$DayCopyWithImpl;
@useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, List<Session> sessions, int minutesCount, int sessionCount, int consecutiveDaysCount
});




}
/// @nodoc
class _$DayCopyWithImpl<$Res>
    implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._self, this._then);

  final Day _self;
  final $Res Function(Day) _then;

/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startDate = null,Object? sessions = null,Object? minutesCount = null,Object? sessionCount = null,Object? consecutiveDaysCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,consecutiveDaysCount: null == consecutiveDaysCount ? _self.consecutiveDaysCount : consecutiveDaysCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Day].
extension DayPatterns on Day {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Day value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Day() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Day value)  $default,){
final _that = this;
switch (_that) {
case _Day():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Day value)?  $default,){
final _that = this;
switch (_that) {
case _Day() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @DateTimeConverter()  DateTime startDate,  List<Session> sessions,  int minutesCount,  int sessionCount,  int consecutiveDaysCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Day() when $default != null:
return $default(_that.id,_that.startDate,_that.sessions,_that.minutesCount,_that.sessionCount,_that.consecutiveDaysCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @DateTimeConverter()  DateTime startDate,  List<Session> sessions,  int minutesCount,  int sessionCount,  int consecutiveDaysCount)  $default,) {final _that = this;
switch (_that) {
case _Day():
return $default(_that.id,_that.startDate,_that.sessions,_that.minutesCount,_that.sessionCount,_that.consecutiveDaysCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @DateTimeConverter()  DateTime startDate,  List<Session> sessions,  int minutesCount,  int sessionCount,  int consecutiveDaysCount)?  $default,) {final _that = this;
switch (_that) {
case _Day() when $default != null:
return $default(_that.id,_that.startDate,_that.sessions,_that.minutesCount,_that.sessionCount,_that.consecutiveDaysCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Day extends Day with DiagnosticableTreeMixin {
  const _Day({required this.id, @DateTimeConverter() required this.startDate, final  List<Session> sessions = const [], this.minutesCount = 0, this.sessionCount = 0, this.consecutiveDaysCount = 0}): _sessions = sessions,super._();
  factory _Day.fromJson(Map<String, dynamic> json) => _$DayFromJson(json);

@override final  String id;
@override@DateTimeConverter() final  DateTime startDate;
 final  List<Session> _sessions;
@override@JsonKey() List<Session> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}

@override@JsonKey() final  int minutesCount;
@override@JsonKey() final  int sessionCount;
@override@JsonKey() final  int consecutiveDaysCount;

/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayCopyWith<_Day> get copyWith => __$DayCopyWithImpl<_Day>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Day'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('startDate', startDate))..add(DiagnosticsProperty('sessions', sessions))..add(DiagnosticsProperty('minutesCount', minutesCount))..add(DiagnosticsProperty('sessionCount', sessionCount))..add(DiagnosticsProperty('consecutiveDaysCount', consecutiveDaysCount));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Day&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&const DeepCollectionEquality().equals(other._sessions, _sessions)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount)&&(identical(other.consecutiveDaysCount, consecutiveDaysCount) || other.consecutiveDaysCount == consecutiveDaysCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startDate,const DeepCollectionEquality().hash(_sessions),minutesCount,sessionCount,consecutiveDaysCount);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Day(id: $id, startDate: $startDate, sessions: $sessions, minutesCount: $minutesCount, sessionCount: $sessionCount, consecutiveDaysCount: $consecutiveDaysCount)';
}


}

/// @nodoc
abstract mixin class _$DayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$DayCopyWith(_Day value, $Res Function(_Day) _then) = __$DayCopyWithImpl;
@override @useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, List<Session> sessions, int minutesCount, int sessionCount, int consecutiveDaysCount
});




}
/// @nodoc
class __$DayCopyWithImpl<$Res>
    implements _$DayCopyWith<$Res> {
  __$DayCopyWithImpl(this._self, this._then);

  final _Day _self;
  final $Res Function(_Day) _then;

/// Create a copy of Day
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? sessions = null,Object? minutesCount = null,Object? sessionCount = null,Object? consecutiveDaysCount = null,}) {
  return _then(_Day(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<Session>,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,consecutiveDaysCount: null == consecutiveDaysCount ? _self.consecutiveDaysCount : consecutiveDaysCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
