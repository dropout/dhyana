// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TimerSettings _$TimerSettingsFromJson(Map<String, dynamic> json) {
  return _TimerSettings.fromJson(json);
}

/// @nodoc
mixin _$TimerSettings {
  @DurationConverter()
  Duration get warmup => throw _privateConstructorUsedError;
  @DurationConverter()
  Duration get duration => throw _privateConstructorUsedError;
  Sound get startingSound => throw _privateConstructorUsedError;
  Sound get endingSound => throw _privateConstructorUsedError;
  @DateTimeOrNullConverter()
  DateTime? get lastUsed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TimerSettingsCopyWith<TimerSettings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingsCopyWith<$Res> {
  factory $TimerSettingsCopyWith(
          TimerSettings value, $Res Function(TimerSettings) then) =
      _$TimerSettingsCopyWithImpl<$Res, TimerSettings>;
  @useResult
  $Res call(
      {@DurationConverter() Duration warmup,
      @DurationConverter() Duration duration,
      Sound startingSound,
      Sound endingSound,
      @DateTimeOrNullConverter() DateTime? lastUsed});
}

/// @nodoc
class _$TimerSettingsCopyWithImpl<$Res, $Val extends TimerSettings>
    implements $TimerSettingsCopyWith<$Res> {
  _$TimerSettingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warmup = null,
    Object? duration = null,
    Object? startingSound = null,
    Object? endingSound = null,
    Object? lastUsed = freezed,
  }) {
    return _then(_value.copyWith(
      warmup: null == warmup
          ? _value.warmup
          : warmup // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startingSound: null == startingSound
          ? _value.startingSound
          : startingSound // ignore: cast_nullable_to_non_nullable
              as Sound,
      endingSound: null == endingSound
          ? _value.endingSound
          : endingSound // ignore: cast_nullable_to_non_nullable
              as Sound,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TimerSettingsImplCopyWith<$Res>
    implements $TimerSettingsCopyWith<$Res> {
  factory _$$TimerSettingsImplCopyWith(
          _$TimerSettingsImpl value, $Res Function(_$TimerSettingsImpl) then) =
      __$$TimerSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@DurationConverter() Duration warmup,
      @DurationConverter() Duration duration,
      Sound startingSound,
      Sound endingSound,
      @DateTimeOrNullConverter() DateTime? lastUsed});
}

/// @nodoc
class __$$TimerSettingsImplCopyWithImpl<$Res>
    extends _$TimerSettingsCopyWithImpl<$Res, _$TimerSettingsImpl>
    implements _$$TimerSettingsImplCopyWith<$Res> {
  __$$TimerSettingsImplCopyWithImpl(
      _$TimerSettingsImpl _value, $Res Function(_$TimerSettingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warmup = null,
    Object? duration = null,
    Object? startingSound = null,
    Object? endingSound = null,
    Object? lastUsed = freezed,
  }) {
    return _then(_$TimerSettingsImpl(
      warmup: null == warmup
          ? _value.warmup
          : warmup // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startingSound: null == startingSound
          ? _value.startingSound
          : startingSound // ignore: cast_nullable_to_non_nullable
              as Sound,
      endingSound: null == endingSound
          ? _value.endingSound
          : endingSound // ignore: cast_nullable_to_non_nullable
              as Sound,
      lastUsed: freezed == lastUsed
          ? _value.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TimerSettingsImpl extends _TimerSettings with DiagnosticableTreeMixin {
  const _$TimerSettingsImpl(
      {@DurationConverter() this.warmup = const Duration(minutes: 1),
      @DurationConverter() this.duration = const Duration(minutes: 10),
      this.startingSound = Sound.smallBell,
      this.endingSound = Sound.smallBell,
      @DateTimeOrNullConverter() this.lastUsed})
      : super._();

  factory _$TimerSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerSettingsImplFromJson(json);

  @override
  @JsonKey()
  @DurationConverter()
  final Duration warmup;
  @override
  @JsonKey()
  @DurationConverter()
  final Duration duration;
  @override
  @JsonKey()
  final Sound startingSound;
  @override
  @JsonKey()
  final Sound endingSound;
  @override
  @DateTimeOrNullConverter()
  final DateTime? lastUsed;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettings(warmup: $warmup, duration: $duration, startingSound: $startingSound, endingSound: $endingSound, lastUsed: $lastUsed)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettings'))
      ..add(DiagnosticsProperty('warmup', warmup))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('startingSound', startingSound))
      ..add(DiagnosticsProperty('endingSound', endingSound))
      ..add(DiagnosticsProperty('lastUsed', lastUsed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsImpl &&
            (identical(other.warmup, warmup) || other.warmup == warmup) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.startingSound, startingSound) ||
                other.startingSound == startingSound) &&
            (identical(other.endingSound, endingSound) ||
                other.endingSound == endingSound) &&
            (identical(other.lastUsed, lastUsed) ||
                other.lastUsed == lastUsed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, warmup, duration, startingSound, endingSound, lastUsed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingsImplCopyWith<_$TimerSettingsImpl> get copyWith =>
      __$$TimerSettingsImplCopyWithImpl<_$TimerSettingsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TimerSettingsImplToJson(
      this,
    );
  }
}

abstract class _TimerSettings extends TimerSettings {
  const factory _TimerSettings(
          {@DurationConverter() final Duration warmup,
          @DurationConverter() final Duration duration,
          final Sound startingSound,
          final Sound endingSound,
          @DateTimeOrNullConverter() final DateTime? lastUsed}) =
      _$TimerSettingsImpl;
  const _TimerSettings._() : super._();

  factory _TimerSettings.fromJson(Map<String, dynamic> json) =
      _$TimerSettingsImpl.fromJson;

  @override
  @DurationConverter()
  Duration get warmup;
  @override
  @DurationConverter()
  Duration get duration;
  @override
  Sound get startingSound;
  @override
  Sound get endingSound;
  @override
  @DateTimeOrNullConverter()
  DateTime? get lastUsed;
  @override
  @JsonKey(ignore: true)
  _$$TimerSettingsImplCopyWith<_$TimerSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
