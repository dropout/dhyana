// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'month_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthQueryOptions {
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Create a copy of MonthQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthQueryOptionsCopyWith<MonthQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthQueryOptionsCopyWith<$Res> {
  factory $MonthQueryOptionsCopyWith(
          MonthQueryOptions value, $Res Function(MonthQueryOptions) then) =
      _$MonthQueryOptionsCopyWithImpl<$Res, MonthQueryOptions>;
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class _$MonthQueryOptionsCopyWithImpl<$Res, $Val extends MonthQueryOptions>
    implements $MonthQueryOptionsCopyWith<$Res> {
  _$MonthQueryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthQueryOptions
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
abstract class _$$MonthQueryOptionsImplCopyWith<$Res>
    implements $MonthQueryOptionsCopyWith<$Res> {
  factory _$$MonthQueryOptionsImplCopyWith(_$MonthQueryOptionsImpl value,
          $Res Function(_$MonthQueryOptionsImpl) then) =
      __$$MonthQueryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class __$$MonthQueryOptionsImplCopyWithImpl<$Res>
    extends _$MonthQueryOptionsCopyWithImpl<$Res, _$MonthQueryOptionsImpl>
    implements _$$MonthQueryOptionsImplCopyWith<$Res> {
  __$$MonthQueryOptionsImplCopyWithImpl(_$MonthQueryOptionsImpl _value,
      $Res Function(_$MonthQueryOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? limit = null,
  }) {
    return _then(_$MonthQueryOptionsImpl(
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

class _$MonthQueryOptionsImpl extends _MonthQueryOptions
    with DiagnosticableTreeMixin {
  const _$MonthQueryOptionsImpl(
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
    return 'MonthQueryOptions(from: $from, to: $to, limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MonthQueryOptions'))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthQueryOptionsImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to, limit);

  /// Create a copy of MonthQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthQueryOptionsImplCopyWith<_$MonthQueryOptionsImpl> get copyWith =>
      __$$MonthQueryOptionsImplCopyWithImpl<_$MonthQueryOptionsImpl>(
          this, _$identity);
}

abstract class _MonthQueryOptions extends MonthQueryOptions {
  const factory _MonthQueryOptions(
      {required final DateTime from,
      required final DateTime to,
      final int limit}) = _$MonthQueryOptionsImpl;
  const _MonthQueryOptions._() : super._();

  @override
  DateTime get from;
  @override
  DateTime get to;
  @override
  int get limit;

  /// Create a copy of MonthQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthQueryOptionsImplCopyWith<_$MonthQueryOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
