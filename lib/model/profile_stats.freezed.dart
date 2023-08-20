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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProfileStats _$ProfileStatsFromJson(Map<String, dynamic> json) {
  return _ProfileStats.fromJson(json);
}

/// @nodoc
mixin _$ProfileStats {
  int get consecutiveDays => throw _privateConstructorUsedError;
  int get completedMinutesCount => throw _privateConstructorUsedError;
  int get completedSessionsCount => throw _privateConstructorUsedError;
  int get completedDaysCount => throw _privateConstructorUsedError;
  DateTime? get lastSessionDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      DateTime? lastSessionDate});
}

/// @nodoc
class _$ProfileStatsCopyWithImpl<$Res, $Val extends ProfileStats>
    implements $ProfileStatsCopyWith<$Res> {
  _$ProfileStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
abstract class _$$_ProfileStatsCopyWith<$Res>
    implements $ProfileStatsCopyWith<$Res> {
  factory _$$_ProfileStatsCopyWith(
          _$_ProfileStats value, $Res Function(_$_ProfileStats) then) =
      __$$_ProfileStatsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int consecutiveDays,
      int completedMinutesCount,
      int completedSessionsCount,
      int completedDaysCount,
      DateTime? lastSessionDate});
}

/// @nodoc
class __$$_ProfileStatsCopyWithImpl<$Res>
    extends _$ProfileStatsCopyWithImpl<$Res, _$_ProfileStats>
    implements _$$_ProfileStatsCopyWith<$Res> {
  __$$_ProfileStatsCopyWithImpl(
      _$_ProfileStats _value, $Res Function(_$_ProfileStats) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? consecutiveDays = null,
    Object? completedMinutesCount = null,
    Object? completedSessionsCount = null,
    Object? completedDaysCount = null,
    Object? lastSessionDate = freezed,
  }) {
    return _then(_$_ProfileStats(
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
class _$_ProfileStats with DiagnosticableTreeMixin implements _ProfileStats {
  const _$_ProfileStats(
      {required this.consecutiveDays,
      required this.completedMinutesCount,
      required this.completedSessionsCount,
      required this.completedDaysCount,
      this.lastSessionDate});

  factory _$_ProfileStats.fromJson(Map<String, dynamic> json) =>
      _$$_ProfileStatsFromJson(json);

  @override
  final int consecutiveDays;
  @override
  final int completedMinutesCount;
  @override
  final int completedSessionsCount;
  @override
  final int completedDaysCount;
  @override
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileStats &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      consecutiveDays,
      completedMinutesCount,
      completedSessionsCount,
      completedDaysCount,
      lastSessionDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileStatsCopyWith<_$_ProfileStats> get copyWith =>
      __$$_ProfileStatsCopyWithImpl<_$_ProfileStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileStatsToJson(
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
      final DateTime? lastSessionDate}) = _$_ProfileStats;

  factory _ProfileStats.fromJson(Map<String, dynamic> json) =
      _$_ProfileStats.fromJson;

  @override
  int get consecutiveDays;
  @override
  int get completedMinutesCount;
  @override
  int get completedSessionsCount;
  @override
  int get completedDaysCount;
  @override
  DateTime? get lastSessionDate;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileStatsCopyWith<_$_ProfileStats> get copyWith =>
      throw _privateConstructorUsedError;
}
