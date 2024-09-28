// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'year_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$YearQueryOptions {
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Create a copy of YearQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YearQueryOptionsCopyWith<YearQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearQueryOptionsCopyWith<$Res> {
  factory $YearQueryOptionsCopyWith(
          YearQueryOptions value, $Res Function(YearQueryOptions) then) =
      _$YearQueryOptionsCopyWithImpl<$Res, YearQueryOptions>;
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class _$YearQueryOptionsCopyWithImpl<$Res, $Val extends YearQueryOptions>
    implements $YearQueryOptionsCopyWith<$Res> {
  _$YearQueryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YearQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? limit = null,
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
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YearQueryOptionsImplCopyWith<$Res>
    implements $YearQueryOptionsCopyWith<$Res> {
  factory _$$YearQueryOptionsImplCopyWith(_$YearQueryOptionsImpl value,
          $Res Function(_$YearQueryOptionsImpl) then) =
      __$$YearQueryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class __$$YearQueryOptionsImplCopyWithImpl<$Res>
    extends _$YearQueryOptionsCopyWithImpl<$Res, _$YearQueryOptionsImpl>
    implements _$$YearQueryOptionsImplCopyWith<$Res> {
  __$$YearQueryOptionsImplCopyWithImpl(_$YearQueryOptionsImpl _value,
      $Res Function(_$YearQueryOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of YearQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? limit = null,
  }) {
    return _then(_$YearQueryOptionsImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$YearQueryOptionsImpl extends _YearQueryOptions
    with DiagnosticableTreeMixin {
  const _$YearQueryOptionsImpl(
      {required this.from, required this.to, this.limit = 20})
      : super._();

  @override
  final DateTime from;
  @override
  final DateTime to;
  @override
  @JsonKey()
  final int limit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'YearQueryOptions(from: $from, to: $to, limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
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
            other is _$YearQueryOptionsImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to, limit);

  /// Create a copy of YearQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YearQueryOptionsImplCopyWith<_$YearQueryOptionsImpl> get copyWith =>
      __$$YearQueryOptionsImplCopyWithImpl<_$YearQueryOptionsImpl>(
          this, _$identity);
}

abstract class _YearQueryOptions extends YearQueryOptions {
  const factory _YearQueryOptions(
      {required final DateTime from,
      required final DateTime to,
      final int limit}) = _$YearQueryOptionsImpl;
  const _YearQueryOptions._() : super._();

  @override
  DateTime get from;
  @override
  DateTime get to;
  @override
  int get limit;

  /// Create a copy of YearQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YearQueryOptionsImplCopyWith<_$YearQueryOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
