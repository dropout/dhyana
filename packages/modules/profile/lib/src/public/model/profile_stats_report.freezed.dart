// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_stats_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileStatsReport {

 ConsecutiveDays get consecutiveDays; MilestoneProgress get milestoneProgress; int get milestoneCount; int get completedMinutesCount; int get completedSessionsCount; int get completedDaysCount;@DateTimeOrNullConverter() DateTime? get firstSessionDate;@DateTimeOrNullConverter() DateTime? get lastSessionDate;
/// Create a copy of ProfileStatsReport
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStatsReportCopyWith<ProfileStatsReport> get copyWith => _$ProfileStatsReportCopyWithImpl<ProfileStatsReport>(this as ProfileStatsReport, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileStatsReport&&(identical(other.consecutiveDays, consecutiveDays) || other.consecutiveDays == consecutiveDays)&&(identical(other.milestoneProgress, milestoneProgress) || other.milestoneProgress == milestoneProgress)&&(identical(other.milestoneCount, milestoneCount) || other.milestoneCount == milestoneCount)&&(identical(other.completedMinutesCount, completedMinutesCount) || other.completedMinutesCount == completedMinutesCount)&&(identical(other.completedSessionsCount, completedSessionsCount) || other.completedSessionsCount == completedSessionsCount)&&(identical(other.completedDaysCount, completedDaysCount) || other.completedDaysCount == completedDaysCount)&&(identical(other.firstSessionDate, firstSessionDate) || other.firstSessionDate == firstSessionDate)&&(identical(other.lastSessionDate, lastSessionDate) || other.lastSessionDate == lastSessionDate));
}


@override
int get hashCode => Object.hash(runtimeType,consecutiveDays,milestoneProgress,milestoneCount,completedMinutesCount,completedSessionsCount,completedDaysCount,firstSessionDate,lastSessionDate);

@override
String toString() {
  return 'ProfileStatsReport(consecutiveDays: $consecutiveDays, milestoneProgress: $milestoneProgress, milestoneCount: $milestoneCount, completedMinutesCount: $completedMinutesCount, completedSessionsCount: $completedSessionsCount, completedDaysCount: $completedDaysCount, firstSessionDate: $firstSessionDate, lastSessionDate: $lastSessionDate)';
}


}

