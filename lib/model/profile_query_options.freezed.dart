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
mixin _$ProfileQueryOptions {}

/// @nodoc
abstract class $ProfileQueryOptionsCopyWith<$Res> {
  factory $ProfileQueryOptionsCopyWith(
          ProfileQueryOptions value, $Res Function(ProfileQueryOptions) then) =
      _$ProfileQueryOptionsCopyWithImpl<$Res, ProfileQueryOptions>;
}

/// @nodoc
class _$ProfileQueryOptionsCopyWithImpl<$Res, $Val extends ProfileQueryOptions>
    implements $ProfileQueryOptionsCopyWith<$Res> {
  _$ProfileQueryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProfileQueryOptionsImplCopyWith<$Res> {
  factory _$$ProfileQueryOptionsImplCopyWith(_$ProfileQueryOptionsImpl value,
          $Res Function(_$ProfileQueryOptionsImpl) then) =
      __$$ProfileQueryOptionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileQueryOptionsImplCopyWithImpl<$Res>
    extends _$ProfileQueryOptionsCopyWithImpl<$Res, _$ProfileQueryOptionsImpl>
    implements _$$ProfileQueryOptionsImplCopyWith<$Res> {
  __$$ProfileQueryOptionsImplCopyWithImpl(_$ProfileQueryOptionsImpl _value,
      $Res Function(_$ProfileQueryOptionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileQueryOptionsImpl extends _ProfileQueryOptions
    with DiagnosticableTreeMixin {
  const _$ProfileQueryOptionsImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ProfileQueryOptions()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'ProfileQueryOptions'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileQueryOptionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class _ProfileQueryOptions extends ProfileQueryOptions {
  const factory _ProfileQueryOptions() = _$ProfileQueryOptionsImpl;
  const _ProfileQueryOptions._() : super._();
}
