// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerSettingsEvent implements DiagnosticableTreeMixin {
  TimerSettings? get timerSettings;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerSettingsEventCopyWith<TimerSettingsEvent> get copyWith =>
      _$TimerSettingsEventCopyWithImpl<TimerSettingsEvent>(
          this as TimerSettingsEvent, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettingsEvent'))
      ..add(DiagnosticsProperty('timerSettings', timerSettings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsEvent &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsEvent(timerSettings: $timerSettings)';
  }
}

/// @nodoc
abstract mixin class $TimerSettingsEventCopyWith<$Res> {
  factory $TimerSettingsEventCopyWith(
          TimerSettingsEvent value, $Res Function(TimerSettingsEvent) _then) =
      _$TimerSettingsEventCopyWithImpl;
  @useResult
  $Res call({TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res>? get timerSettings;
}

/// @nodoc
class _$TimerSettingsEventCopyWithImpl<$Res>
    implements $TimerSettingsEventCopyWith<$Res> {
  _$TimerSettingsEventCopyWithImpl(this._self, this._then);

  final TimerSettingsEvent _self;
  final $Res Function(TimerSettingsEvent) _then;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = null,
  }) {
    return _then(_self.copyWith(
      timerSettings: null == timerSettings
          ? _self.timerSettings!
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res>? get timerSettings {
    if (_self.timerSettings == null) {
      return null;
    }

    return $TimerSettingsCopyWith<$Res>(_self.timerSettings!, (value) {
      return _then(_self.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class LoadTimerSettingsData extends TimerSettingsEvent
    with DiagnosticableTreeMixin {
  const LoadTimerSettingsData({this.timerSettings}) : super._();

  @override
  final TimerSettings? timerSettings;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadTimerSettingsDataCopyWith<LoadTimerSettingsData> get copyWith =>
      _$LoadTimerSettingsDataCopyWithImpl<LoadTimerSettingsData>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettingsEvent.load'))
      ..add(DiagnosticsProperty('timerSettings', timerSettings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadTimerSettingsData &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsEvent.load(timerSettings: $timerSettings)';
  }
}

/// @nodoc
abstract mixin class $LoadTimerSettingsDataCopyWith<$Res>
    implements $TimerSettingsEventCopyWith<$Res> {
  factory $LoadTimerSettingsDataCopyWith(LoadTimerSettingsData value,
          $Res Function(LoadTimerSettingsData) _then) =
      _$LoadTimerSettingsDataCopyWithImpl;
  @override
  @useResult
  $Res call({TimerSettings? timerSettings});

  @override
  $TimerSettingsCopyWith<$Res>? get timerSettings;
}

/// @nodoc
class _$LoadTimerSettingsDataCopyWithImpl<$Res>
    implements $LoadTimerSettingsDataCopyWith<$Res> {
  _$LoadTimerSettingsDataCopyWithImpl(this._self, this._then);

  final LoadTimerSettingsData _self;
  final $Res Function(LoadTimerSettingsData) _then;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timerSettings = freezed,
  }) {
    return _then(LoadTimerSettingsData(
      timerSettings: freezed == timerSettings
          ? _self.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings?,
    ));
  }

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res>? get timerSettings {
    if (_self.timerSettings == null) {
      return null;
    }

    return $TimerSettingsCopyWith<$Res>(_self.timerSettings!, (value) {
      return _then(_self.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class TimerSettingsChanged extends TimerSettingsEvent
    with DiagnosticableTreeMixin {
  const TimerSettingsChanged({required this.timerSettings}) : super._();

  @override
  final TimerSettings timerSettings;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerSettingsChangedCopyWith<TimerSettingsChanged> get copyWith =>
      _$TimerSettingsChangedCopyWithImpl<TimerSettingsChanged>(
          this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettingsEvent.changed'))
      ..add(DiagnosticsProperty('timerSettings', timerSettings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsChanged &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsEvent.changed(timerSettings: $timerSettings)';
  }
}

/// @nodoc
abstract mixin class $TimerSettingsChangedCopyWith<$Res>
    implements $TimerSettingsEventCopyWith<$Res> {
  factory $TimerSettingsChangedCopyWith(TimerSettingsChanged value,
          $Res Function(TimerSettingsChanged) _then) =
      _$TimerSettingsChangedCopyWithImpl;
  @override
  @useResult
  $Res call({TimerSettings timerSettings});

  @override
  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class _$TimerSettingsChangedCopyWithImpl<$Res>
    implements $TimerSettingsChangedCopyWith<$Res> {
  _$TimerSettingsChangedCopyWithImpl(this._self, this._then);

  final TimerSettingsChanged _self;
  final $Res Function(TimerSettingsChanged) _then;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timerSettings = null,
  }) {
    return _then(TimerSettingsChanged(
      timerSettings: null == timerSettings
          ? _self.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_self.timerSettings, (value) {
      return _then(_self.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc
mixin _$TimerSettingsState implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerSettingsState'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimerSettingsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsState()';
  }
}

/// @nodoc
class $TimerSettingsStateCopyWith<$Res> {
  $TimerSettingsStateCopyWith(
      TimerSettingsState _, $Res Function(TimerSettingsState) __);
}

/// @nodoc

class TimerSettingsDataLoadingState extends TimerSettingsState
    with DiagnosticableTreeMixin {
  const TimerSettingsDataLoadingState() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerSettingsState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsDataLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsState.loading()';
  }
}

/// @nodoc

class TimerSettingsDataLoadedState extends TimerSettingsState
    with DiagnosticableTreeMixin {
  const TimerSettingsDataLoadedState({required this.timerSettings}) : super._();

  final TimerSettings timerSettings;

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerSettingsDataLoadedStateCopyWith<TimerSettingsDataLoadedState>
      get copyWith => _$TimerSettingsDataLoadedStateCopyWithImpl<
          TimerSettingsDataLoadedState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettingsState.loaded'))
      ..add(DiagnosticsProperty('timerSettings', timerSettings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsDataLoadedState &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsState.loaded(timerSettings: $timerSettings)';
  }
}

/// @nodoc
abstract mixin class $TimerSettingsDataLoadedStateCopyWith<$Res>
    implements $TimerSettingsStateCopyWith<$Res> {
  factory $TimerSettingsDataLoadedStateCopyWith(
          TimerSettingsDataLoadedState value,
          $Res Function(TimerSettingsDataLoadedState) _then) =
      _$TimerSettingsDataLoadedStateCopyWithImpl;
  @useResult
  $Res call({TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class _$TimerSettingsDataLoadedStateCopyWithImpl<$Res>
    implements $TimerSettingsDataLoadedStateCopyWith<$Res> {
  _$TimerSettingsDataLoadedStateCopyWithImpl(this._self, this._then);

  final TimerSettingsDataLoadedState _self;
  final $Res Function(TimerSettingsDataLoadedState) _then;

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timerSettings = null,
  }) {
    return _then(TimerSettingsDataLoadedState(
      timerSettings: null == timerSettings
          ? _self.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_self.timerSettings, (value) {
      return _then(_self.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class TimerSettingsDataErrorState extends TimerSettingsState
    with DiagnosticableTreeMixin {
  const TimerSettingsDataErrorState() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerSettingsState.error'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsDataErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsState.error()';
  }
}

// dart format on
