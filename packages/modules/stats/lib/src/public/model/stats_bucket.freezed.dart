// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_bucket.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatsBucket {

 String get id;@DateTimeConverter() DateTime get startDate; int get minutesCount; int get sessionCount;
/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsBucketCopyWith<StatsBucket> get copyWith => _$StatsBucketCopyWithImpl<StatsBucket>(this as StatsBucket, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsBucket&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,startDate,minutesCount,sessionCount);

@override
String toString() {
  return 'StatsBucket(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $StatsBucketCopyWith<$Res>  {
  factory $StatsBucketCopyWith(StatsBucket value, $Res Function(StatsBucket) _then) = _$StatsBucketCopyWithImpl;
@useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$StatsBucketCopyWithImpl<$Res>
    implements $StatsBucketCopyWith<$Res> {
  _$StatsBucketCopyWithImpl(this._self, this._then);

  final StatsBucket _self;
  final $Res Function(StatsBucket) _then;

/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startDate = null,Object? minutesCount = null,Object? sessionCount = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [StatsBucket].
extension StatsBucketPatterns on StatsBucket {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DayStatsBucket value)?  day,TResult Function( WeekStatsBucket value)?  week,TResult Function( MonthStatsBucket value)?  month,TResult Function( YearStatsBucket value)?  year,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DayStatsBucket() when day != null:
return day(_that);case WeekStatsBucket() when week != null:
return week(_that);case MonthStatsBucket() when month != null:
return month(_that);case YearStatsBucket() when year != null:
return year(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DayStatsBucket value)  day,required TResult Function( WeekStatsBucket value)  week,required TResult Function( MonthStatsBucket value)  month,required TResult Function( YearStatsBucket value)  year,}){
final _that = this;
switch (_that) {
case DayStatsBucket():
return day(_that);case WeekStatsBucket():
return week(_that);case MonthStatsBucket():
return month(_that);case YearStatsBucket():
return year(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DayStatsBucket value)?  day,TResult? Function( WeekStatsBucket value)?  week,TResult? Function( MonthStatsBucket value)?  month,TResult? Function( YearStatsBucket value)?  year,}){
final _that = this;
switch (_that) {
case DayStatsBucket() when day != null:
return day(_that);case WeekStatsBucket() when week != null:
return week(_that);case MonthStatsBucket() when month != null:
return month(_that);case YearStatsBucket() when year != null:
return year(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)?  day,TResult Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)?  week,TResult Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)?  month,TResult Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)?  year,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DayStatsBucket() when day != null:
return day(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case WeekStatsBucket() when week != null:
return week(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case MonthStatsBucket() when month != null:
return month(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case YearStatsBucket() when year != null:
return year(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)  day,required TResult Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)  week,required TResult Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)  month,required TResult Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)  year,}) {final _that = this;
switch (_that) {
case DayStatsBucket():
return day(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case WeekStatsBucket():
return week(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case MonthStatsBucket():
return month(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case YearStatsBucket():
return year(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)?  day,TResult? Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)?  week,TResult? Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)?  month,TResult? Function( String id, @DateTimeConverter()  DateTime startDate,  int minutesCount,  int sessionCount)?  year,}) {final _that = this;
switch (_that) {
case DayStatsBucket() when day != null:
return day(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case WeekStatsBucket() when week != null:
return week(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case MonthStatsBucket() when month != null:
return month(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case YearStatsBucket() when year != null:
return year(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case _:
  return null;

}
}

}

/// @nodoc


class DayStatsBucket extends StatsBucket {
  const DayStatsBucket({required this.id, @DateTimeConverter() required this.startDate, this.minutesCount = 0, this.sessionCount = 0}): super._();
  

@override final  String id;
@override@DateTimeConverter() final  DateTime startDate;
@override@JsonKey() final  int minutesCount;
@override@JsonKey() final  int sessionCount;

/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayStatsBucketCopyWith<DayStatsBucket> get copyWith => _$DayStatsBucketCopyWithImpl<DayStatsBucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayStatsBucket&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,startDate,minutesCount,sessionCount);

@override
String toString() {
  return 'StatsBucket.day(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $DayStatsBucketCopyWith<$Res> implements $StatsBucketCopyWith<$Res> {
  factory $DayStatsBucketCopyWith(DayStatsBucket value, $Res Function(DayStatsBucket) _then) = _$DayStatsBucketCopyWithImpl;
@override @useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$DayStatsBucketCopyWithImpl<$Res>
    implements $DayStatsBucketCopyWith<$Res> {
  _$DayStatsBucketCopyWithImpl(this._self, this._then);

  final DayStatsBucket _self;
  final $Res Function(DayStatsBucket) _then;

/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? minutesCount = null,Object? sessionCount = null,}) {
  return _then(DayStatsBucket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class WeekStatsBucket extends StatsBucket {
  const WeekStatsBucket({required this.id, @DateTimeConverter() required this.startDate, this.minutesCount = 0, this.sessionCount = 0}): super._();
  

@override final  String id;
@override@DateTimeConverter() final  DateTime startDate;
@override@JsonKey() final  int minutesCount;
@override@JsonKey() final  int sessionCount;

/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekStatsBucketCopyWith<WeekStatsBucket> get copyWith => _$WeekStatsBucketCopyWithImpl<WeekStatsBucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekStatsBucket&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,startDate,minutesCount,sessionCount);

@override
String toString() {
  return 'StatsBucket.week(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $WeekStatsBucketCopyWith<$Res> implements $StatsBucketCopyWith<$Res> {
  factory $WeekStatsBucketCopyWith(WeekStatsBucket value, $Res Function(WeekStatsBucket) _then) = _$WeekStatsBucketCopyWithImpl;
@override @useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$WeekStatsBucketCopyWithImpl<$Res>
    implements $WeekStatsBucketCopyWith<$Res> {
  _$WeekStatsBucketCopyWithImpl(this._self, this._then);

  final WeekStatsBucket _self;
  final $Res Function(WeekStatsBucket) _then;

/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? minutesCount = null,Object? sessionCount = null,}) {
  return _then(WeekStatsBucket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class MonthStatsBucket extends StatsBucket {
  const MonthStatsBucket({required this.id, @DateTimeConverter() required this.startDate, this.minutesCount = 0, this.sessionCount = 0}): super._();
  

@override final  String id;
@override@DateTimeConverter() final  DateTime startDate;
@override@JsonKey() final  int minutesCount;
@override@JsonKey() final  int sessionCount;

/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthStatsBucketCopyWith<MonthStatsBucket> get copyWith => _$MonthStatsBucketCopyWithImpl<MonthStatsBucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthStatsBucket&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,startDate,minutesCount,sessionCount);

@override
String toString() {
  return 'StatsBucket.month(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $MonthStatsBucketCopyWith<$Res> implements $StatsBucketCopyWith<$Res> {
  factory $MonthStatsBucketCopyWith(MonthStatsBucket value, $Res Function(MonthStatsBucket) _then) = _$MonthStatsBucketCopyWithImpl;
@override @useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$MonthStatsBucketCopyWithImpl<$Res>
    implements $MonthStatsBucketCopyWith<$Res> {
  _$MonthStatsBucketCopyWithImpl(this._self, this._then);

  final MonthStatsBucket _self;
  final $Res Function(MonthStatsBucket) _then;

/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? minutesCount = null,Object? sessionCount = null,}) {
  return _then(MonthStatsBucket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class YearStatsBucket extends StatsBucket {
  const YearStatsBucket({required this.id, @DateTimeConverter() required this.startDate, this.minutesCount = 0, this.sessionCount = 0}): super._();
  

@override final  String id;
@override@DateTimeConverter() final  DateTime startDate;
@override@JsonKey() final  int minutesCount;
@override@JsonKey() final  int sessionCount;

/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YearStatsBucketCopyWith<YearStatsBucket> get copyWith => _$YearStatsBucketCopyWithImpl<YearStatsBucket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YearStatsBucket&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}


@override
int get hashCode => Object.hash(runtimeType,id,startDate,minutesCount,sessionCount);

@override
String toString() {
  return 'StatsBucket.year(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $YearStatsBucketCopyWith<$Res> implements $StatsBucketCopyWith<$Res> {
  factory $YearStatsBucketCopyWith(YearStatsBucket value, $Res Function(YearStatsBucket) _then) = _$YearStatsBucketCopyWithImpl;
@override @useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$YearStatsBucketCopyWithImpl<$Res>
    implements $YearStatsBucketCopyWith<$Res> {
  _$YearStatsBucketCopyWithImpl(this._self, this._then);

  final YearStatsBucket _self;
  final $Res Function(YearStatsBucket) _then;

/// Create a copy of StatsBucket
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? minutesCount = null,Object? sessionCount = null,}) {
  return _then(YearStatsBucket(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
