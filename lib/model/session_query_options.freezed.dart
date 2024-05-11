// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SessionQueryOptions {
  int get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionQueryOptionsCopyWith<SessionQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionQueryOptionsCopyWith<$Res> {
  factory $SessionQueryOptionsCopyWith(
          SessionQueryOptions value, $Res Function(SessionQueryOptions) then) =
      _$SessionQueryOptionsCopyWithImpl<$Res, SessionQueryOptions>;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class _$SessionQueryOptionsCopyWithImpl<$Res, $Val extends SessionQueryOptions>
    implements $SessionQueryOptionsCopyWith<$Res> {
  _$SessionQueryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
  }) {
    return _then(_value.copyWith(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionQueryOptionsImplCopyWith<$Res>
    implements $SessionQueryOptionsCopyWith<$Res> {
  factory _$$SessionQueryOptionsImplCopyWith(_$SessionQueryOptionsImpl value,
          $Res Function(_$SessionQueryOptionsImpl) then) =
      __$$SessionQueryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit});
}

/// @nodoc
class __$$SessionQueryOptionsImplCopyWithImpl<$Res>
    extends _$SessionQueryOptionsCopyWithImpl<$Res, _$SessionQueryOptionsImpl>
    implements _$$SessionQueryOptionsImplCopyWith<$Res> {
  __$$SessionQueryOptionsImplCopyWithImpl(_$SessionQueryOptionsImpl _value,
      $Res Function(_$SessionQueryOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
  }) {
    return _then(_$SessionQueryOptionsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$SessionQueryOptionsImpl extends _SessionQueryOptions
    with DiagnosticableTreeMixin {
  const _$SessionQueryOptionsImpl({this.limit = 20}) : super._();

  @override
  @JsonKey()
  final int limit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SessionQueryOptions(limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SessionQueryOptions'))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionQueryOptionsImpl &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionQueryOptionsImplCopyWith<_$SessionQueryOptionsImpl> get copyWith =>
      __$$SessionQueryOptionsImplCopyWithImpl<_$SessionQueryOptionsImpl>(
          this, _$identity);
}

abstract class _SessionQueryOptions extends SessionQueryOptions {
  const factory _SessionQueryOptions({final int limit}) =
      _$SessionQueryOptionsImpl;
  const _SessionQueryOptions._() : super._();

  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$SessionQueryOptionsImplCopyWith<_$SessionQueryOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