/// @nodoc
abstract mixin class $ProfileStatsReportCopyWith<$Res>  {
  factory $ProfileStatsReportCopyWith(ProfileStatsReport value, $Res Function(ProfileStatsReport) _then) = _$ProfileStatsReportCopyWithImpl;
@useResult
$Res call({
 ConsecutiveDays consecutiveDays, MilestoneProgress milestoneProgress, int milestoneCount, int completedMinutesCount, int completedSessionsCount, int completedDaysCount,@DateTimeOrNullConverter() DateTime? firstSessionDate,@DateTimeOrNullConverter() DateTime? lastSessionDate
});


$ConsecutiveDaysCopyWith<$Res> get consecutiveDays;$MilestoneProgressCopyWith<$Res> get milestoneProgress;

}
/// @nodoc
class _$ProfileStatsReportCopyWithImpl<$Res>
    implements $ProfileStatsReportCopyWith<$Res> {
  _$ProfileStatsReportCopyWithImpl(this._self, this._then);

  final ProfileStatsReport _self;
  final $Res Function(ProfileStatsReport) _then;

/// Create a copy of ProfileStatsReport
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consecutiveDays = null,Object? milestoneProgress = null,Object? milestoneCount = null,Object? completedMinutesCount = null,Object? completedSessionsCount = null,Object? completedDaysCount = null,Object? firstSessionDate = freezed,Object? lastSessionDate = freezed,}) {
  return _then(_self.copyWith(
consecutiveDays: null == consecutiveDays ? _self.consecutiveDays : consecutiveDays // ignore: cast_nullable_to_non_nullable
as ConsecutiveDays,milestoneProgress: null == milestoneProgress ? _self.milestoneProgress : milestoneProgress // ignore: cast_nullable_to_non_nullable
as MilestoneProgress,milestoneCount: null == milestoneCount ? _self.milestoneCount : milestoneCount // ignore: cast_nullable_to_non_nullable
as int,completedMinutesCount: null == completedMinutesCount ? _self.completedMinutesCount : completedMinutesCount // ignore: cast_nullable_to_non_nullable
as int,completedSessionsCount: null == completedSessionsCount ? _self.completedSessionsCount : completedSessionsCount // ignore: cast_nullable_to_non_nullable
as int,completedDaysCount: null == completedDaysCount ? _self.completedDaysCount : completedDaysCount // ignore: cast_nullable_to_non_nullable
as int,firstSessionDate: freezed == firstSessionDate ? _self.firstSessionDate : firstSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSessionDate: freezed == lastSessionDate ? _self.lastSessionDate : lastSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ProfileStatsReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsecutiveDaysCopyWith<$Res> get consecutiveDays {
  
  return $ConsecutiveDaysCopyWith<$Res>(_self.consecutiveDays, (value) {
    return _then(_self.copyWith(consecutiveDays: value));
  });
}/// Create a copy of ProfileStatsReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneProgressCopyWith<$Res> get milestoneProgress {
  
  return $MilestoneProgressCopyWith<$Res>(_self.milestoneProgress, (value) {
    return _then(_self.copyWith(milestoneProgress: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileStatsReport].
extension ProfileStatsReportPatterns on ProfileStatsReport {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileStatsReport value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileStatsReport() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileStatsReport value)  $default,){
final _that = this;
switch (_that) {
case _ProfileStatsReport():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileStatsReport value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileStatsReport() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConsecutiveDays consecutiveDays,  MilestoneProgress milestoneProgress,  int milestoneCount,  int completedMinutesCount,  int completedSessionsCount,  int completedDaysCount, @DateTimeOrNullConverter()  DateTime? firstSessionDate, @DateTimeOrNullConverter()  DateTime? lastSessionDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileStatsReport() when $default != null:
return $default(_that.consecutiveDays,_that.milestoneProgress,_that.milestoneCount,_that.completedMinutesCount,_that.completedSessionsCount,_that.completedDaysCount,_that.firstSessionDate,_that.lastSessionDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConsecutiveDays consecutiveDays,  MilestoneProgress milestoneProgress,  int milestoneCount,  int completedMinutesCount,  int completedSessionsCount,  int completedDaysCount, @DateTimeOrNullConverter()  DateTime? firstSessionDate, @DateTimeOrNullConverter()  DateTime? lastSessionDate)  $default,) {final _that = this;
switch (_that) {
case _ProfileStatsReport():
return $default(_that.consecutiveDays,_that.milestoneProgress,_that.milestoneCount,_that.completedMinutesCount,_that.completedSessionsCount,_that.completedDaysCount,_that.firstSessionDate,_that.lastSessionDate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConsecutiveDays consecutiveDays,  MilestoneProgress milestoneProgress,  int milestoneCount,  int completedMinutesCount,  int completedSessionsCount,  int completedDaysCount, @DateTimeOrNullConverter()  DateTime? firstSessionDate, @DateTimeOrNullConverter()  DateTime? lastSessionDate)?  $default,) {final _that = this;
switch (_that) {
case _ProfileStatsReport() when $default != null:
return $default(_that.consecutiveDays,_that.milestoneProgress,_that.milestoneCount,_that.completedMinutesCount,_that.completedSessionsCount,_that.completedDaysCount,_that.firstSessionDate,_that.lastSessionDate);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileStatsReport implements ProfileStatsReport {
  const _ProfileStatsReport({this.consecutiveDays = const ConsecutiveDays(), this.milestoneProgress = const MilestoneProgress(), this.milestoneCount = 0, this.completedMinutesCount = 0, this.completedSessionsCount = 0, this.completedDaysCount = 0, @DateTimeOrNullConverter() this.firstSessionDate, @DateTimeOrNullConverter() this.lastSessionDate});
  

@override@JsonKey() final  ConsecutiveDays consecutiveDays;
@override@JsonKey() final  MilestoneProgress milestoneProgress;
@override@JsonKey() final  int milestoneCount;
@override@JsonKey() final  int completedMinutesCount;
@override@JsonKey() final  int completedSessionsCount;
@override@JsonKey() final  int completedDaysCount;
@override@DateTimeOrNullConverter() final  DateTime? firstSessionDate;
@override@DateTimeOrNullConverter() final  DateTime? lastSessionDate;

/// Create a copy of ProfileStatsReport
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStatsReportCopyWith<_ProfileStatsReport> get copyWith => __$ProfileStatsReportCopyWithImpl<_ProfileStatsReport>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileStatsReport&&(identical(other.consecutiveDays, consecutiveDays) || other.consecutiveDays == consecutiveDays)&&(identical(other.milestoneProgress, milestoneProgress) || other.milestoneProgress == milestoneProgress)&&(identical(other.milestoneCount, milestoneCount) || other.milestoneCount == milestoneCount)&&(identical(other.completedMinutesCount, completedMinutesCount) || other.completedMinutesCount == completedMinutesCount)&&(identical(other.completedSessionsCount, completedSessionsCount) || other.completedSessionsCount == completedSessionsCount)&&(identical(other.completedDaysCount, completedDaysCount) || other.completedDaysCount == completedDaysCount)&&(identical(other.firstSessionDate, firstSessionDate) || other.firstSessionDate == firstSessionDate)&&(identical(other.lastSessionDate, lastSessionDate) || other.lastSessionDate == lastSessionDate));
}


@override
int get hashCode => Object.hash(runtimeType,consecutiveDays,milestoneProgress,milestoneCount,completedMinutesCount,completedSessionsCount,completedDaysCount,firstSessionDate,lastSessionDate);

@override
String toString() {
  return 'ProfileStatsReport(consecutiveDays: $consecutiveDays, milestoneProgress: $milestoneProgress, milestoneCount: $milestoneCount, completedMinutesCount: $completedMinutesCount, completedSessionsCount: $completedSessionsCount, completedDaysCount: $completedDaysCount, firstSessionDate: $firstSessionDate, lastSessionDate: $lastSessionDate)';
}


}

/// @nodoc
abstract mixin class _$ProfileStatsReportCopyWith<$Res> implements $ProfileStatsReportCopyWith<$Res> {
  factory _$ProfileStatsReportCopyWith(_ProfileStatsReport value, $Res Function(_ProfileStatsReport) _then) = __$ProfileStatsReportCopyWithImpl;
@override @useResult
$Res call({
 ConsecutiveDays consecutiveDays, MilestoneProgress milestoneProgress, int milestoneCount, int completedMinutesCount, int completedSessionsCount, int completedDaysCount,@DateTimeOrNullConverter() DateTime? firstSessionDate,@DateTimeOrNullConverter() DateTime? lastSessionDate
});


@override $ConsecutiveDaysCopyWith<$Res> get consecutiveDays;@override $MilestoneProgressCopyWith<$Res> get milestoneProgress;

}
/// @nodoc
class __$ProfileStatsReportCopyWithImpl<$Res>
    implements _$ProfileStatsReportCopyWith<$Res> {
  __$ProfileStatsReportCopyWithImpl(this._self, this._then);

  final _ProfileStatsReport _self;
  final $Res Function(_ProfileStatsReport) _then;

/// Create a copy of ProfileStatsReport
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consecutiveDays = null,Object? milestoneProgress = null,Object? milestoneCount = null,Object? completedMinutesCount = null,Object? completedSessionsCount = null,Object? completedDaysCount = null,Object? firstSessionDate = freezed,Object? lastSessionDate = freezed,}) {
  return _then(_ProfileStatsReport(
consecutiveDays: null == consecutiveDays ? _self.consecutiveDays : consecutiveDays // ignore: cast_nullable_to_non_nullable
as ConsecutiveDays,milestoneProgress: null == milestoneProgress ? _self.milestoneProgress : milestoneProgress // ignore: cast_nullable_to_non_nullable
as MilestoneProgress,milestoneCount: null == milestoneCount ? _self.milestoneCount : milestoneCount // ignore: cast_nullable_to_non_nullable
as int,completedMinutesCount: null == completedMinutesCount ? _self.completedMinutesCount : completedMinutesCount // ignore: cast_nullable_to_non_nullable
as int,completedSessionsCount: null == completedSessionsCount ? _self.completedSessionsCount : completedSessionsCount // ignore: cast_nullable_to_non_nullable
as int,completedDaysCount: null == completedDaysCount ? _self.completedDaysCount : completedDaysCount // ignore: cast_nullable_to_non_nullable
as int,firstSessionDate: freezed == firstSessionDate ? _self.firstSessionDate : firstSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSessionDate: freezed == lastSessionDate ? _self.lastSessionDate : lastSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ProfileStatsReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsecutiveDaysCopyWith<$Res> get consecutiveDays {
  
  return $ConsecutiveDaysCopyWith<$Res>(_self.consecutiveDays, (value) {
    return _then(_self.copyWith(consecutiveDays: value));
  });
}/// Create a copy of ProfileStatsReport
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneProgressCopyWith<$Res> get milestoneProgress {
  
  return $MilestoneProgressCopyWith<$Res>(_self.milestoneProgress, (value) {
    return _then(_self.copyWith(milestoneProgress: value));
  });
}
}

// dart format on
