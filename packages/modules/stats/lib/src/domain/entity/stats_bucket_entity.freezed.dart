// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_bucket_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
StatsBucketEntity _$StatsBucketEntityFromJson(
  Map<String, dynamic> json
) {
        switch (json['granularity']) {
                  case 'day':
          return DayStatsBucketEntity.fromJson(
            json
          );
                case 'week':
          return WeekStatsBucketEntity.fromJson(
            json
          );
                case 'month':
          return MonthStatsBucketEntity.fromJson(
            json
          );
                case 'year':
          return YearStatsBucketEntity.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'granularity',
  'StatsBucketEntity',
  'Invalid union type "${json['granularity']}"!'
);
        }
      
}

/// @nodoc
mixin _$StatsBucketEntity {

 String get id;@DateTimeConverter() DateTime get startDate; int get minutesCount; int get sessionCount;
/// Create a copy of StatsBucketEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsBucketEntityCopyWith<StatsBucketEntity> get copyWith => _$StatsBucketEntityCopyWithImpl<StatsBucketEntity>(this as StatsBucketEntity, _$identity);

  /// Serializes this StatsBucketEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as StatsBucketEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsBucketEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.startDate, _this.startDate) || other.startDate == _this.startDate)&&(identical(other.minutesCount, _this.minutesCount) || other.minutesCount == _this.minutesCount)&&(identical(other.sessionCount, _this.sessionCount) || other.sessionCount == _this.sessionCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as StatsBucketEntity;
  return Object.hash(runtimeType,_this.id,_this.startDate,_this.minutesCount,_this.sessionCount);
}

@override
String toString() {
  final _this = this as StatsBucketEntity;
  return 'StatsBucketEntity(id: ${_this.id}, startDate: ${_this.startDate}, minutesCount: ${_this.minutesCount}, sessionCount: ${_this.sessionCount})';
}


}

