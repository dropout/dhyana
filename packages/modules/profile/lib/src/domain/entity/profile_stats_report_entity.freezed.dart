// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_stats_report_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileStatsReportEntity implements DiagnosticableTreeMixin {

 ConsecutiveDaysEntity get consecutiveDays; MilestoneProgressEntity get milestoneProgress; int get milestoneCount; int get completedMinutesCount; int get completedSessionsCount; int get completedDaysCount;@DateTimeOrNullConverter() DateTime? get firstSessionDate;@DateTimeOrNullConverter() DateTime? get lastSessionDate;
/// Create a copy of ProfileStatsReportEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileStatsReportEntityCopyWith<ProfileStatsReportEntity> get copyWith => _$ProfileStatsReportEntityCopyWithImpl<ProfileStatsReportEntity>(this as ProfileStatsReportEntity, _$identity);

  /// Serializes this ProfileStatsReportEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as ProfileStatsReportEntity;
  properties
    ..add(DiagnosticsProperty('type', 'ProfileStatsReportEntity'))
    ..add(DiagnosticsProperty('consecutiveDays', _this.consecutiveDays))..add(DiagnosticsProperty('milestoneProgress', _this.milestoneProgress))..add(DiagnosticsProperty('milestoneCount', _this.milestoneCount))..add(DiagnosticsProperty('completedMinutesCount', _this.completedMinutesCount))..add(DiagnosticsProperty('completedSessionsCount', _this.completedSessionsCount))..add(DiagnosticsProperty('completedDaysCount', _this.completedDaysCount))..add(DiagnosticsProperty('firstSessionDate', _this.firstSessionDate))..add(DiagnosticsProperty('lastSessionDate', _this.lastSessionDate));
}

@override
bool operator ==(Object other) {
  final _this = this as ProfileStatsReportEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileStatsReportEntity&&(identical(other.consecutiveDays, _this.consecutiveDays) || other.consecutiveDays == _this.consecutiveDays)&&(identical(other.milestoneProgress, _this.milestoneProgress) || other.milestoneProgress == _this.milestoneProgress)&&(identical(other.milestoneCount, _this.milestoneCount) || other.milestoneCount == _this.milestoneCount)&&(identical(other.completedMinutesCount, _this.completedMinutesCount) || other.completedMinutesCount == _this.completedMinutesCount)&&(identical(other.completedSessionsCount, _this.completedSessionsCount) || other.completedSessionsCount == _this.completedSessionsCount)&&(identical(other.completedDaysCount, _this.completedDaysCount) || other.completedDaysCount == _this.completedDaysCount)&&(identical(other.firstSessionDate, _this.firstSessionDate) || other.firstSessionDate == _this.firstSessionDate)&&(identical(other.lastSessionDate, _this.lastSessionDate) || other.lastSessionDate == _this.lastSessionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileStatsReportEntity;
  return Object.hash(runtimeType,_this.consecutiveDays,_this.milestoneProgress,_this.milestoneCount,_this.completedMinutesCount,_this.completedSessionsCount,_this.completedDaysCount,_this.firstSessionDate,_this.lastSessionDate);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as ProfileStatsReportEntity;
  return 'ProfileStatsReportEntity(consecutiveDays: ${_this.consecutiveDays}, milestoneProgress: ${_this.milestoneProgress}, milestoneCount: ${_this.milestoneCount}, completedMinutesCount: ${_this.completedMinutesCount}, completedSessionsCount: ${_this.completedSessionsCount}, completedDaysCount: ${_this.completedDaysCount}, firstSessionDate: ${_this.firstSessionDate}, lastSessionDate: ${_this.lastSessionDate})';
}


}

