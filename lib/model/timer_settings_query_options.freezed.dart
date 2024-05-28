// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerSettingsQueryOptions _$TimerSettingsQueryOptionsFromJson(
    Map<String, dynamic> json) {
  return _TimerSettingsQueryOptions.fromJson(json);
}

/// @nodoc
mixin _$TimerSettingsQueryOptions {
  int get limit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerSettingsQueryOptionsCopyWith<TimerSettingsQueryOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingsQueryOptionsCopyWith<$Res> {
  factory $TimerSettingsQueryOptionsCopyWith(TimerSettingsQueryOptions value,
          $Res Function(TimerSettingsQueryOptions) then) =
      _$TimerSettingsQueryOptionsCopyWithImpl<$Res, TimerSettingsQueryOptions>;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class _$TimerSettingsQueryOptionsCopyWithImpl<$Res,
        $Val extends TimerSettingsQueryOptions>
    implements $TimerSettingsQueryOptionsCopyWith<$Res> {
  _$TimerSettingsQueryOptionsCopyWithImpl(this._value, this._then);

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
abstract class _$$TimerSettingsQueryOptionsImplCopyWith<$Res>
    implements $TimerSettingsQueryOptionsCopyWith<$Res> {
  factory _$$TimerSettingsQueryOptionsImplCopyWith(
          _$TimerSettingsQueryOptionsImpl value,
          $Res Function(_$TimerSettingsQueryOptionsImpl) then) =
      __$$TimerSettingsQueryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit});
}

/// @nodoc
class __$$TimerSettingsQueryOptionsImplCopyWithImpl<$Res>
    extends _$TimerSettingsQueryOptionsCopyWithImpl<$Res,
        _$TimerSettingsQueryOptionsImpl>
    implements _$$TimerSettingsQueryOptionsImplCopyWith<$Res> {
  __$$TimerSettingsQueryOptionsImplCopyWithImpl(
      _$TimerSettingsQueryOptionsImpl _value,
      $Res Function(_$TimerSettingsQueryOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
  }) {
    return _then(_$TimerSettingsQueryOptionsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerSettingsQueryOptionsImpl extends _TimerSettingsQueryOptions
    with DiagnosticableTreeMixin {
  const _$TimerSettingsQueryOptionsImpl({this.limit = 20}) : super._();

  factory _$TimerSettingsQueryOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerSettingsQueryOptionsImplFromJson(json);

  @override
  @JsonKey()
  final int limit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsQueryOptions(limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettingsQueryOptions'))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsQueryOptionsImpl &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, limit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingsQueryOptionsImplCopyWith<_$TimerSettingsQueryOptionsImpl>
      get copyWith => __$$TimerSettingsQueryOptionsImplCopyWithImpl<
          _$TimerSettingsQueryOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerSettingsQueryOptionsImplToJson(
      this,
    );
  }
}

abstract class _TimerSettingsQueryOptions extends TimerSettingsQueryOptions {
  const factory _TimerSettingsQueryOptions({final int limit}) =
      _$TimerSettingsQueryOptionsImpl;
  const _TimerSettingsQueryOptions._() : super._();

  factory _TimerSettingsQueryOptions.fromJson(Map<String, dynamic> json) =
      _$TimerSettingsQueryOptionsImpl.fromJson;

  @override
  int get limit;
  @override
  @JsonKey(ignore: true)
  _$$TimerSettingsQueryOptionsImplCopyWith<_$TimerSettingsQueryOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
