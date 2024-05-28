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
  String get id => throw _privateConstructorUsedError;
  Duration get warmup => throw _privateConstructorUsedError;
  @DurationConverter()
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
      {String id,
      Duration warmup,
      @DurationConverter() Duration duration,
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
    Object? id = null,
    Object? warmup = null,
    Object? duration = null,
    Object? startingSound = null,
    Object? endingSound = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$TimerSettingsImplCopyWith<$Res>
    implements $TimerSettingsCopyWith<$Res> {
  factory _$$TimerSettingsImplCopyWith(
          _$TimerSettingsImpl value, $Res Function(_$TimerSettingsImpl) then) =
      __$$TimerSettingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Duration warmup,
      @DurationConverter() Duration duration,
      Sound startingSound,
      Sound endingSound});
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
    Object? id = null,
    Object? warmup = null,
    Object? duration = null,
    Object? startingSound = null,
    Object? endingSound = null,
  }) {
    return _then(_$TimerSettingsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$TimerSettingsImpl extends _TimerSettings with DiagnosticableTreeMixin {
  const _$TimerSettingsImpl(
      {required this.id,
      required this.warmup,
      @DurationConverter() required this.duration,
      required this.startingSound,
      required this.endingSound})
      : super._();

  factory _$TimerSettingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TimerSettingsImplFromJson(json);

  @override
  final String id;
  @override
  final Duration warmup;
  @override
  @DurationConverter()
  final Duration duration;
  @override
  final Sound startingSound;
  @override
  final Sound endingSound;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettings(id: $id, warmup: $warmup, duration: $duration, startingSound: $startingSound, endingSound: $endingSound)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettings'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('warmup', warmup))
      ..add(DiagnosticsProperty('duration', duration))
      ..add(DiagnosticsProperty('startingSound', startingSound))
      ..add(DiagnosticsProperty('endingSound', endingSound));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsImpl &&
            (identical(other.id, id) || other.id == id) &&
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
  int get hashCode => Object.hash(
      runtimeType, id, warmup, duration, startingSound, endingSound);

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
      {required final String id,
      required final Duration warmup,
      @DurationConverter() required final Duration duration,
      required final Sound startingSound,
      required final Sound endingSound}) = _$TimerSettingsImpl;
  const _TimerSettings._() : super._();

  factory _TimerSettings.fromJson(Map<String, dynamic> json) =
      _$TimerSettingsImpl.fromJson;

  @override
  String get id;
  @override
  Duration get warmup;
  @override
  @DurationConverter()
  Duration get duration;
  @override
  Sound get startingSound;
  @override
  Sound get endingSound;
  @override
  @JsonKey(ignore: true)
  _$$TimerSettingsImplCopyWith<_$TimerSettingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
