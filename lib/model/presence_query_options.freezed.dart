// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PresenceQueryOptions {
  String? get ownProfileId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PresenceQueryOptionsCopyWith<PresenceQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceQueryOptionsCopyWith<$Res> {
  factory $PresenceQueryOptionsCopyWith(PresenceQueryOptions value,
          $Res Function(PresenceQueryOptions) then) =
      _$PresenceQueryOptionsCopyWithImpl<$Res, PresenceQueryOptions>;
  @useResult
  $Res call({String? ownProfileId});
}

/// @nodoc
class _$PresenceQueryOptionsCopyWithImpl<$Res,
        $Val extends PresenceQueryOptions>
    implements $PresenceQueryOptionsCopyWith<$Res> {
  _$PresenceQueryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownProfileId = freezed,
  }) {
    return _then(_value.copyWith(
      ownProfileId: freezed == ownProfileId
          ? _value.ownProfileId
          : ownProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PresenceQueryOptionsCopyWith<$Res>
    implements $PresenceQueryOptionsCopyWith<$Res> {
  factory _$$_PresenceQueryOptionsCopyWith(_$_PresenceQueryOptions value,
          $Res Function(_$_PresenceQueryOptions) then) =
      __$$_PresenceQueryOptionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? ownProfileId});
}

/// @nodoc
class __$$_PresenceQueryOptionsCopyWithImpl<$Res>
    extends _$PresenceQueryOptionsCopyWithImpl<$Res, _$_PresenceQueryOptions>
    implements _$$_PresenceQueryOptionsCopyWith<$Res> {
  __$$_PresenceQueryOptionsCopyWithImpl(_$_PresenceQueryOptions _value,
      $Res Function(_$_PresenceQueryOptions) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownProfileId = freezed,
  }) {
    return _then(_$_PresenceQueryOptions(
      ownProfileId: freezed == ownProfileId
          ? _value.ownProfileId
          : ownProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_PresenceQueryOptions extends _PresenceQueryOptions
    with DiagnosticableTreeMixin {
  const _$_PresenceQueryOptions({this.ownProfileId}) : super._();

  @override
  final String? ownProfileId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PresenceQueryOptions(ownProfileId: $ownProfileId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PresenceQueryOptions'))
      ..add(DiagnosticsProperty('ownProfileId', ownProfileId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PresenceQueryOptions &&
            (identical(other.ownProfileId, ownProfileId) ||
                other.ownProfileId == ownProfileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ownProfileId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PresenceQueryOptionsCopyWith<_$_PresenceQueryOptions> get copyWith =>
      __$$_PresenceQueryOptionsCopyWithImpl<_$_PresenceQueryOptions>(
          this, _$identity);
}

abstract class _PresenceQueryOptions extends PresenceQueryOptions {
  const factory _PresenceQueryOptions({final String? ownProfileId}) =
      _$_PresenceQueryOptions;
  const _PresenceQueryOptions._() : super._();

  @override
  String? get ownProfileId;
  @override
  @JsonKey(ignore: true)
  _$$_PresenceQueryOptionsCopyWith<_$_PresenceQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}
