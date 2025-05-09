// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_history_record_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerSettingsHistoryRecordQueryOptions
    _$TimerSettingsHistoryRecordQueryOptionsFromJson(
        Map<String, dynamic> json) {
  return _TimerSettingsHistoryRecordQueryOptions.fromJson(json);
}

/// @nodoc
mixin _$TimerSettingsHistoryRecordQueryOptions {
  int get limit => throw _privateConstructorUsedError;

  /// Serializes this TimerSettingsHistoryRecordQueryOptions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimerSettingsHistoryRecordQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerSettingsHistoryRecordQueryOptionsCopyWith<
          TimerSettingsHistoryRecordQueryOptions>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingsHistoryRecordQueryOptionsCopyWith<$Res> {
  factory $TimerSettingsHistoryRecordQueryOptionsCopyWith(
          TimerSettingsHistoryRecordQueryOptions value,
          $Res Function(TimerSettingsHistoryRecordQueryOptions) then) =
      _$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl<$Res,
          TimerSettingsHistoryRecordQueryOptions>;
  @useResult
  $Res call({int limit});
}

/// @nodoc
class _$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl<$Res,
        $Val extends TimerSettingsHistoryRecordQueryOptions>
    implements $TimerSettingsHistoryRecordQueryOptionsCopyWith<$Res> {
  _$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerSettingsHistoryRecordQueryOptions
  /// with the given fields replaced by the non-null parameter values.
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
abstract class _$$TimerSettingsHistoryRecordQueryOptionsImplCopyWith<$Res>
    implements $TimerSettingsHistoryRecordQueryOptionsCopyWith<$Res> {
  factory _$$TimerSettingsHistoryRecordQueryOptionsImplCopyWith(
          _$TimerSettingsHistoryRecordQueryOptionsImpl value,
          $Res Function(_$TimerSettingsHistoryRecordQueryOptionsImpl) then) =
      __$$TimerSettingsHistoryRecordQueryOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int limit});
}

/// @nodoc
class __$$TimerSettingsHistoryRecordQueryOptionsImplCopyWithImpl<$Res>
    extends _$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl<$Res,
        _$TimerSettingsHistoryRecordQueryOptionsImpl>
    implements _$$TimerSettingsHistoryRecordQueryOptionsImplCopyWith<$Res> {
  __$$TimerSettingsHistoryRecordQueryOptionsImplCopyWithImpl(
      _$TimerSettingsHistoryRecordQueryOptionsImpl _value,
      $Res Function(_$TimerSettingsHistoryRecordQueryOptionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsHistoryRecordQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? limit = null,
  }) {
    return _then(_$TimerSettingsHistoryRecordQueryOptionsImpl(
      limit: null == limit
          ? _value.limit
          : limit // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerSettingsHistoryRecordQueryOptionsImpl
    extends _TimerSettingsHistoryRecordQueryOptions
    with DiagnosticableTreeMixin {
  const _$TimerSettingsHistoryRecordQueryOptionsImpl({this.limit = 20})
      : super._();

  factory _$TimerSettingsHistoryRecordQueryOptionsImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TimerSettingsHistoryRecordQueryOptionsImplFromJson(json);

  @override
  @JsonKey()
  final int limit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsHistoryRecordQueryOptions(limit: $limit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(
          DiagnosticsProperty('type', 'TimerSettingsHistoryRecordQueryOptions'))
      ..add(DiagnosticsProperty('limit', limit));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsHistoryRecordQueryOptionsImpl &&
            (identical(other.limit, limit) || other.limit == limit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, limit);

  /// Create a copy of TimerSettingsHistoryRecordQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingsHistoryRecordQueryOptionsImplCopyWith<
          _$TimerSettingsHistoryRecordQueryOptionsImpl>
      get copyWith =>
          __$$TimerSettingsHistoryRecordQueryOptionsImplCopyWithImpl<
              _$TimerSettingsHistoryRecordQueryOptionsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerSettingsHistoryRecordQueryOptionsImplToJson(
      this,
    );
  }
}

abstract class _TimerSettingsHistoryRecordQueryOptions
    extends TimerSettingsHistoryRecordQueryOptions {
  const factory _TimerSettingsHistoryRecordQueryOptions({final int limit}) =
      _$TimerSettingsHistoryRecordQueryOptionsImpl;
  const _TimerSettingsHistoryRecordQueryOptions._() : super._();

  factory _TimerSettingsHistoryRecordQueryOptions.fromJson(
          Map<String, dynamic> json) =
      _$TimerSettingsHistoryRecordQueryOptionsImpl.fromJson;

  @override
  int get limit;

  /// Create a copy of TimerSettingsHistoryRecordQueryOptions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerSettingsHistoryRecordQueryOptionsImplCopyWith<
          _$TimerSettingsHistoryRecordQueryOptionsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
