// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileStats _$ProfileStatsFromJson(Map<String, dynamic> json) {
  return _ProfileStats.fromJson(json);
}

/// @nodoc
mixin _$ProfileStats {
  int get consecutiveDays => throw _privateConstructorUsedError;
  int get completedMinutesCount => throw _privateConstructorUsedError;
  int get completedSessionsCount => throw _privateConstructorUsedError;
  int get completedDaysCount => throw _privateConstructorUsedError;
  @DateTimeOrNullConverter()
  DateTime? get lastSessionDate => throw _privateConstructorUsedError;

  /// Serializes this ProfileStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileStatsCopyWith<ProfileStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStatsCopyWith<$Res> {
  factory $ProfileStatsCopyWith(
          ProfileStats value, $Res Function(ProfileStats) then) =
      _$ProfileStatsCopyWithImpl<$Res, ProfileStats>;
  @useResult
  $Res call(
      {int consecutiveDays,
      int completedMinutesCount,
      int completedSessionsCount,
      int completedDaysCount,
      @DateTimeOrNullConverter() DateTime? lastSessionDate});
}

/// @nodoc
class _$ProfileStatsCopyWithImpl<$Res, $Val extends ProfileStats>
    implements $ProfileStatsCopyWith<$Res> {
  _$ProfileStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consecutiveDays = null,
    Object? completedMinutesCount = null,
    Object? completedSessionsCount = null,
    Object? completedDaysCount = null,
    Object? lastSessionDate = freezed,
  }) {
    return _then(_value.copyWith(
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
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
      lastSessionDate: freezed == lastSessionDate
          ? _value.lastSessionDate
          : lastSessionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileStatsImplCopyWith<$Res>
    implements $ProfileStatsCopyWith<$Res> {
  factory _$$ProfileStatsImplCopyWith(
          _$ProfileStatsImpl value, $Res Function(_$ProfileStatsImpl) then) =
      __$$ProfileStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int consecutiveDays,
      int completedMinutesCount,
      int completedSessionsCount,
      int completedDaysCount,
      @DateTimeOrNullConverter() DateTime? lastSessionDate});
}

/// @nodoc
class __$$ProfileStatsImplCopyWithImpl<$Res>
    extends _$ProfileStatsCopyWithImpl<$Res, _$ProfileStatsImpl>
    implements _$$ProfileStatsImplCopyWith<$Res> {
  __$$ProfileStatsImplCopyWithImpl(
      _$ProfileStatsImpl _value, $Res Function(_$ProfileStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consecutiveDays = null,
    Object? completedMinutesCount = null,
    Object? completedSessionsCount = null,
    Object? completedDaysCount = null,
    Object? lastSessionDate = freezed,
  }) {
    return _then(_$ProfileStatsImpl(
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
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
      lastSessionDate: freezed == lastSessionDate
          ? _value.lastSessionDate
          : lastSessionDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileStatsImpl with DiagnosticableTreeMixin implements _ProfileStats {
  const _$ProfileStatsImpl(
      {required this.consecutiveDays,
      required this.completedMinutesCount,
      required this.completedSessionsCount,
      required this.completedDaysCount,
      @DateTimeOrNullConverter() this.lastSessionDate});

  factory _$ProfileStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileStatsImplFromJson(json);

  @override
  final int consecutiveDays;
  @override
  final int completedMinutesCount;
  @override
  final int completedSessionsCount;
  @override
  final int completedDaysCount;
  @override
  @DateTimeOrNullConverter()
  final DateTime? lastSessionDate;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileStats(consecutiveDays: $consecutiveDays, completedMinutesCount: $completedMinutesCount, completedSessionsCount: $completedSessionsCount, completedDaysCount: $completedDaysCount, lastSessionDate: $lastSessionDate)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileStats'))
      ..add(DiagnosticsProperty('consecutiveDays', consecutiveDays))
      ..add(DiagnosticsProperty('completedMinutesCount', completedMinutesCount))
      ..add(
          DiagnosticsProperty('completedSessionsCount', completedSessionsCount))
      ..add(DiagnosticsProperty('completedDaysCount', completedDaysCount))
      ..add(DiagnosticsProperty('lastSessionDate', lastSessionDate));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStatsImpl &&
            (identical(other.consecutiveDays, consecutiveDays) ||
                other.consecutiveDays == consecutiveDays) &&
            (identical(other.completedMinutesCount, completedMinutesCount) ||
                other.completedMinutesCount == completedMinutesCount) &&
            (identical(other.completedSessionsCount, completedSessionsCount) ||
                other.completedSessionsCount == completedSessionsCount) &&
            (identical(other.completedDaysCount, completedDaysCount) ||
                other.completedDaysCount == completedDaysCount) &&
            (identical(other.lastSessionDate, lastSessionDate) ||
                other.lastSessionDate == lastSessionDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      consecutiveDays,
      completedMinutesCount,
      completedSessionsCount,
      completedDaysCount,
      lastSessionDate);

  /// Create a copy of ProfileStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileStatsImplCopyWith<_$ProfileStatsImpl> get copyWith =>
      __$$ProfileStatsImplCopyWithImpl<_$ProfileStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileStatsImplToJson(
      this,
    );
  }
}

abstract class _ProfileStats implements ProfileStats {
  const factory _ProfileStats(
          {required final int consecutiveDays,
          required final int completedMinutesCount,
          required final int completedSessionsCount,
          required final int completedDaysCount,
          @DateTimeOrNullConverter() final DateTime? lastSessionDate}) =
      _$ProfileStatsImpl;

  factory _ProfileStats.fromJson(Map<String, dynamic> json) =
      _$ProfileStatsImpl.fromJson;

  @override
  int get consecutiveDays;
  @override
  int get completedMinutesCount;
  @override
  int get completedSessionsCount;
  @override
  int get completedDaysCount;
  @override
  @DateTimeOrNullConverter()
  DateTime? get lastSessionDate;

  /// Create a copy of ProfileStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileStatsImplCopyWith<_$ProfileStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
