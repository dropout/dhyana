// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_interval.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatsInterval _$StatsIntervalFromJson(Map<String, dynamic> json) {
  return _StatsInterval.fromJson(json);
}

/// @nodoc
mixin _$StatsInterval {
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;

  /// Serializes this StatsInterval to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatsInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsIntervalCopyWith<StatsInterval> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsIntervalCopyWith<$Res> {
  factory $StatsIntervalCopyWith(
          StatsInterval value, $Res Function(StatsInterval) then) =
      _$StatsIntervalCopyWithImpl<$Res, StatsInterval>;
  @useResult
  $Res call({DateTime from, DateTime to});
}

/// @nodoc
class _$StatsIntervalCopyWithImpl<$Res, $Val extends StatsInterval>
    implements $StatsIntervalCopyWith<$Res> {
  _$StatsIntervalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_value.copyWith(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatsIntervalImplCopyWith<$Res>
    implements $StatsIntervalCopyWith<$Res> {
  factory _$$StatsIntervalImplCopyWith(
          _$StatsIntervalImpl value, $Res Function(_$StatsIntervalImpl) then) =
      __$$StatsIntervalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime from, DateTime to});
}

/// @nodoc
class __$$StatsIntervalImplCopyWithImpl<$Res>
    extends _$StatsIntervalCopyWithImpl<$Res, _$StatsIntervalImpl>
    implements _$$StatsIntervalImplCopyWith<$Res> {
  __$$StatsIntervalImplCopyWithImpl(
      _$StatsIntervalImpl _value, $Res Function(_$StatsIntervalImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsInterval
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
  }) {
    return _then(_$StatsIntervalImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatsIntervalImpl extends _StatsInterval {
  const _$StatsIntervalImpl({required this.from, required this.to}) : super._();

  factory _$StatsIntervalImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatsIntervalImplFromJson(json);

  @override
  final DateTime from;
  @override
  final DateTime to;

  @override
  String toString() {
    return 'StatsInterval(from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsIntervalImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  /// Create a copy of StatsInterval
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsIntervalImplCopyWith<_$StatsIntervalImpl> get copyWith =>
      __$$StatsIntervalImplCopyWithImpl<_$StatsIntervalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatsIntervalImplToJson(
      this,
    );
  }
}

abstract class _StatsInterval extends StatsInterval {
  const factory _StatsInterval(
      {required final DateTime from,
      required final DateTime to}) = _$StatsIntervalImpl;
  const _StatsInterval._() : super._();

  factory _StatsInterval.fromJson(Map<String, dynamic> json) =
      _$StatsIntervalImpl.fromJson;

  @override
  DateTime get from;
  @override
  DateTime get to;

  /// Create a copy of StatsInterval
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsIntervalImplCopyWith<_$StatsIntervalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