/// @nodoc
abstract mixin class $StatsBucketEntityCopyWith<$Res>  {
  factory $StatsBucketEntityCopyWith(StatsBucketEntity value, $Res Function(StatsBucketEntity) _then) = _$StatsBucketEntityCopyWithImpl;
@useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$StatsBucketEntityCopyWithImpl<$Res>
    implements $StatsBucketEntityCopyWith<$Res> {
  _$StatsBucketEntityCopyWithImpl(this._self, this._then);

  final StatsBucketEntity _self;
  final $Res Function(StatsBucketEntity) _then;

/// Create a copy of StatsBucketEntity
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


/// Adds pattern-matching-related methods to [StatsBucketEntity].
extension StatsBucketEntityPatterns on StatsBucketEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DayStatsBucketEntity value)?  day,TResult Function( WeekStatsBucketEntity value)?  week,TResult Function( MonthStatsBucketEntity value)?  month,TResult Function( YearStatsBucketEntity value)?  year,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DayStatsBucketEntity() when day != null:
return day(_that);case WeekStatsBucketEntity() when week != null:
return week(_that);case MonthStatsBucketEntity() when month != null:
return month(_that);case YearStatsBucketEntity() when year != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DayStatsBucketEntity value)  day,required TResult Function( WeekStatsBucketEntity value)  week,required TResult Function( MonthStatsBucketEntity value)  month,required TResult Function( YearStatsBucketEntity value)  year,}){
final _that = this;
switch (_that) {
case DayStatsBucketEntity():
return day(_that);case WeekStatsBucketEntity():
return week(_that);case MonthStatsBucketEntity():
return month(_that);case YearStatsBucketEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DayStatsBucketEntity value)?  day,TResult? Function( WeekStatsBucketEntity value)?  week,TResult? Function( MonthStatsBucketEntity value)?  month,TResult? Function( YearStatsBucketEntity value)?  year,}){
final _that = this;
switch (_that) {
case DayStatsBucketEntity() when day != null:
return day(_that);case WeekStatsBucketEntity() when week != null:
return week(_that);case MonthStatsBucketEntity() when month != null:
return month(_that);case YearStatsBucketEntity() when year != null:
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
case DayStatsBucketEntity() when day != null:
return day(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case WeekStatsBucketEntity() when week != null:
return week(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case MonthStatsBucketEntity() when month != null:
return month(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case YearStatsBucketEntity() when year != null:
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
case DayStatsBucketEntity():
return day(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case WeekStatsBucketEntity():
return week(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case MonthStatsBucketEntity():
return month(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case YearStatsBucketEntity():
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
case DayStatsBucketEntity() when day != null:
return day(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case WeekStatsBucketEntity() when week != null:
return week(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case MonthStatsBucketEntity() when month != null:
return month(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case YearStatsBucketEntity() when year != null:
return year(_that.id,_that.startDate,_that.minutesCount,_that.sessionCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class DayStatsBucketEntity extends StatsBucketEntity {
  const DayStatsBucketEntity({required this.id, @DateTimeConverter() required this.startDate, this.minutesCount = 0, this.sessionCount = 0,  String? $type}): $type = $type ?? 'day',super._();
  factory DayStatsBucketEntity.fromJson(Map<String, dynamic> json) => _$DayStatsBucketEntityFromJson(json);

@override final  String id;
@override@DateTimeConverter() final  DateTime startDate;
@override@JsonKey() final  int minutesCount;
@override@JsonKey() final  int sessionCount;

@JsonKey(name: 'granularity')
final String $type;


/// Create a copy of StatsBucketEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayStatsBucketEntityCopyWith<DayStatsBucketEntity> get copyWith => _$DayStatsBucketEntityCopyWithImpl<DayStatsBucketEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DayStatsBucketEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DayStatsBucketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startDate,minutesCount,sessionCount);
}

@override
String toString() {
    return 'StatsBucketEntity.day(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $DayStatsBucketEntityCopyWith<$Res> implements $StatsBucketEntityCopyWith<$Res> {
  factory $DayStatsBucketEntityCopyWith(DayStatsBucketEntity value, $Res Function(DayStatsBucketEntity) _then) = _$DayStatsBucketEntityCopyWithImpl;
@override @useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$DayStatsBucketEntityCopyWithImpl<$Res>
    implements $DayStatsBucketEntityCopyWith<$Res> {
  _$DayStatsBucketEntityCopyWithImpl(this._self, this._then);

  final DayStatsBucketEntity _self;
  final $Res Function(DayStatsBucketEntity) _then;

/// Create a copy of StatsBucketEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? minutesCount = null,Object? sessionCount = null,}) {
  return _then(DayStatsBucketEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class WeekStatsBucketEntity extends StatsBucketEntity {
  const WeekStatsBucketEntity({required this.id, @DateTimeConverter() required this.startDate, this.minutesCount = 0, this.sessionCount = 0,  String? $type}): $type = $type ?? 'week',super._();
  factory WeekStatsBucketEntity.fromJson(Map<String, dynamic> json) => _$WeekStatsBucketEntityFromJson(json);

@override final  String id;
@override@DateTimeConverter() final  DateTime startDate;
@override@JsonKey() final  int minutesCount;
@override@JsonKey() final  int sessionCount;

@JsonKey(name: 'granularity')
final String $type;


/// Create a copy of StatsBucketEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WeekStatsBucketEntityCopyWith<WeekStatsBucketEntity> get copyWith => _$WeekStatsBucketEntityCopyWithImpl<WeekStatsBucketEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WeekStatsBucketEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is WeekStatsBucketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startDate,minutesCount,sessionCount);
}

@override
String toString() {
    return 'StatsBucketEntity.week(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $WeekStatsBucketEntityCopyWith<$Res> implements $StatsBucketEntityCopyWith<$Res> {
  factory $WeekStatsBucketEntityCopyWith(WeekStatsBucketEntity value, $Res Function(WeekStatsBucketEntity) _then) = _$WeekStatsBucketEntityCopyWithImpl;
@override @useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$WeekStatsBucketEntityCopyWithImpl<$Res>
    implements $WeekStatsBucketEntityCopyWith<$Res> {
  _$WeekStatsBucketEntityCopyWithImpl(this._self, this._then);

  final WeekStatsBucketEntity _self;
  final $Res Function(WeekStatsBucketEntity) _then;

/// Create a copy of StatsBucketEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? minutesCount = null,Object? sessionCount = null,}) {
  return _then(WeekStatsBucketEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class MonthStatsBucketEntity extends StatsBucketEntity {
  const MonthStatsBucketEntity({required this.id, @DateTimeConverter() required this.startDate, this.minutesCount = 0, this.sessionCount = 0,  String? $type}): $type = $type ?? 'month',super._();
  factory MonthStatsBucketEntity.fromJson(Map<String, dynamic> json) => _$MonthStatsBucketEntityFromJson(json);

@override final  String id;
@override@DateTimeConverter() final  DateTime startDate;
@override@JsonKey() final  int minutesCount;
@override@JsonKey() final  int sessionCount;

@JsonKey(name: 'granularity')
final String $type;


/// Create a copy of StatsBucketEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthStatsBucketEntityCopyWith<MonthStatsBucketEntity> get copyWith => _$MonthStatsBucketEntityCopyWithImpl<MonthStatsBucketEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MonthStatsBucketEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthStatsBucketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startDate,minutesCount,sessionCount);
}

@override
String toString() {
    return 'StatsBucketEntity.month(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $MonthStatsBucketEntityCopyWith<$Res> implements $StatsBucketEntityCopyWith<$Res> {
  factory $MonthStatsBucketEntityCopyWith(MonthStatsBucketEntity value, $Res Function(MonthStatsBucketEntity) _then) = _$MonthStatsBucketEntityCopyWithImpl;
@override @useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$MonthStatsBucketEntityCopyWithImpl<$Res>
    implements $MonthStatsBucketEntityCopyWith<$Res> {
  _$MonthStatsBucketEntityCopyWithImpl(this._self, this._then);

  final MonthStatsBucketEntity _self;
  final $Res Function(MonthStatsBucketEntity) _then;

/// Create a copy of StatsBucketEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? minutesCount = null,Object? sessionCount = null,}) {
  return _then(MonthStatsBucketEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
@JsonSerializable()

class YearStatsBucketEntity extends StatsBucketEntity {
  const YearStatsBucketEntity({required this.id, @DateTimeConverter() required this.startDate, this.minutesCount = 0, this.sessionCount = 0,  String? $type}): $type = $type ?? 'year',super._();
  factory YearStatsBucketEntity.fromJson(Map<String, dynamic> json) => _$YearStatsBucketEntityFromJson(json);

@override final  String id;
@override@DateTimeConverter() final  DateTime startDate;
@override@JsonKey() final  int minutesCount;
@override@JsonKey() final  int sessionCount;

@JsonKey(name: 'granularity')
final String $type;


/// Create a copy of StatsBucketEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YearStatsBucketEntityCopyWith<YearStatsBucketEntity> get copyWith => _$YearStatsBucketEntityCopyWithImpl<YearStatsBucketEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$YearStatsBucketEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is YearStatsBucketEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.minutesCount, minutesCount) || other.minutesCount == minutesCount)&&(identical(other.sessionCount, sessionCount) || other.sessionCount == sessionCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,startDate,minutesCount,sessionCount);
}

@override
String toString() {
    return 'StatsBucketEntity.year(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
}


}

/// @nodoc
abstract mixin class $YearStatsBucketEntityCopyWith<$Res> implements $StatsBucketEntityCopyWith<$Res> {
  factory $YearStatsBucketEntityCopyWith(YearStatsBucketEntity value, $Res Function(YearStatsBucketEntity) _then) = _$YearStatsBucketEntityCopyWithImpl;
@override @useResult
$Res call({
 String id,@DateTimeConverter() DateTime startDate, int minutesCount, int sessionCount
});




}
/// @nodoc
class _$YearStatsBucketEntityCopyWithImpl<$Res>
    implements $YearStatsBucketEntityCopyWith<$Res> {
  _$YearStatsBucketEntityCopyWithImpl(this._self, this._then);

  final YearStatsBucketEntity _self;
  final $Res Function(YearStatsBucketEntity) _then;

/// Create a copy of StatsBucketEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startDate = null,Object? minutesCount = null,Object? sessionCount = null,}) {
  return _then(YearStatsBucketEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,minutesCount: null == minutesCount ? _self.minutesCount : minutesCount // ignore: cast_nullable_to_non_nullable
as int,sessionCount: null == sessionCount ? _self.sessionCount : sessionCount // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
