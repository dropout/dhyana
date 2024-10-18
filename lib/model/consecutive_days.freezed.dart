// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consecutive_days.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConsecutiveDays _$ConsecutiveDaysFromJson(Map<String, dynamic> json) {
  return _ConsecutiveDays.fromJson(json);
}

/// @nodoc
mixin _$ConsecutiveDays {
  int get current => throw _privateConstructorUsedError;
  int get longest => throw _privateConstructorUsedError;
  @DateTimeOrNullConverter()
  DateTime? get startedAt => throw _privateConstructorUsedError;
  @DateTimeOrNullConverter()
  DateTime? get lastChecked => throw _privateConstructorUsedError;

  /// Serializes this ConsecutiveDays to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConsecutiveDays
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConsecutiveDaysCopyWith<ConsecutiveDays> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConsecutiveDaysCopyWith<$Res> {
  factory $ConsecutiveDaysCopyWith(
          ConsecutiveDays value, $Res Function(ConsecutiveDays) then) =
      _$ConsecutiveDaysCopyWithImpl<$Res, ConsecutiveDays>;
  @useResult
  $Res call(
      {int current,
      int longest,
      @DateTimeOrNullConverter() DateTime? startedAt,
      @DateTimeOrNullConverter() DateTime? lastChecked});
}

/// @nodoc
class _$ConsecutiveDaysCopyWithImpl<$Res, $Val extends ConsecutiveDays>
    implements $ConsecutiveDaysCopyWith<$Res> {
  _$ConsecutiveDaysCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConsecutiveDays
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? longest = null,
    Object? startedAt = freezed,
    Object? lastChecked = freezed,
  }) {
    return _then(_value.copyWith(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      longest: null == longest
          ? _value.longest
          : longest // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastChecked: freezed == lastChecked
          ? _value.lastChecked
          : lastChecked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConsecutiveDaysImplCopyWith<$Res>
    implements $ConsecutiveDaysCopyWith<$Res> {
  factory _$$ConsecutiveDaysImplCopyWith(_$ConsecutiveDaysImpl value,
          $Res Function(_$ConsecutiveDaysImpl) then) =
      __$$ConsecutiveDaysImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int current,
      int longest,
      @DateTimeOrNullConverter() DateTime? startedAt,
      @DateTimeOrNullConverter() DateTime? lastChecked});
}

/// @nodoc
class __$$ConsecutiveDaysImplCopyWithImpl<$Res>
    extends _$ConsecutiveDaysCopyWithImpl<$Res, _$ConsecutiveDaysImpl>
    implements _$$ConsecutiveDaysImplCopyWith<$Res> {
  __$$ConsecutiveDaysImplCopyWithImpl(
      _$ConsecutiveDaysImpl _value, $Res Function(_$ConsecutiveDaysImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConsecutiveDays
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? current = null,
    Object? longest = null,
    Object? startedAt = freezed,
    Object? lastChecked = freezed,
  }) {
    return _then(_$ConsecutiveDaysImpl(
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      longest: null == longest
          ? _value.longest
          : longest // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastChecked: freezed == lastChecked
          ? _value.lastChecked
          : lastChecked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConsecutiveDaysImpl extends _ConsecutiveDays
    with DiagnosticableTreeMixin {
  const _$ConsecutiveDaysImpl(
      {this.current = 0,
      this.longest = 0,
      @DateTimeOrNullConverter() this.startedAt,
      @DateTimeOrNullConverter() this.lastChecked})
      : super._();

  factory _$ConsecutiveDaysImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConsecutiveDaysImplFromJson(json);

  @override
  @JsonKey()
  final int current;
  @override
  @JsonKey()
  final int longest;
  @override
  @DateTimeOrNullConverter()
  final DateTime? startedAt;
  @override
  @DateTimeOrNullConverter()
  final DateTime? lastChecked;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsecutiveDays(current: $current, longest: $longest, startedAt: $startedAt, lastChecked: $lastChecked)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConsecutiveDays'))
      ..add(DiagnosticsProperty('current', current))
      ..add(DiagnosticsProperty('longest', longest))
      ..add(DiagnosticsProperty('startedAt', startedAt))
      ..add(DiagnosticsProperty('lastChecked', lastChecked));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConsecutiveDaysImpl &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.longest, longest) || other.longest == longest) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.lastChecked, lastChecked) ||
                other.lastChecked == lastChecked));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, current, longest, startedAt, lastChecked);

  /// Create a copy of ConsecutiveDays
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConsecutiveDaysImplCopyWith<_$ConsecutiveDaysImpl> get copyWith =>
      __$$ConsecutiveDaysImplCopyWithImpl<_$ConsecutiveDaysImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConsecutiveDaysImplToJson(
      this,
    );
  }
}

abstract class _ConsecutiveDays extends ConsecutiveDays {
  const factory _ConsecutiveDays(
          {final int current,
          final int longest,
          @DateTimeOrNullConverter() final DateTime? startedAt,
          @DateTimeOrNullConverter() final DateTime? lastChecked}) =
      _$ConsecutiveDaysImpl;
  const _ConsecutiveDays._() : super._();

  factory _ConsecutiveDays.fromJson(Map<String, dynamic> json) =
      _$ConsecutiveDaysImpl.fromJson;

  @override
  int get current;
  @override
  int get longest;
  @override
  @DateTimeOrNullConverter()
  DateTime? get startedAt;
  @override
  @DateTimeOrNullConverter()
  DateTime? get lastChecked;

  /// Create a copy of ConsecutiveDays
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConsecutiveDaysImplCopyWith<_$ConsecutiveDaysImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
