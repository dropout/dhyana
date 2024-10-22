// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeekQueryOptions {
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Create a copy of WeekQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WeekQueryOptionsCopyWith<WeekQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekQueryOptionsCopyWith<$Res> {
  factory $WeekQueryOptionsCopyWith(
          WeekQueryOptions value, $Res Function(WeekQueryOptions) then) =
      _$WeekQueryOptionsCopyWithImpl<$Res, WeekQueryOptions>;
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class _$WeekQueryOptionsCopyWithImpl<$Res, $Val extends WeekQueryOptions>
    implements $WeekQueryOptionsCopyWith<$Res> {
  _$WeekQueryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeekQueryOptions
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
abstract class _$$WeekQueryOptionsImplCopyWith<$Res>
    implements $WeekQueryOptionsCopyWith<$Res> {
  factory _$$WeekQueryOptionsImplCopyWith(_$WeekQueryOptionsImpl value,
          $Res Function(_$WeekQueryOptionsImpl) then) =
      __$$WeekQueryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class __$$WeekQueryOptionsImplCopyWithImpl<$Res>
    extends _$WeekQueryOptionsCopyWithImpl<$Res, _$WeekQueryOptionsImpl>
    implements _$$WeekQueryOptionsImplCopyWith<$Res> {
  __$$WeekQueryOptionsImplCopyWithImpl(_$WeekQueryOptionsImpl _value,
      $Res Function(_$WeekQueryOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeekQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? limit = null,
  }) {
    return _then(_$WeekQueryOptionsImpl(
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

class _$WeekQueryOptionsImpl extends _WeekQueryOptions
    with DiagnosticableTreeMixin {
  const _$WeekQueryOptionsImpl(
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
    return 'WeekQueryOptions(from: $from, to: $to, limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'WeekQueryOptions'))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeekQueryOptionsImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to, limit);

  /// Create a copy of WeekQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeekQueryOptionsImplCopyWith<_$WeekQueryOptionsImpl> get copyWith =>
      __$$WeekQueryOptionsImplCopyWithImpl<_$WeekQueryOptionsImpl>(
          this, _$identity);
}

abstract class _WeekQueryOptions extends WeekQueryOptions {
  const factory _WeekQueryOptions(
      {required final DateTime from,
      required final DateTime to,
      final int limit}) = _$WeekQueryOptionsImpl;
  const _WeekQueryOptions._() : super._();

  @override
  DateTime get from;
  @override
  DateTime get to;
  @override
  int get limit;

  /// Create a copy of WeekQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeekQueryOptionsImplCopyWith<_$WeekQueryOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
