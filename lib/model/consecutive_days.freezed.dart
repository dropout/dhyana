// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'consecutive_days.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConsecutiveDays implements DiagnosticableTreeMixin {
  int get current;
  int get longest;
  @DateTimeOrNullConverter()
  DateTime? get startedAt;
  @DateTimeOrNullConverter()
  DateTime? get lastChecked;

  /// Create a copy of ConsecutiveDays
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ConsecutiveDaysCopyWith<ConsecutiveDays> get copyWith =>
      _$ConsecutiveDaysCopyWithImpl<ConsecutiveDays>(
          this as ConsecutiveDays, _$identity);

  /// Serializes this ConsecutiveDays to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is ConsecutiveDays &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsecutiveDays(current: $current, longest: $longest, startedAt: $startedAt, lastChecked: $lastChecked)';
  }
}

/// @nodoc
abstract mixin class $ConsecutiveDaysCopyWith<$Res> {
  factory $ConsecutiveDaysCopyWith(
          ConsecutiveDays value, $Res Function(ConsecutiveDays) _then) =
      _$ConsecutiveDaysCopyWithImpl;
  @useResult
  $Res call(
      {int current,
      int longest,
      @DateTimeOrNullConverter() DateTime? startedAt,
      @DateTimeOrNullConverter() DateTime? lastChecked});
}

/// @nodoc
class _$ConsecutiveDaysCopyWithImpl<$Res>
    implements $ConsecutiveDaysCopyWith<$Res> {
  _$ConsecutiveDaysCopyWithImpl(this._self, this._then);

  final ConsecutiveDays _self;
  final $Res Function(ConsecutiveDays) _then;

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
    return _then(_self.copyWith(
      current: null == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      longest: null == longest
          ? _self.longest
          : longest // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastChecked: freezed == lastChecked
          ? _self.lastChecked
          : lastChecked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ConsecutiveDays extends ConsecutiveDays with DiagnosticableTreeMixin {
  const _ConsecutiveDays(
      {this.current = 0,
      this.longest = 0,
      @DateTimeOrNullConverter() this.startedAt,
      @DateTimeOrNullConverter() this.lastChecked})
      : super._();
  factory _ConsecutiveDays.fromJson(Map<String, dynamic> json) =>
      _$ConsecutiveDaysFromJson(json);

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

  /// Create a copy of ConsecutiveDays
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ConsecutiveDaysCopyWith<_ConsecutiveDays> get copyWith =>
      __$ConsecutiveDaysCopyWithImpl<_ConsecutiveDays>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ConsecutiveDaysToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _ConsecutiveDays &&
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConsecutiveDays(current: $current, longest: $longest, startedAt: $startedAt, lastChecked: $lastChecked)';
  }
}

/// @nodoc
abstract mixin class _$ConsecutiveDaysCopyWith<$Res>
    implements $ConsecutiveDaysCopyWith<$Res> {
  factory _$ConsecutiveDaysCopyWith(
          _ConsecutiveDays value, $Res Function(_ConsecutiveDays) _then) =
      __$ConsecutiveDaysCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int current,
      int longest,
      @DateTimeOrNullConverter() DateTime? startedAt,
      @DateTimeOrNullConverter() DateTime? lastChecked});
}

/// @nodoc
class __$ConsecutiveDaysCopyWithImpl<$Res>
    implements _$ConsecutiveDaysCopyWith<$Res> {
  __$ConsecutiveDaysCopyWithImpl(this._self, this._then);

  final _ConsecutiveDays _self;
  final $Res Function(_ConsecutiveDays) _then;

  /// Create a copy of ConsecutiveDays
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? current = null,
    Object? longest = null,
    Object? startedAt = freezed,
    Object? lastChecked = freezed,
  }) {
    return _then(_ConsecutiveDays(
      current: null == current
          ? _self.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      longest: null == longest
          ? _self.longest
          : longest // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: freezed == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastChecked: freezed == lastChecked
          ? _self.lastChecked
          : lastChecked // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
