// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_statistics_report.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileStatisticsReport _$ProfileStatisticsReportFromJson(
    Map<String, dynamic> json) {
  return _ProfileStatisticsReport.fromJson(json);
}

/// @nodoc
mixin _$ProfileStatisticsReport {
  ConsecutiveDays get consecutiveDays => throw _privateConstructorUsedError;
  MilestoneProgress get milestoneProgress => throw _privateConstructorUsedError;
  int get milestoneCount => throw _privateConstructorUsedError;
  int get completedMinutesCount => throw _privateConstructorUsedError;
  int get completedSessionsCount => throw _privateConstructorUsedError;
  int get completedDaysCount => throw _privateConstructorUsedError;
  @DateTimeOrNullConverter()
  DateTime? get firstSessionDate => throw _privateConstructorUsedError;
  @DateTimeOrNullConverter()
  DateTime? get lastSessionDate => throw _privateConstructorUsedError;

  /// Serializes this ProfileStatisticsReport to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileStatisticsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStatisticsReportCopyWith<ProfileStatisticsReport> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStatisticsReportCopyWith<$Res> {
  factory $ProfileStatisticsReportCopyWith(ProfileStatisticsReport value,
          $Res Function(ProfileStatisticsReport) then) =
      _$ProfileStatisticsReportCopyWithImpl<$Res, ProfileStatisticsReport>;
  @useResult
  $Res call(
      {ConsecutiveDays consecutiveDays,
      MilestoneProgress milestoneProgress,
      int milestoneCount,
      int completedMinutesCount,
      int completedSessionsCount,
      int completedDaysCount,
      @DateTimeOrNullConverter() DateTime? firstSessionDate,
      @DateTimeOrNullConverter() DateTime? lastSessionDate});

  $ConsecutiveDaysCopyWith<$Res> get consecutiveDays;
  $MilestoneProgressCopyWith<$Res> get milestoneProgress;
}

