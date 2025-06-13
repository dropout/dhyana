// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'year_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YearQueryOptions implements DiagnosticableTreeMixin {
  DateTime get from;
  DateTime get to;
  int get limit;

  /// Create a copy of YearQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $YearQueryOptionsCopyWith<YearQueryOptions> get copyWith =>
      _$YearQueryOptionsCopyWithImpl<YearQueryOptions>(
          this as YearQueryOptions, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'YearQueryOptions'))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YearQueryOptions &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to, limit);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YearQueryOptions(from: $from, to: $to, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class $YearQueryOptionsCopyWith<$Res> {
  factory $YearQueryOptionsCopyWith(
          YearQueryOptions value, $Res Function(YearQueryOptions) _then) =
      _$YearQueryOptionsCopyWithImpl;
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class _$YearQueryOptionsCopyWithImpl<$Res>
    implements $YearQueryOptionsCopyWith<$Res> {
  _$YearQueryOptionsCopyWithImpl(this._self, this._then);

  final YearQueryOptions _self;
  final $Res Function(YearQueryOptions) _then;

  /// Create a copy of YearQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? limit = null,
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
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _YearQueryOptions extends YearQueryOptions with DiagnosticableTreeMixin {
  const _YearQueryOptions(
      {required this.from, required this.to, this.limit = 20})
      : super._();

  @override
  final DateTime from;
  @override
  final DateTime to;
  @override
  @JsonKey()
  final int limit;

  /// Create a copy of YearQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$YearQueryOptionsCopyWith<_YearQueryOptions> get copyWith =>
      __$YearQueryOptionsCopyWithImpl<_YearQueryOptions>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'YearQueryOptions'))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _YearQueryOptions &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to, limit);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YearQueryOptions(from: $from, to: $to, limit: $limit)';
  }
}

/// @nodoc
abstract mixin class _$YearQueryOptionsCopyWith<$Res>
    implements $YearQueryOptionsCopyWith<$Res> {
  factory _$YearQueryOptionsCopyWith(
          _YearQueryOptions value, $Res Function(_YearQueryOptions) _then) =
      __$YearQueryOptionsCopyWithImpl;
  @override
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class __$YearQueryOptionsCopyWithImpl<$Res>
    implements _$YearQueryOptionsCopyWith<$Res> {
  __$YearQueryOptionsCopyWithImpl(this._self, this._then);

  final _YearQueryOptions _self;
  final $Res Function(_YearQueryOptions) _then;

  /// Create a copy of YearQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? limit = null,
  }) {
    return _then(_YearQueryOptions(
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      limit: null == limit
          ? _self.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
