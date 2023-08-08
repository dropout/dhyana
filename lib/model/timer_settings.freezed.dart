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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TimerSettings _$TimerSettingsFromJson(Map<String, dynamic> json) {
  return _TimerSettings.fromJson(json);
}

/// @nodoc
mixin _$TimerSettings {
  Duration get warmup => throw _privateConstructorUsedError;
  Duration get duration => throw _privateConstructorUsedError;
  Sound get startingSound => throw _privateConstructorUsedError;
  Sound get endingSound => throw _privateConstructorUsedError;

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
      {Duration warmup,
      Duration duration,
      Sound startingSound,
      Sound endingSound});
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerSettingsCopyWith<$Res>
    implements $TimerSettingsCopyWith<$Res> {
  factory _$$_TimerSettingsCopyWith(
          _$_TimerSettings value, $Res Function(_$_TimerSettings) then) =
      __$$_TimerSettingsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Duration warmup,
      Duration duration,
      Sound startingSound,
      Sound endingSound});
}

/// @nodoc
class __$$_TimerSettingsCopyWithImpl<$Res>
    extends _$TimerSettingsCopyWithImpl<$Res, _$_TimerSettings>
    implements _$$_TimerSettingsCopyWith<$Res> {
  __$$_TimerSettingsCopyWithImpl(
      _$_TimerSettings _value, $Res Function(_$_TimerSettings) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warmup = null,
    Object? duration = null,
    Object? startingSound = null,
    Object? endingSound = null,
  }) {
    return _then(_$_TimerSettings(
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
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TimerSettings extends _TimerSettings with DiagnosticableTreeMixin {
  const _$_TimerSettings(
      {this.warmup = const Duration(minutes: 1),
      this.duration = const Duration(minutes: 10),
      this.startingSound = Sound.none,
      this.endingSound = Sound.none})
      : super._();

  factory _$_TimerSettings.fromJson(Map<String, dynamic> json) =>
      _$$_TimerSettingsFromJson(json);

  @override
  @JsonKey()
  final Duration warmup;
  @override
  @JsonKey()
  final Duration duration;
  @override
  @JsonKey()
  final Sound startingSound;
  @override
  @JsonKey()
  final Sound endingSound;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettings(warmup: $warmup, duration: $duration, startingSound: $startingSound, endingSound: $endingSound)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettings'))
      ..add(DiagnosticsProperty('warmup', warmup))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('startingSound', startingSound))
      ..add(DiagnosticsProperty('endingSound', endingSound));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerSettings &&
            (identical(other.warmup, warmup) || other.warmup == warmup) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.startingSound, startingSound) ||
                other.startingSound == startingSound) &&
            (identical(other.endingSound, endingSound) ||
                other.endingSound == endingSound));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, warmup, duration, startingSound, endingSound);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerSettingsCopyWith<_$_TimerSettings> get copyWith =>
      __$$_TimerSettingsCopyWithImpl<_$_TimerSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TimerSettingsToJson(
      this,
    );
  }
}

abstract class _TimerSettings extends TimerSettings {
  const factory _TimerSettings(
      {final Duration warmup,
      final Duration duration,
      final Sound startingSound,
      final Sound endingSound}) = _$_TimerSettings;
  const _TimerSettings._() : super._();

  factory _TimerSettings.fromJson(Map<String, dynamic> json) =
      _$_TimerSettings.fromJson;

  @override
  Duration get warmup;
  @override
  Duration get duration;
  @override
  Sound get startingSound;
  @override
  Sound get endingSound;
  @override
  @JsonKey(ignore: true)
  _$$_TimerSettingsCopyWith<_$_TimerSettings> get copyWith =>
      throw _privateConstructorUsedError;
}
