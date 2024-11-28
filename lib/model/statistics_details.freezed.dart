// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatisticsDetails _$StatisticsDetailsFromJson(Map<String, dynamic> json) {
  return _StatisticsDetails.fromJson(json);
}

/// @nodoc
mixin _$StatisticsDetails {
  int get totalMinutes => throw _privateConstructorUsedError;
  double get averageMinutes => throw _privateConstructorUsedError;
  int get totalSessions => throw _privateConstructorUsedError;
  double get averageSessions => throw _privateConstructorUsedError;

  /// Serializes this StatisticsDetails to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatisticsDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticsDetailsCopyWith<StatisticsDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsDetailsCopyWith<$Res> {
  factory $StatisticsDetailsCopyWith(
          StatisticsDetails value, $Res Function(StatisticsDetails) then) =
      _$StatisticsDetailsCopyWithImpl<$Res, StatisticsDetails>;
  @useResult
  $Res call(
      {int totalMinutes,
      double averageMinutes,
      int totalSessions,
      double averageSessions});
}

/// @nodoc
class _$StatisticsDetailsCopyWithImpl<$Res, $Val extends StatisticsDetails>
    implements $StatisticsDetailsCopyWith<$Res> {
  _$StatisticsDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatisticsDetails
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
abstract class _$$StatisticsDetailsImplCopyWith<$Res>
    implements $StatisticsDetailsCopyWith<$Res> {
  factory _$$StatisticsDetailsImplCopyWith(_$StatisticsDetailsImpl value,
          $Res Function(_$StatisticsDetailsImpl) then) =
      __$$StatisticsDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalMinutes,
      double averageMinutes,
      int totalSessions,
      double averageSessions});
}

/// @nodoc
class __$$StatisticsDetailsImplCopyWithImpl<$Res>
    extends _$StatisticsDetailsCopyWithImpl<$Res, _$StatisticsDetailsImpl>
    implements _$$StatisticsDetailsImplCopyWith<$Res> {
  __$$StatisticsDetailsImplCopyWithImpl(_$StatisticsDetailsImpl _value,
      $Res Function(_$StatisticsDetailsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatisticsDetails
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalMinutes = null,
    Object? averageMinutes = null,
    Object? totalSessions = null,
    Object? averageSessions = null,
  }) {
    return _then(_$StatisticsDetailsImpl(
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
class _$StatisticsDetailsImpl implements _StatisticsDetails {
  const _$StatisticsDetailsImpl(
      {this.totalMinutes = 0,
      this.averageMinutes = 0,
      this.totalSessions = 0,
      this.averageSessions = 0});

  factory _$StatisticsDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticsDetailsImplFromJson(json);

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
    return 'StatisticsDetails(totalMinutes: $totalMinutes, averageMinutes: $averageMinutes, totalSessions: $totalSessions, averageSessions: $averageSessions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticsDetailsImpl &&
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

  /// Create a copy of StatisticsDetails
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsDetailsImplCopyWith<_$StatisticsDetailsImpl> get copyWith =>
      __$$StatisticsDetailsImplCopyWithImpl<_$StatisticsDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticsDetailsImplToJson(
      this,
    );
  }
}

abstract class _StatisticsDetails implements StatisticsDetails {
  const factory _StatisticsDetails(
      {final int totalMinutes,
      final double averageMinutes,
      final int totalSessions,
      final double averageSessions}) = _$StatisticsDetailsImpl;

  factory _StatisticsDetails.fromJson(Map<String, dynamic> json) =
      _$StatisticsDetailsImpl.fromJson;

  @override
  int get totalMinutes;
  @override
  double get averageMinutes;
  @override
  int get totalSessions;
  @override
  double get averageSessions;

  /// Create a copy of StatisticsDetails
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticsDetailsImplCopyWith<_$StatisticsDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