/// @nodoc
abstract mixin class $ProfileStatsReportEntityCopyWith<$Res>  {
  factory $ProfileStatsReportEntityCopyWith(ProfileStatsReportEntity value, $Res Function(ProfileStatsReportEntity) _then) = _$ProfileStatsReportEntityCopyWithImpl;
@useResult
$Res call({
 ConsecutiveDaysEntity consecutiveDays, MilestoneProgressEntity milestoneProgress, int milestoneCount, int completedMinutesCount, int completedSessionsCount, int completedDaysCount,@DateTimeOrNullConverter() DateTime? firstSessionDate,@DateTimeOrNullConverter() DateTime? lastSessionDate
});


$ConsecutiveDaysEntityCopyWith<$Res> get consecutiveDays;$MilestoneProgressEntityCopyWith<$Res> get milestoneProgress;

}
/// @nodoc
class _$ProfileStatsReportEntityCopyWithImpl<$Res>
    implements $ProfileStatsReportEntityCopyWith<$Res> {
  _$ProfileStatsReportEntityCopyWithImpl(this._self, this._then);

  final ProfileStatsReportEntity _self;
  final $Res Function(ProfileStatsReportEntity) _then;

/// Create a copy of ProfileStatsReportEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? consecutiveDays = null,Object? milestoneProgress = null,Object? milestoneCount = null,Object? completedMinutesCount = null,Object? completedSessionsCount = null,Object? completedDaysCount = null,Object? firstSessionDate = freezed,Object? lastSessionDate = freezed,}) {
  return _then(ProfileStatsReportEntity(
consecutiveDays: null == consecutiveDays ? _self.consecutiveDays : consecutiveDays // ignore: cast_nullable_to_non_nullable
as ConsecutiveDaysEntity,milestoneProgress: null == milestoneProgress ? _self.milestoneProgress : milestoneProgress // ignore: cast_nullable_to_non_nullable
as MilestoneProgressEntity,milestoneCount: null == milestoneCount ? _self.milestoneCount : milestoneCount // ignore: cast_nullable_to_non_nullable
as int,completedMinutesCount: null == completedMinutesCount ? _self.completedMinutesCount : completedMinutesCount // ignore: cast_nullable_to_non_nullable
as int,completedSessionsCount: null == completedSessionsCount ? _self.completedSessionsCount : completedSessionsCount // ignore: cast_nullable_to_non_nullable
as int,completedDaysCount: null == completedDaysCount ? _self.completedDaysCount : completedDaysCount // ignore: cast_nullable_to_non_nullable
as int,firstSessionDate: freezed == firstSessionDate ? _self.firstSessionDate : firstSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSessionDate: freezed == lastSessionDate ? _self.lastSessionDate : lastSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ProfileStatsReportEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsecutiveDaysEntityCopyWith<$Res> get consecutiveDays {
  
  return $ConsecutiveDaysEntityCopyWith<$Res>(_self.consecutiveDays, (value) {
    return _then(_self.copyWith(consecutiveDays: value));
  });
}/// Create a copy of ProfileStatsReportEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneProgressEntityCopyWith<$Res> get milestoneProgress {
  
  return $MilestoneProgressEntityCopyWith<$Res>(_self.milestoneProgress, (value) {
    return _then(_self.copyWith(milestoneProgress: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileStatsReportEntity].
extension ProfileStatsReportEntityPatterns on ProfileStatsReportEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileStatsReportEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileStatsReportEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileStatsReportEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProfileStatsReportEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileStatsReportEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileStatsReportEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ConsecutiveDaysEntity consecutiveDays,  MilestoneProgressEntity milestoneProgress,  int milestoneCount,  int completedMinutesCount,  int completedSessionsCount,  int completedDaysCount, @DateTimeOrNullConverter()  DateTime? firstSessionDate, @DateTimeOrNullConverter()  DateTime? lastSessionDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileStatsReportEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ConsecutiveDaysEntity consecutiveDays,  MilestoneProgressEntity milestoneProgress,  int milestoneCount,  int completedMinutesCount,  int completedSessionsCount,  int completedDaysCount, @DateTimeOrNullConverter()  DateTime? firstSessionDate, @DateTimeOrNullConverter()  DateTime? lastSessionDate)  $default,) {final _that = this;
switch (_that) {
case _ProfileStatsReportEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ConsecutiveDaysEntity consecutiveDays,  MilestoneProgressEntity milestoneProgress,  int milestoneCount,  int completedMinutesCount,  int completedSessionsCount,  int completedDaysCount, @DateTimeOrNullConverter()  DateTime? firstSessionDate, @DateTimeOrNullConverter()  DateTime? lastSessionDate)?  $default,) {final _that = this;
switch (_that) {
case _ProfileStatsReportEntity() when $default != null:
return $default(_that.consecutiveDays,_that.milestoneProgress,_that.milestoneCount,_that.completedMinutesCount,_that.completedSessionsCount,_that.completedDaysCount,_that.firstSessionDate,_that.lastSessionDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileStatsReportEntity with DiagnosticableTreeMixin implements ProfileStatsReportEntity {
  const _ProfileStatsReportEntity({this.consecutiveDays = const ConsecutiveDaysEntity(), this.milestoneProgress = const MilestoneProgressEntity(), this.milestoneCount = 0, this.completedMinutesCount = 0, this.completedSessionsCount = 0, this.completedDaysCount = 0, @DateTimeOrNullConverter() this.firstSessionDate, @DateTimeOrNullConverter() this.lastSessionDate});
  factory _ProfileStatsReportEntity.fromJson(Map<String, dynamic> json) => _$ProfileStatsReportEntityFromJson(json);

@override@JsonKey() final  ConsecutiveDaysEntity consecutiveDays;
@override@JsonKey() final  MilestoneProgressEntity milestoneProgress;
@override@JsonKey() final  int milestoneCount;
@override@JsonKey() final  int completedMinutesCount;
@override@JsonKey() final  int completedSessionsCount;
@override@JsonKey() final  int completedDaysCount;
@override@DateTimeOrNullConverter() final  DateTime? firstSessionDate;
@override@DateTimeOrNullConverter() final  DateTime? lastSessionDate;

/// Create a copy of ProfileStatsReportEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileStatsReportEntityCopyWith<_ProfileStatsReportEntity> get copyWith => __$ProfileStatsReportEntityCopyWithImpl<_ProfileStatsReportEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileStatsReportEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ProfileStatsReportEntity'))
    ..add(DiagnosticsProperty('consecutiveDays', consecutiveDays))..add(DiagnosticsProperty('milestoneProgress', milestoneProgress))..add(DiagnosticsProperty('milestoneCount', milestoneCount))..add(DiagnosticsProperty('completedMinutesCount', completedMinutesCount))..add(DiagnosticsProperty('completedSessionsCount', completedSessionsCount))..add(DiagnosticsProperty('completedDaysCount', completedDaysCount))..add(DiagnosticsProperty('firstSessionDate', firstSessionDate))..add(DiagnosticsProperty('lastSessionDate', lastSessionDate));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileStatsReportEntity&&(identical(other.consecutiveDays, consecutiveDays) || other.consecutiveDays == consecutiveDays)&&(identical(other.milestoneProgress, milestoneProgress) || other.milestoneProgress == milestoneProgress)&&(identical(other.milestoneCount, milestoneCount) || other.milestoneCount == milestoneCount)&&(identical(other.completedMinutesCount, completedMinutesCount) || other.completedMinutesCount == completedMinutesCount)&&(identical(other.completedSessionsCount, completedSessionsCount) || other.completedSessionsCount == completedSessionsCount)&&(identical(other.completedDaysCount, completedDaysCount) || other.completedDaysCount == completedDaysCount)&&(identical(other.firstSessionDate, firstSessionDate) || other.firstSessionDate == firstSessionDate)&&(identical(other.lastSessionDate, lastSessionDate) || other.lastSessionDate == lastSessionDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,consecutiveDays,milestoneProgress,milestoneCount,completedMinutesCount,completedSessionsCount,completedDaysCount,firstSessionDate,lastSessionDate);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ProfileStatsReportEntity(consecutiveDays: $consecutiveDays, milestoneProgress: $milestoneProgress, milestoneCount: $milestoneCount, completedMinutesCount: $completedMinutesCount, completedSessionsCount: $completedSessionsCount, completedDaysCount: $completedDaysCount, firstSessionDate: $firstSessionDate, lastSessionDate: $lastSessionDate)';
}


}

/// @nodoc
abstract mixin class _$ProfileStatsReportEntityCopyWith<$Res> implements $ProfileStatsReportEntityCopyWith<$Res> {
  factory _$ProfileStatsReportEntityCopyWith(_ProfileStatsReportEntity value, $Res Function(_ProfileStatsReportEntity) _then) = __$ProfileStatsReportEntityCopyWithImpl;
@override @useResult
$Res call({
 ConsecutiveDaysEntity consecutiveDays, MilestoneProgressEntity milestoneProgress, int milestoneCount, int completedMinutesCount, int completedSessionsCount, int completedDaysCount,@DateTimeOrNullConverter() DateTime? firstSessionDate,@DateTimeOrNullConverter() DateTime? lastSessionDate
});


@override $ConsecutiveDaysEntityCopyWith<$Res> get consecutiveDays;@override $MilestoneProgressEntityCopyWith<$Res> get milestoneProgress;

}
/// @nodoc
class __$ProfileStatsReportEntityCopyWithImpl<$Res>
    implements _$ProfileStatsReportEntityCopyWith<$Res> {
  __$ProfileStatsReportEntityCopyWithImpl(this._self, this._then);

  final _ProfileStatsReportEntity _self;
  final $Res Function(_ProfileStatsReportEntity) _then;

/// Create a copy of ProfileStatsReportEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? consecutiveDays = null,Object? milestoneProgress = null,Object? milestoneCount = null,Object? completedMinutesCount = null,Object? completedSessionsCount = null,Object? completedDaysCount = null,Object? firstSessionDate = freezed,Object? lastSessionDate = freezed,}) {
  return _then(_ProfileStatsReportEntity(
consecutiveDays: null == consecutiveDays ? _self.consecutiveDays : consecutiveDays // ignore: cast_nullable_to_non_nullable
as ConsecutiveDaysEntity,milestoneProgress: null == milestoneProgress ? _self.milestoneProgress : milestoneProgress // ignore: cast_nullable_to_non_nullable
as MilestoneProgressEntity,milestoneCount: null == milestoneCount ? _self.milestoneCount : milestoneCount // ignore: cast_nullable_to_non_nullable
as int,completedMinutesCount: null == completedMinutesCount ? _self.completedMinutesCount : completedMinutesCount // ignore: cast_nullable_to_non_nullable
as int,completedSessionsCount: null == completedSessionsCount ? _self.completedSessionsCount : completedSessionsCount // ignore: cast_nullable_to_non_nullable
as int,completedDaysCount: null == completedDaysCount ? _self.completedDaysCount : completedDaysCount // ignore: cast_nullable_to_non_nullable
as int,firstSessionDate: freezed == firstSessionDate ? _self.firstSessionDate : firstSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,lastSessionDate: freezed == lastSessionDate ? _self.lastSessionDate : lastSessionDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ProfileStatsReportEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ConsecutiveDaysEntityCopyWith<$Res> get consecutiveDays {
  
  return $ConsecutiveDaysEntityCopyWith<$Res>(_self.consecutiveDays, (value) {
    return _then(_self.copyWith(consecutiveDays: value));
  });
}/// Create a copy of ProfileStatsReportEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MilestoneProgressEntityCopyWith<$Res> get milestoneProgress {
  
  return $MilestoneProgressEntityCopyWith<$Res>(_self.milestoneProgress, (value) {
    return _then(_self.copyWith(milestoneProgress: value));
  });
}
}

// dart format on
