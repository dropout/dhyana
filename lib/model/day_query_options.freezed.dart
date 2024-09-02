// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DayQueryOptions {
  DateTime get from => throw _privateConstructorUsedError;
  DateTime get to => throw _privateConstructorUsedError;
  int get limit => throw _privateConstructorUsedError;

  /// Create a copy of DayQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DayQueryOptionsCopyWith<DayQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayQueryOptionsCopyWith<$Res> {
  factory $DayQueryOptionsCopyWith(
          DayQueryOptions value, $Res Function(DayQueryOptions) then) =
      _$DayQueryOptionsCopyWithImpl<$Res, DayQueryOptions>;
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class _$DayQueryOptionsCopyWithImpl<$Res, $Val extends DayQueryOptions>
    implements $DayQueryOptionsCopyWith<$Res> {
  _$DayQueryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DayQueryOptions
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
abstract class _$$DayQueryOptionsImplCopyWith<$Res>
    implements $DayQueryOptionsCopyWith<$Res> {
  factory _$$DayQueryOptionsImplCopyWith(_$DayQueryOptionsImpl value,
          $Res Function(_$DayQueryOptionsImpl) then) =
      __$$DayQueryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime from, DateTime to, int limit});
}

/// @nodoc
class __$$DayQueryOptionsImplCopyWithImpl<$Res>
    extends _$DayQueryOptionsCopyWithImpl<$Res, _$DayQueryOptionsImpl>
    implements _$$DayQueryOptionsImplCopyWith<$Res> {
  __$$DayQueryOptionsImplCopyWithImpl(
      _$DayQueryOptionsImpl _value, $Res Function(_$DayQueryOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DayQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? limit = null,
  }) {
    return _then(_$DayQueryOptionsImpl(
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

class _$DayQueryOptionsImpl extends _DayQueryOptions
    with DiagnosticableTreeMixin {
  const _$DayQueryOptionsImpl(
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
    return 'DayQueryOptions(from: $from, to: $to, limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'DayQueryOptions'))
      ..add(DiagnosticsProperty('from', from))
      ..add(DiagnosticsProperty('to', to))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DayQueryOptionsImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to, limit);

  /// Create a copy of DayQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DayQueryOptionsImplCopyWith<_$DayQueryOptionsImpl> get copyWith =>
      __$$DayQueryOptionsImplCopyWithImpl<_$DayQueryOptionsImpl>(
          this, _$identity);
}

abstract class _DayQueryOptions extends DayQueryOptions {
  const factory _DayQueryOptions(
      {required final DateTime from,
      required final DateTime to,
      final int limit}) = _$DayQueryOptionsImpl;
  const _DayQueryOptions._() : super._();

  @override
  DateTime get from;
  @override
  DateTime get to;
  @override
  int get limit;

  /// Create a copy of DayQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DayQueryOptionsImplCopyWith<_$DayQueryOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
