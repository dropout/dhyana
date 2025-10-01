// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerSettings implements DiagnosticableTreeMixin {
  @DurationConverter()
  Duration get warmup;
  @DurationConverter()
  Duration get duration;
  Sound get startingSound;
  Sound get endingSound;
  @DateTimeOrNullConverter()
  DateTime? get lastUsed;

  /// Create a copy of TimerSettings
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<TimerSettings> get copyWith =>
      _$TimerSettingsCopyWithImpl<TimerSettings>(
          this as TimerSettings, _$identity);

  /// Serializes this TimerSettings to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is TimerSettings &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, warmup, duration, startingSound, endingSound, lastUsed);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettings(warmup: $warmup, duration: $duration, startingSound: $startingSound, endingSound: $endingSound, lastUsed: $lastUsed)';
  }
}

/// @nodoc
abstract mixin class $TimerSettingsCopyWith<$Res> {
  factory $TimerSettingsCopyWith(
          TimerSettings value, $Res Function(TimerSettings) _then) =
      _$TimerSettingsCopyWithImpl;
  @useResult
  $Res call(
      {@DurationConverter() Duration warmup,
      @DurationConverter() Duration duration,
      Sound startingSound,
      Sound endingSound,
      @DateTimeOrNullConverter() DateTime? lastUsed});
}

/// @nodoc
class _$TimerSettingsCopyWithImpl<$Res>
    implements $TimerSettingsCopyWith<$Res> {
  _$TimerSettingsCopyWithImpl(this._self, this._then);

  final TimerSettings _self;
  final $Res Function(TimerSettings) _then;

  /// Create a copy of TimerSettings
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? warmup = null,
    Object? duration = null,
    Object? startingSound = null,
    Object? endingSound = null,
    Object? lastUsed = freezed,
  }) {
    return _then(_self.copyWith(
      warmup: null == warmup
          ? _self.warmup
          : warmup // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startingSound: null == startingSound
          ? _self.startingSound
          : startingSound // ignore: cast_nullable_to_non_nullable
              as Sound,
      endingSound: null == endingSound
          ? _self.endingSound
          : endingSound // ignore: cast_nullable_to_non_nullable
              as Sound,
      lastUsed: freezed == lastUsed
          ? _self.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// Adds pattern-matching-related methods to [TimerSettings].
extension TimerSettingsPatterns on TimerSettings {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_TimerSettings value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TimerSettings() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_TimerSettings value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimerSettings():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_TimerSettings value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimerSettings() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @DurationConverter() Duration warmup,
            @DurationConverter() Duration duration,
            Sound startingSound,
            Sound endingSound,
            @DateTimeOrNullConverter() DateTime? lastUsed)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TimerSettings() when $default != null:
        return $default(_that.warmup, _that.duration, _that.startingSound,
            _that.endingSound, _that.lastUsed);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @DurationConverter() Duration warmup,
            @DurationConverter() Duration duration,
            Sound startingSound,
            Sound endingSound,
            @DateTimeOrNullConverter() DateTime? lastUsed)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimerSettings():
        return $default(_that.warmup, _that.duration, _that.startingSound,
            _that.endingSound, _that.lastUsed);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @DurationConverter() Duration warmup,
            @DurationConverter() Duration duration,
            Sound startingSound,
            Sound endingSound,
            @DateTimeOrNullConverter() DateTime? lastUsed)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimerSettings() when $default != null:
        return $default(_that.warmup, _that.duration, _that.startingSound,
            _that.endingSound, _that.lastUsed);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _TimerSettings extends TimerSettings with DiagnosticableTreeMixin {
  const _TimerSettings(
      {@DurationConverter() this.warmup = const Duration(minutes: 1),
      @DurationConverter() this.duration = const Duration(minutes: 10),
      this.startingSound = Sound.smallBell,
      this.endingSound = Sound.smallBell,
      @DateTimeOrNullConverter() this.lastUsed})
      : super._();
  factory _TimerSettings.fromJson(Map<String, dynamic> json) =>
      _$TimerSettingsFromJson(json);

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

  /// Create a copy of TimerSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimerSettingsCopyWith<_TimerSettings> get copyWith =>
      __$TimerSettingsCopyWithImpl<_TimerSettings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TimerSettingsToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _TimerSettings &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, warmup, duration, startingSound, endingSound, lastUsed);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettings(warmup: $warmup, duration: $duration, startingSound: $startingSound, endingSound: $endingSound, lastUsed: $lastUsed)';
  }
}

/// @nodoc
abstract mixin class _$TimerSettingsCopyWith<$Res>
    implements $TimerSettingsCopyWith<$Res> {
  factory _$TimerSettingsCopyWith(
          _TimerSettings value, $Res Function(_TimerSettings) _then) =
      __$TimerSettingsCopyWithImpl;
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
class __$TimerSettingsCopyWithImpl<$Res>
    implements _$TimerSettingsCopyWith<$Res> {
  __$TimerSettingsCopyWithImpl(this._self, this._then);

  final _TimerSettings _self;
  final $Res Function(_TimerSettings) _then;

  /// Create a copy of TimerSettings
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? warmup = null,
    Object? duration = null,
    Object? startingSound = null,
    Object? endingSound = null,
    Object? lastUsed = freezed,
  }) {
    return _then(_TimerSettings(
      warmup: null == warmup
          ? _self.warmup
          : warmup // ignore: cast_nullable_to_non_nullable
              as Duration,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      startingSound: null == startingSound
          ? _self.startingSound
          : startingSound // ignore: cast_nullable_to_non_nullable
              as Sound,
      endingSound: null == endingSound
          ? _self.endingSound
          : endingSound // ignore: cast_nullable_to_non_nullable
              as Sound,
      lastUsed: freezed == lastUsed
          ? _self.lastUsed
          : lastUsed // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
