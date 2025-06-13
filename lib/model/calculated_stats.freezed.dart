// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calculated_stats.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CalculatedStats {
  int get totalMinutes;
  double get averageMinutes;
  int get totalSessions;
  double get averageSessions;

  /// Create a copy of CalculatedStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CalculatedStatsCopyWith<CalculatedStats> get copyWith =>
      _$CalculatedStatsCopyWithImpl<CalculatedStats>(
          this as CalculatedStats, _$identity);

  /// Serializes this CalculatedStats to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CalculatedStats &&
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

  @override
  String toString() {
    return 'CalculatedStats(totalMinutes: $totalMinutes, averageMinutes: $averageMinutes, totalSessions: $totalSessions, averageSessions: $averageSessions)';
  }
}

/// @nodoc
abstract mixin class $CalculatedStatsCopyWith<$Res> {
  factory $CalculatedStatsCopyWith(
          CalculatedStats value, $Res Function(CalculatedStats) _then) =
      _$CalculatedStatsCopyWithImpl;
  @useResult
  $Res call(
      {int totalMinutes,
      double averageMinutes,
      int totalSessions,
      double averageSessions});
}

/// @nodoc
class _$CalculatedStatsCopyWithImpl<$Res>
    implements $CalculatedStatsCopyWith<$Res> {
  _$CalculatedStatsCopyWithImpl(this._self, this._then);

  final CalculatedStats _self;
  final $Res Function(CalculatedStats) _then;

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
    return _then(_self.copyWith(
      totalMinutes: null == totalMinutes
          ? _self.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      averageMinutes: null == averageMinutes
          ? _self.averageMinutes
          : averageMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      totalSessions: null == totalSessions
          ? _self.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      averageSessions: null == averageSessions
          ? _self.averageSessions
          : averageSessions // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _CalculatedStats implements CalculatedStats {
  const _CalculatedStats(
      {this.totalMinutes = 0,
      this.averageMinutes = 0,
      this.totalSessions = 0,
      this.averageSessions = 0});
  factory _CalculatedStats.fromJson(Map<String, dynamic> json) =>
      _$CalculatedStatsFromJson(json);

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

  /// Create a copy of CalculatedStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CalculatedStatsCopyWith<_CalculatedStats> get copyWith =>
      __$CalculatedStatsCopyWithImpl<_CalculatedStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CalculatedStatsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CalculatedStats &&
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

  @override
  String toString() {
    return 'CalculatedStats(totalMinutes: $totalMinutes, averageMinutes: $averageMinutes, totalSessions: $totalSessions, averageSessions: $averageSessions)';
  }
}

/// @nodoc
abstract mixin class _$CalculatedStatsCopyWith<$Res>
    implements $CalculatedStatsCopyWith<$Res> {
  factory _$CalculatedStatsCopyWith(
          _CalculatedStats value, $Res Function(_CalculatedStats) _then) =
      __$CalculatedStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int totalMinutes,
      double averageMinutes,
      int totalSessions,
      double averageSessions});
}

/// @nodoc
class __$CalculatedStatsCopyWithImpl<$Res>
    implements _$CalculatedStatsCopyWith<$Res> {
  __$CalculatedStatsCopyWithImpl(this._self, this._then);

  final _CalculatedStats _self;
  final $Res Function(_CalculatedStats) _then;

  /// Create a copy of CalculatedStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? totalMinutes = null,
    Object? averageMinutes = null,
    Object? totalSessions = null,
    Object? averageSessions = null,
  }) {
    return _then(_CalculatedStats(
      totalMinutes: null == totalMinutes
          ? _self.totalMinutes
          : totalMinutes // ignore: cast_nullable_to_non_nullable
              as int,
      averageMinutes: null == averageMinutes
          ? _self.averageMinutes
          : averageMinutes // ignore: cast_nullable_to_non_nullable
              as double,
      totalSessions: null == totalSessions
          ? _self.totalSessions
          : totalSessions // ignore: cast_nullable_to_non_nullable
              as int,
      averageSessions: null == averageSessions
          ? _self.averageSessions
          : averageSessions // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
