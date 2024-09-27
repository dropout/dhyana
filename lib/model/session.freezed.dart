// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Session _$SessionFromJson(Map<String, dynamic> json) {
  return _Session.fromJson(json);
}

/// @nodoc
mixin _$Session {
  String get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get startTime => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get endTime => throw _privateConstructorUsedError;
  @DurationConverter()
  Duration get duration => throw _privateConstructorUsedError;
  TimerSettings get timerSettings => throw _privateConstructorUsedError;
  int get consecutiveDays => throw _privateConstructorUsedError;

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionCopyWith<Session> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) then) =
      _$SessionCopyWithImpl<$Res, Session>;
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime startTime,
      @DateTimeConverter() DateTime endTime,
      @DurationConverter() Duration duration,
      TimerSettings timerSettings,
      int consecutiveDays});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class _$SessionCopyWithImpl<$Res, $Val extends Session>
    implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? timerSettings = null,
    Object? consecutiveDays = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Session
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
abstract class _$$SessionImplCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$$SessionImplCopyWith(
          _$SessionImpl value, $Res Function(_$SessionImpl) then) =
      __$$SessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime startTime,
      @DateTimeConverter() DateTime endTime,
      @DurationConverter() Duration duration,
      TimerSettings timerSettings,
      int consecutiveDays});

  @override
  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$SessionImplCopyWithImpl<$Res>
    extends _$SessionCopyWithImpl<$Res, _$SessionImpl>
    implements _$$SessionImplCopyWith<$Res> {
  __$$SessionImplCopyWithImpl(
      _$SessionImpl _value, $Res Function(_$SessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? timerSettings = null,
    Object? consecutiveDays = null,
  }) {
    return _then(_$SessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      consecutiveDays: null == consecutiveDays
          ? _value.consecutiveDays
          : consecutiveDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionImpl extends _Session with DiagnosticableTreeMixin {
  const _$SessionImpl(
      {required this.id,
      @DateTimeConverter() required this.startTime,
      @DateTimeConverter() required this.endTime,
      @DurationConverter() required this.duration,
      required this.timerSettings,
      this.consecutiveDays = 0})
      : super._();

  factory _$SessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionImplFromJson(json);

  @override
  final String id;
  @override
  @DateTimeConverter()
  final DateTime startTime;
  @override
  @DateTimeConverter()
  final DateTime endTime;
  @override
  @DurationConverter()
  final Duration duration;
  @override
  final TimerSettings timerSettings;
  @override
  @JsonKey()
  final int consecutiveDays;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Session(id: $id, startTime: $startTime, endTime: $endTime, duration: $duration, timerSettings: $timerSettings, consecutiveDays: $consecutiveDays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Session'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('timerSettings', timerSettings))
      ..add(DiagnosticsProperty('consecutiveDays', consecutiveDays));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings) &&
            (identical(other.consecutiveDays, consecutiveDays) ||
                other.consecutiveDays == consecutiveDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, startTime, endTime, duration,
      timerSettings, consecutiveDays);

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      __$$SessionImplCopyWithImpl<_$SessionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionImplToJson(
      this,
    );
  }
}

abstract class _Session extends Session {
  const factory _Session(
      {required final String id,
      @DateTimeConverter() required final DateTime startTime,
      @DateTimeConverter() required final DateTime endTime,
      @DurationConverter() required final Duration duration,
      required final TimerSettings timerSettings,
      final int consecutiveDays}) = _$SessionImpl;
  const _Session._() : super._();

  factory _Session.fromJson(Map<String, dynamic> json) = _$SessionImpl.fromJson;

  @override
  String get id;
  @override
  @DateTimeConverter()
  DateTime get startTime;
  @override
  @DateTimeConverter()
  DateTime get endTime;
  @override
  @DurationConverter()
  Duration get duration;
  @override
  TimerSettings get timerSettings;
  @override
  int get consecutiveDays;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionImplCopyWith<_$SessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
