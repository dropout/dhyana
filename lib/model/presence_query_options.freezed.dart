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
  Duration get windowSize => throw _privateConstructorUsedError;

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
  $Res call({Duration windowSize});
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
    Object? windowSize = null,
  }) {
    return _then(_value.copyWith(
      windowSize: null == windowSize
          ? _value.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as Duration,
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
  $Res call({Duration windowSize});
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
    Object? windowSize = null,
  }) {
    return _then(_$_PresenceQueryOptions(
      windowSize: null == windowSize
          ? _value.windowSize
          : windowSize // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$_PresenceQueryOptions extends _PresenceQueryOptions
    with DiagnosticableTreeMixin {
  const _$_PresenceQueryOptions({this.windowSize = const Duration(hours: 3)})
      : super._();

  @override
  @JsonKey()
  final Duration windowSize;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PresenceQueryOptions(windowSize: $windowSize)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PresenceQueryOptions'))
      ..add(DiagnosticsProperty('windowSize', windowSize));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PresenceQueryOptions &&
            (identical(other.windowSize, windowSize) ||
                other.windowSize == windowSize));
  }

  @override
  int get hashCode => Object.hash(runtimeType, windowSize);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PresenceQueryOptionsCopyWith<_$_PresenceQueryOptions> get copyWith =>
      __$$_PresenceQueryOptionsCopyWithImpl<_$_PresenceQueryOptions>(
          this, _$identity);
}

abstract class _PresenceQueryOptions extends PresenceQueryOptions {
  const factory _PresenceQueryOptions({final Duration windowSize}) =
      _$_PresenceQueryOptions;
  const _PresenceQueryOptions._() : super._();

  @override
  Duration get windowSize;
  @override
  @JsonKey(ignore: true)
  _$$_PresenceQueryOptionsCopyWith<_$_PresenceQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}
