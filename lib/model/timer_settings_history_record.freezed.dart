// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_history_record.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerSettingsHistoryRecord _$TimerSettingsHistoryRecordFromJson(
    Map<String, dynamic> json) {
  return _TimerSettingsHistoryRecord.fromJson(json);
}

/// @nodoc
mixin _$TimerSettingsHistoryRecord {
  String get id => throw _privateConstructorUsedError;
  TimerSettings get timerSettings => throw _privateConstructorUsedError;
  int get useCount => throw _privateConstructorUsedError;
  DateTime get lastUsed => throw _privateConstructorUsedError;

  /// Serializes this TimerSettingsHistoryRecord to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TimerSettingsHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerSettingsHistoryRecordCopyWith<TimerSettingsHistoryRecord>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingsHistoryRecordCopyWith<$Res> {
  factory $TimerSettingsHistoryRecordCopyWith(TimerSettingsHistoryRecord value,
          $Res Function(TimerSettingsHistoryRecord) then) =
      _$TimerSettingsHistoryRecordCopyWithImpl<$Res,
          TimerSettingsHistoryRecord>;
  @useResult
  $Res call(
      {String id,
      TimerSettings timerSettings,
      int useCount,
      DateTime lastUsed});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class _$TimerSettingsHistoryRecordCopyWithImpl<$Res,
        $Val extends TimerSettingsHistoryRecord>
    implements $TimerSettingsHistoryRecordCopyWith<$Res> {
  _$TimerSettingsHistoryRecordCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerSettingsHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timerSettings = null,
    Object? useCount = null,
    Object? lastUsed = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      useCount: null == useCount
          ? _value.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastUsed: null == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of TimerSettingsHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimerSettingsHistoryRecordImplCopyWith<$Res>
    implements $TimerSettingsHistoryRecordCopyWith<$Res> {
  factory _$$TimerSettingsHistoryRecordImplCopyWith(
          _$TimerSettingsHistoryRecordImpl value,
          $Res Function(_$TimerSettingsHistoryRecordImpl) then) =
      __$$TimerSettingsHistoryRecordImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      TimerSettings timerSettings,
      int useCount,
      DateTime lastUsed});

  @override
  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$TimerSettingsHistoryRecordImplCopyWithImpl<$Res>
    extends _$TimerSettingsHistoryRecordCopyWithImpl<$Res,
        _$TimerSettingsHistoryRecordImpl>
    implements _$$TimerSettingsHistoryRecordImplCopyWith<$Res> {
  __$$TimerSettingsHistoryRecordImplCopyWithImpl(
      _$TimerSettingsHistoryRecordImpl _value,
      $Res Function(_$TimerSettingsHistoryRecordImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timerSettings = null,
    Object? useCount = null,
    Object? lastUsed = null,
  }) {
    return _then(_$TimerSettingsHistoryRecordImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      useCount: null == useCount
          ? _value.useCount
          : useCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastUsed: null == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerSettingsHistoryRecordImpl extends _TimerSettingsHistoryRecord
    with DiagnosticableTreeMixin {
  const _$TimerSettingsHistoryRecordImpl(
      {required this.id,
      required this.timerSettings,
      required this.useCount,
      required this.lastUsed})
      : super._();

  factory _$TimerSettingsHistoryRecordImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$TimerSettingsHistoryRecordImplFromJson(json);

  @override
  final String id;
  @override
  final TimerSettings timerSettings;
  @override
  final int useCount;
  @override
  final DateTime lastUsed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsHistoryRecord(id: $id, timerSettings: $timerSettings, useCount: $useCount, lastUsed: $lastUsed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettingsHistoryRecord'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('timerSettings', timerSettings))
      ..add(DiagnosticsProperty('useCount', useCount))
      ..add(DiagnosticsProperty('lastUsed', lastUsed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsHistoryRecordImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings) &&
            (identical(other.useCount, useCount) ||
                other.useCount == useCount) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, timerSettings, useCount, lastUsed);

  /// Create a copy of TimerSettingsHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingsHistoryRecordImplCopyWith<_$TimerSettingsHistoryRecordImpl>
      get copyWith => __$$TimerSettingsHistoryRecordImplCopyWithImpl<
          _$TimerSettingsHistoryRecordImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerSettingsHistoryRecordImplToJson(
      this,
    );
  }
}

abstract class _TimerSettingsHistoryRecord extends TimerSettingsHistoryRecord {
  const factory _TimerSettingsHistoryRecord(
      {required final String id,
      required final TimerSettings timerSettings,
      required final int useCount,
      required final DateTime lastUsed}) = _$TimerSettingsHistoryRecordImpl;
  const _TimerSettingsHistoryRecord._() : super._();

  factory _TimerSettingsHistoryRecord.fromJson(Map<String, dynamic> json) =
      _$TimerSettingsHistoryRecordImpl.fromJson;

  @override
  String get id;
  @override
  TimerSettings get timerSettings;
  @override
  int get useCount;
  @override
  DateTime get lastUsed;

  /// Create a copy of TimerSettingsHistoryRecord
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerSettingsHistoryRecordImplCopyWith<_$TimerSettingsHistoryRecordImpl>
      get copyWith => throw _privateConstructorUsedError;
}