/// @nodoc
class _$ProfileStatisticsReportCopyWithImpl<$Res,
        $Val extends ProfileStatisticsReport>
    implements $ProfileStatisticsReportCopyWith<$Res> {
  _$ProfileStatisticsReportCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileStatisticsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consecutiveDays = null,
    Object? milestoneProgress = null,
    Object? milestoneCount = null,
    Object? completedMinutesCount = null,
    Object? completedSessionsCount = null,
    Object? completedDaysCount = null,
    Object? firstSessionDate = freezed,
    Object? lastSessionDate = freezed,
  }) {
    return _then(_value.copyWith(
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
              as ConsecutiveDays,
      milestoneProgress: null == milestoneProgress
          ? _value.milestoneProgress
          : milestoneProgress // ignore: cast_nullable_to_non_nullable
              as MilestoneProgress,
      milestoneCount: null == milestoneCount
          ? _value.milestoneCount
          : milestoneCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedMinutesCount: null == completedMinutesCount
          ? _value.completedMinutesCount
          : completedMinutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedSessionsCount: null == completedSessionsCount
          ? _value.completedSessionsCount
          : completedSessionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedDaysCount: null == completedDaysCount
          ? _value.completedDaysCount
          : completedDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      firstSessionDate: freezed == firstSessionDate
          ? _value.firstSessionDate
          : firstSessionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSessionDate: freezed == lastSessionDate
          ? _value.lastSessionDate
          : lastSessionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of ProfileStatisticsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ConsecutiveDaysCopyWith<$Res> get consecutiveDays {
    return $ConsecutiveDaysCopyWith<$Res>(_value.consecutiveDays, (value) {
      return _then(_value.copyWith(consecutiveDays: value) as $Val);
    });
  }

  /// Create a copy of ProfileStatisticsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MilestoneProgressCopyWith<$Res> get milestoneProgress {
    return $MilestoneProgressCopyWith<$Res>(_value.milestoneProgress, (value) {
      return _then(_value.copyWith(milestoneProgress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileStatisticsReportImplCopyWith<$Res>
    implements $ProfileStatisticsReportCopyWith<$Res> {
  factory _$$ProfileStatisticsReportImplCopyWith(
          _$ProfileStatisticsReportImpl value,
          $Res Function(_$ProfileStatisticsReportImpl) then) =
      __$$ProfileStatisticsReportImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ConsecutiveDays consecutiveDays,
      MilestoneProgress milestoneProgress,
      int milestoneCount,
      int completedMinutesCount,
      int completedSessionsCount,
      int completedDaysCount,
      @DateTimeOrNullConverter() DateTime? firstSessionDate,
      @DateTimeOrNullConverter() DateTime? lastSessionDate});

  @override
  $ConsecutiveDaysCopyWith<$Res> get consecutiveDays;
  @override
  $MilestoneProgressCopyWith<$Res> get milestoneProgress;
}

/// @nodoc
class __$$ProfileStatisticsReportImplCopyWithImpl<$Res>
    extends _$ProfileStatisticsReportCopyWithImpl<$Res,
        _$ProfileStatisticsReportImpl>
    implements _$$ProfileStatisticsReportImplCopyWith<$Res> {
  __$$ProfileStatisticsReportImplCopyWithImpl(
      _$ProfileStatisticsReportImpl _value,
      $Res Function(_$ProfileStatisticsReportImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileStatisticsReport
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consecutiveDays = null,
    Object? milestoneProgress = null,
    Object? milestoneCount = null,
    Object? completedMinutesCount = null,
    Object? completedSessionsCount = null,
    Object? completedDaysCount = null,
    Object? firstSessionDate = freezed,
    Object? lastSessionDate = freezed,
  }) {
    return _then(_$ProfileStatisticsReportImpl(
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
              as ConsecutiveDays,
      milestoneProgress: null == milestoneProgress
          ? _value.milestoneProgress
          : milestoneProgress // ignore: cast_nullable_to_non_nullable
              as MilestoneProgress,
      milestoneCount: null == milestoneCount
          ? _value.milestoneCount
          : milestoneCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedMinutesCount: null == completedMinutesCount
          ? _value.completedMinutesCount
          : completedMinutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedSessionsCount: null == completedSessionsCount
          ? _value.completedSessionsCount
          : completedSessionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      completedDaysCount: null == completedDaysCount
          ? _value.completedDaysCount
          : completedDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      firstSessionDate: freezed == firstSessionDate
          ? _value.firstSessionDate
          : firstSessionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSessionDate: freezed == lastSessionDate
          ? _value.lastSessionDate
          : lastSessionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileStatisticsReportImpl
    with DiagnosticableTreeMixin
    implements _ProfileStatisticsReport {
  const _$ProfileStatisticsReportImpl(
      {this.consecutiveDays = const ConsecutiveDays(),
      this.milestoneProgress = const MilestoneProgress(),
      this.milestoneCount = 0,
      this.completedMinutesCount = 0,
      this.completedSessionsCount = 0,
      this.completedDaysCount = 0,
      @DateTimeOrNullConverter() this.firstSessionDate,
      @DateTimeOrNullConverter() this.lastSessionDate});

  factory _$ProfileStatisticsReportImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileStatisticsReportImplFromJson(json);

  @override
  @JsonKey()
  final ConsecutiveDays consecutiveDays;
  @override
  @JsonKey()
  final MilestoneProgress milestoneProgress;
  @override
  @JsonKey()
  final int milestoneCount;
  @override
  @JsonKey()
  final int completedMinutesCount;
  @override
  @JsonKey()
  final int completedSessionsCount;
  @override
  @JsonKey()
  final int completedDaysCount;
  @override
  @DateTimeOrNullConverter()
  final DateTime? firstSessionDate;
  @override
  @DateTimeOrNullConverter()
  final DateTime? lastSessionDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileStatisticsReport(consecutiveDays: $consecutiveDays, milestoneProgress: $milestoneProgress, milestoneCount: $milestoneCount, completedMinutesCount: $completedMinutesCount, completedSessionsCount: $completedSessionsCount, completedDaysCount: $completedDaysCount, firstSessionDate: $firstSessionDate, lastSessionDate: $lastSessionDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileStatisticsReport'))
      ..add(DiagnosticsProperty('consecutiveDays', consecutiveDays))
      ..add(DiagnosticsProperty('milestoneProgress', milestoneProgress))
      ..add(DiagnosticsProperty('milestoneCount', milestoneCount))
      ..add(DiagnosticsProperty('completedMinutesCount', completedMinutesCount))
      ..add(
          DiagnosticsProperty('completedSessionsCount', completedSessionsCount))
      ..add(DiagnosticsProperty('completedDaysCount', completedDaysCount))
      ..add(DiagnosticsProperty('firstSessionDate', firstSessionDate))
      ..add(DiagnosticsProperty('lastSessionDate', lastSessionDate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStatisticsReportImpl &&
            (identical(other.consecutiveDays, consecutiveDays) ||
                other.consecutiveDays == consecutiveDays) &&
            (identical(other.milestoneProgress, milestoneProgress) ||
                other.milestoneProgress == milestoneProgress) &&
            (identical(other.milestoneCount, milestoneCount) ||
                other.milestoneCount == milestoneCount) &&
            (identical(other.completedMinutesCount, completedMinutesCount) ||
                other.completedMinutesCount == completedMinutesCount) &&
            (identical(other.completedSessionsCount, completedSessionsCount) ||
                other.completedSessionsCount == completedSessionsCount) &&
            (identical(other.completedDaysCount, completedDaysCount) ||
                other.completedDaysCount == completedDaysCount) &&
            (identical(other.firstSessionDate, firstSessionDate) ||
                other.firstSessionDate == firstSessionDate) &&
            (identical(other.lastSessionDate, lastSessionDate) ||
                other.lastSessionDate == lastSessionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      consecutiveDays,
      milestoneProgress,
      milestoneCount,
      completedMinutesCount,
      completedSessionsCount,
      completedDaysCount,
      firstSessionDate,
      lastSessionDate);

  /// Create a copy of ProfileStatisticsReport
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStatisticsReportImplCopyWith<_$ProfileStatisticsReportImpl>
      get copyWith => __$$ProfileStatisticsReportImplCopyWithImpl<
          _$ProfileStatisticsReportImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileStatisticsReportImplToJson(
      this,
    );
  }
}

abstract class _ProfileStatisticsReport implements ProfileStatisticsReport {
  const factory _ProfileStatisticsReport(
          {final ConsecutiveDays consecutiveDays,
          final MilestoneProgress milestoneProgress,
          final int milestoneCount,
          final int completedMinutesCount,
          final int completedSessionsCount,
          final int completedDaysCount,
          @DateTimeOrNullConverter() final DateTime? firstSessionDate,
          @DateTimeOrNullConverter() final DateTime? lastSessionDate}) =
      _$ProfileStatisticsReportImpl;

  factory _ProfileStatisticsReport.fromJson(Map<String, dynamic> json) =
      _$ProfileStatisticsReportImpl.fromJson;

  @override
  ConsecutiveDays get consecutiveDays;
  @override
  MilestoneProgress get milestoneProgress;
  @override
  int get milestoneCount;
  @override
  int get completedMinutesCount;
  @override
  int get completedSessionsCount;
  @override
  int get completedDaysCount;
  @override
  @DateTimeOrNullConverter()
  DateTime? get firstSessionDate;
  @override
  @DateTimeOrNullConverter()
  DateTime? get lastSessionDate;

  /// Create a copy of ProfileStatisticsReport
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStatisticsReportImplCopyWith<_$ProfileStatisticsReportImpl>
      get copyWith => throw _privateConstructorUsedError;
}
