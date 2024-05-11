// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileQueryOptions {
  int get limit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileQueryOptionsCopyWith<ProfileQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileQueryOptionsCopyWith<$Res> {
  factory $ProfileQueryOptionsCopyWith(
          ProfileQueryOptions value, $Res Function(ProfileQueryOptions) then) =
      _$ProfileQueryOptionsCopyWithImpl<$Res, ProfileQueryOptions>;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class _$ProfileQueryOptionsCopyWithImpl<$Res, $Val extends ProfileQueryOptions>
    implements $ProfileQueryOptionsCopyWith<$Res> {
  _$ProfileQueryOptionsCopyWithImpl(this._value, this._then);

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
abstract class _$$ProfileQueryOptionsImplCopyWith<$Res>
    implements $ProfileQueryOptionsCopyWith<$Res> {
  factory _$$ProfileQueryOptionsImplCopyWith(_$ProfileQueryOptionsImpl value,
          $Res Function(_$ProfileQueryOptionsImpl) then) =
      __$$ProfileQueryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit});
}

/// @nodoc
class __$$ProfileQueryOptionsImplCopyWithImpl<$Res>
    extends _$ProfileQueryOptionsCopyWithImpl<$Res, _$ProfileQueryOptionsImpl>
    implements _$$ProfileQueryOptionsImplCopyWith<$Res> {
  __$$ProfileQueryOptionsImplCopyWithImpl(_$ProfileQueryOptionsImpl _value,
      $Res Function(_$ProfileQueryOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
  }) {
    return _then(_$ProfileQueryOptionsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$ProfileQueryOptionsImpl extends _ProfileQueryOptions
    with DiagnosticableTreeMixin {
  const _$ProfileQueryOptionsImpl({this.limit = 20}) : super._();

  @override
  @JsonKey()
  final int limit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileQueryOptions(limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ProfileQueryOptions'))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileQueryOptionsImpl &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileQueryOptionsImplCopyWith<_$ProfileQueryOptionsImpl> get copyWith =>
      __$$ProfileQueryOptionsImplCopyWithImpl<_$ProfileQueryOptionsImpl>(
          this, _$identity);
}

abstract class _ProfileQueryOptions extends ProfileQueryOptions {
  const factory _ProfileQueryOptions({final int limit}) =
      _$ProfileQueryOptionsImpl;
  const _ProfileQueryOptions._() : super._();

  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$ProfileQueryOptionsImplCopyWith<_$ProfileQueryOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
