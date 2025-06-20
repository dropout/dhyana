// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_interval.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StatsInterval {
  DateTime get from;
  DateTime get to;

  /// Create a copy of StatsInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $StatsIntervalCopyWith<StatsInterval> get copyWith =>
      _$StatsIntervalCopyWithImpl<StatsInterval>(
          this as StatsInterval, _$identity);

  /// Serializes this StatsInterval to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is StatsInterval &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @override
  String toString() {
    return 'StatsInterval(from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class $StatsIntervalCopyWith<$Res> {
  factory $StatsIntervalCopyWith(
          StatsInterval value, $Res Function(StatsInterval) _then) =
      _$StatsIntervalCopyWithImpl;
  @useResult
  $Res call({DateTime from, DateTime to});
}

/// @nodoc
class _$StatsIntervalCopyWithImpl<$Res>
    implements $StatsIntervalCopyWith<$Res> {
  _$StatsIntervalCopyWithImpl(this._self, this._then);

  final StatsInterval _self;
  final $Res Function(StatsInterval) _then;

  /// Create a copy of StatsInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_self.copyWith(
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _StatsInterval extends StatsInterval {
  const _StatsInterval({required this.from, required this.to}) : super._();
  factory _StatsInterval.fromJson(Map<String, dynamic> json) =>
      _$StatsIntervalFromJson(json);

  @override
  final DateTime from;
  @override
  final DateTime to;

  /// Create a copy of StatsInterval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StatsIntervalCopyWith<_StatsInterval> get copyWith =>
      __$StatsIntervalCopyWithImpl<_StatsInterval>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$StatsIntervalToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _StatsInterval &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @override
  String toString() {
    return 'StatsInterval(from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class _$StatsIntervalCopyWith<$Res>
    implements $StatsIntervalCopyWith<$Res> {
  factory _$StatsIntervalCopyWith(
          _StatsInterval value, $Res Function(_StatsInterval) _then) =
      __$StatsIntervalCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime from, DateTime to});
}

/// @nodoc
class __$StatsIntervalCopyWithImpl<$Res>
    implements _$StatsIntervalCopyWith<$Res> {
  __$StatsIntervalCopyWithImpl(this._self, this._then);

  final _StatsInterval _self;
  final $Res Function(_StatsInterval) _then;

  /// Create a copy of StatsInterval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_StatsInterval(
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
