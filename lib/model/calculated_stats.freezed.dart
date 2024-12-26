// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculated_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CalculatedStats _$CalculatedStatsFromJson(Map<String, dynamic> json) {
  return _CalculatedStats.fromJson(json);
}

/// @nodoc
mixin _$CalculatedStats {
  int get totalMinutes => throw _privateConstructorUsedError;
  double get averageMinutes => throw _privateConstructorUsedError;
  int get totalSessions => throw _privateConstructorUsedError;
  double get averageSessions => throw _privateConstructorUsedError;

  /// Serializes this CalculatedStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CalculatedStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CalculatedStatsCopyWith<CalculatedStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalculatedStatsCopyWith<$Res> {
  factory $CalculatedStatsCopyWith(
          CalculatedStats value, $Res Function(CalculatedStats) then) =
      _$CalculatedStatsCopyWithImpl<$Res, CalculatedStats>;
  @useResult
  $Res call(
      {int totalMinutes,
      double averageMinutes,
      int totalSessions,
      double averageSessions});
}

/// @nodoc
class _$CalculatedStatsCopyWithImpl<$Res, $Val extends CalculatedStats>
    implements $CalculatedStatsCopyWith<$Res> {
  _$CalculatedStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CalculatedStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMinutes = null,
    Object? averageMinutes = null,
    Object? totalSessions = null,
    Object? averageSessions = null,
  }) {
    return _then(_value.copyWith(
      totalMinutes: null == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      averageMinutes: null == averageMinutes
          ? _value.averageMinutes
          : averageMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      averageSessions: null == averageSessions
          ? _value.averageSessions
          : averageSessions // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CalculatedStatsImplCopyWith<$Res>
    implements $CalculatedStatsCopyWith<$Res> {
  factory _$$CalculatedStatsImplCopyWith(_$CalculatedStatsImpl value,
          $Res Function(_$CalculatedStatsImpl) then) =
      __$$CalculatedStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalMinutes,
      double averageMinutes,
      int totalSessions,
      double averageSessions});
}

/// @nodoc
class __$$CalculatedStatsImplCopyWithImpl<$Res>
    extends _$CalculatedStatsCopyWithImpl<$Res, _$CalculatedStatsImpl>
    implements _$$CalculatedStatsImplCopyWith<$Res> {
  __$$CalculatedStatsImplCopyWithImpl(
      _$CalculatedStatsImpl _value, $Res Function(_$CalculatedStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CalculatedStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMinutes = null,
    Object? averageMinutes = null,
    Object? totalSessions = null,
    Object? averageSessions = null,
  }) {
    return _then(_$CalculatedStatsImpl(
      totalMinutes: null == totalMinutes
          ? _value.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      averageMinutes: null == averageMinutes
          ? _value.averageMinutes
          : averageMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      totalSessions: null == totalSessions
          ? _value.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      averageSessions: null == averageSessions
          ? _value.averageSessions
          : averageSessions // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CalculatedStatsImpl implements _CalculatedStats {
  const _$CalculatedStatsImpl(
      {this.totalMinutes = 0,
      this.averageMinutes = 0,
      this.totalSessions = 0,
      this.averageSessions = 0});

  factory _$CalculatedStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CalculatedStatsImplFromJson(json);

  @override
  @JsonKey()
  final int totalMinutes;
  @override
  @JsonKey()
  final double averageMinutes;
  @override
  @JsonKey()
  final int totalSessions;
  @override
  @JsonKey()
  final double averageSessions;

  @override
  String toString() {
    return 'CalculatedStats(totalMinutes: $totalMinutes, averageMinutes: $averageMinutes, totalSessions: $totalSessions, averageSessions: $averageSessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculatedStatsImpl &&
            (identical(other.totalMinutes, totalMinutes) ||
                other.totalMinutes == totalMinutes) &&
            (identical(other.averageMinutes, averageMinutes) ||
                other.averageMinutes == averageMinutes) &&
            (identical(other.totalSessions, totalSessions) ||
                other.totalSessions == totalSessions) &&
            (identical(other.averageSessions, averageSessions) ||
                other.averageSessions == averageSessions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalMinutes, averageMinutes,
      totalSessions, averageSessions);

  /// Create a copy of CalculatedStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculatedStatsImplCopyWith<_$CalculatedStatsImpl> get copyWith =>
      __$$CalculatedStatsImplCopyWithImpl<_$CalculatedStatsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CalculatedStatsImplToJson(
      this,
    );
  }
}

abstract class _CalculatedStats implements CalculatedStats {
  const factory _CalculatedStats(
      {final int totalMinutes,
      final double averageMinutes,
      final int totalSessions,
      final double averageSessions}) = _$CalculatedStatsImpl;

  factory _CalculatedStats.fromJson(Map<String, dynamic> json) =
      _$CalculatedStatsImpl.fromJson;

  @override
  int get totalMinutes;
  @override
  double get averageMinutes;
  @override
  int get totalSessions;
  @override
  double get averageSessions;

  /// Create a copy of CalculatedStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculatedStatsImplCopyWith<_$CalculatedStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
