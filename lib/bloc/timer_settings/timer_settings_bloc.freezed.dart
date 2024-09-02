// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimerSettingsEvent {
  TimerSettings? get timerSettings => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TimerSettings? timerSettings) load,
    required TResult Function(TimerSettings timerSettings) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimerSettings? timerSettings)? load,
    TResult? Function(TimerSettings timerSettings)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimerSettings? timerSettings)? load,
    TResult Function(TimerSettings timerSettings)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTimerSettingsData value) load,
    required TResult Function(TimerSettingsChanged value) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTimerSettingsData value)? load,
    TResult? Function(TimerSettingsChanged value)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTimerSettingsData value)? load,
    TResult Function(TimerSettingsChanged value)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerSettingsEventCopyWith<TimerSettingsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingsEventCopyWith<$Res> {
  factory $TimerSettingsEventCopyWith(
          TimerSettingsEvent value, $Res Function(TimerSettingsEvent) then) =
      _$TimerSettingsEventCopyWithImpl<$Res, TimerSettingsEvent>;
  @useResult
  $Res call({TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res>? get timerSettings;
}

/// @nodoc
class _$TimerSettingsEventCopyWithImpl<$Res, $Val extends TimerSettingsEvent>
    implements $TimerSettingsEventCopyWith<$Res> {
  _$TimerSettingsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = null,
  }) {
    return _then(_value.copyWith(
      timerSettings: null == timerSettings
          ? _value.timerSettings!
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ) as $Val);
  }

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res>? get timerSettings {
    if (_value.timerSettings == null) {
      return null;
    }

    return $TimerSettingsCopyWith<$Res>(_value.timerSettings!, (value) {
      return _then(_value.copyWith(timerSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoadTimerSettingsDataImplCopyWith<$Res>
    implements $TimerSettingsEventCopyWith<$Res> {
  factory _$$LoadTimerSettingsDataImplCopyWith(
          _$LoadTimerSettingsDataImpl value,
          $Res Function(_$LoadTimerSettingsDataImpl) then) =
      __$$LoadTimerSettingsDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimerSettings? timerSettings});

  @override
  $TimerSettingsCopyWith<$Res>? get timerSettings;
}

/// @nodoc
class __$$LoadTimerSettingsDataImplCopyWithImpl<$Res>
    extends _$TimerSettingsEventCopyWithImpl<$Res, _$LoadTimerSettingsDataImpl>
    implements _$$LoadTimerSettingsDataImplCopyWith<$Res> {
  __$$LoadTimerSettingsDataImplCopyWithImpl(_$LoadTimerSettingsDataImpl _value,
      $Res Function(_$LoadTimerSettingsDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = freezed,
  }) {
    return _then(_$LoadTimerSettingsDataImpl(
      timerSettings: freezed == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings?,
    ));
  }
}

/// @nodoc

class _$LoadTimerSettingsDataImpl extends LoadTimerSettingsData
    with DiagnosticableTreeMixin {
  const _$LoadTimerSettingsDataImpl({this.timerSettings}) : super._();

  @override
  final TimerSettings? timerSettings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsEvent.load(timerSettings: $timerSettings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettingsEvent.load'))
      ..add(DiagnosticsProperty('timerSettings', timerSettings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTimerSettingsDataImpl &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTimerSettingsDataImplCopyWith<_$LoadTimerSettingsDataImpl>
      get copyWith => __$$LoadTimerSettingsDataImplCopyWithImpl<
          _$LoadTimerSettingsDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TimerSettings? timerSettings) load,
    required TResult Function(TimerSettings timerSettings) changed,
  }) {
    return load(timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimerSettings? timerSettings)? load,
    TResult? Function(TimerSettings timerSettings)? changed,
  }) {
    return load?.call(timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimerSettings? timerSettings)? load,
    TResult Function(TimerSettings timerSettings)? changed,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(timerSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTimerSettingsData value) load,
    required TResult Function(TimerSettingsChanged value) changed,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTimerSettingsData value)? load,
    TResult? Function(TimerSettingsChanged value)? changed,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTimerSettingsData value)? load,
    TResult Function(TimerSettingsChanged value)? changed,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadTimerSettingsData extends TimerSettingsEvent {
  const factory LoadTimerSettingsData({final TimerSettings? timerSettings}) =
      _$LoadTimerSettingsDataImpl;
  const LoadTimerSettingsData._() : super._();

  @override
  TimerSettings? get timerSettings;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadTimerSettingsDataImplCopyWith<_$LoadTimerSettingsDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerSettingsChangedImplCopyWith<$Res>
    implements $TimerSettingsEventCopyWith<$Res> {
  factory _$$TimerSettingsChangedImplCopyWith(_$TimerSettingsChangedImpl value,
          $Res Function(_$TimerSettingsChangedImpl) then) =
      __$$TimerSettingsChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimerSettings timerSettings});

  @override
  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$TimerSettingsChangedImplCopyWithImpl<$Res>
    extends _$TimerSettingsEventCopyWithImpl<$Res, _$TimerSettingsChangedImpl>
    implements _$$TimerSettingsChangedImplCopyWith<$Res> {
  __$$TimerSettingsChangedImplCopyWithImpl(_$TimerSettingsChangedImpl _value,
      $Res Function(_$TimerSettingsChangedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = null,
  }) {
    return _then(_$TimerSettingsChangedImpl(
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class _$TimerSettingsChangedImpl extends TimerSettingsChanged
    with DiagnosticableTreeMixin {
  const _$TimerSettingsChangedImpl({required this.timerSettings}) : super._();

  @override
  final TimerSettings timerSettings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsEvent.changed(timerSettings: $timerSettings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettingsEvent.changed'))
      ..add(DiagnosticsProperty('timerSettings', timerSettings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsChangedImpl &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingsChangedImplCopyWith<_$TimerSettingsChangedImpl>
      get copyWith =>
          __$$TimerSettingsChangedImplCopyWithImpl<_$TimerSettingsChangedImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(TimerSettings? timerSettings) load,
    required TResult Function(TimerSettings timerSettings) changed,
  }) {
    return changed(timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(TimerSettings? timerSettings)? load,
    TResult? Function(TimerSettings timerSettings)? changed,
  }) {
    return changed?.call(timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(TimerSettings? timerSettings)? load,
    TResult Function(TimerSettings timerSettings)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(timerSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadTimerSettingsData value) load,
    required TResult Function(TimerSettingsChanged value) changed,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadTimerSettingsData value)? load,
    TResult? Function(TimerSettingsChanged value)? changed,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadTimerSettingsData value)? load,
    TResult Function(TimerSettingsChanged value)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class TimerSettingsChanged extends TimerSettingsEvent {
  const factory TimerSettingsChanged(
          {required final TimerSettings timerSettings}) =
      _$TimerSettingsChangedImpl;
  const TimerSettingsChanged._() : super._();

  @override
  TimerSettings get timerSettings;

  /// Create a copy of TimerSettingsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerSettingsChangedImplCopyWith<_$TimerSettingsChangedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TimerSettingsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TimerSettings timerSettings) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TimerSettings timerSettings)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TimerSettings timerSettings)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerSettingsDataLoadingState value) loading,
    required TResult Function(TimerSettingsDataLoadedState value) loaded,
    required TResult Function(TimerSettingsDataErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerSettingsDataLoadingState value)? loading,
    TResult? Function(TimerSettingsDataLoadedState value)? loaded,
    TResult? Function(TimerSettingsDataErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerSettingsDataLoadingState value)? loading,
    TResult Function(TimerSettingsDataLoadedState value)? loaded,
    TResult Function(TimerSettingsDataErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingsStateCopyWith<$Res> {
  factory $TimerSettingsStateCopyWith(
          TimerSettingsState value, $Res Function(TimerSettingsState) then) =
      _$TimerSettingsStateCopyWithImpl<$Res, TimerSettingsState>;
}

/// @nodoc
class _$TimerSettingsStateCopyWithImpl<$Res, $Val extends TimerSettingsState>
    implements $TimerSettingsStateCopyWith<$Res> {
  _$TimerSettingsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$TimerSettingsDataLoadingStateImplCopyWith<$Res> {
  factory _$$TimerSettingsDataLoadingStateImplCopyWith(
          _$TimerSettingsDataLoadingStateImpl value,
          $Res Function(_$TimerSettingsDataLoadingStateImpl) then) =
      __$$TimerSettingsDataLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerSettingsDataLoadingStateImplCopyWithImpl<$Res>
    extends _$TimerSettingsStateCopyWithImpl<$Res,
        _$TimerSettingsDataLoadingStateImpl>
    implements _$$TimerSettingsDataLoadingStateImplCopyWith<$Res> {
  __$$TimerSettingsDataLoadingStateImplCopyWithImpl(
      _$TimerSettingsDataLoadingStateImpl _value,
      $Res Function(_$TimerSettingsDataLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerSettingsDataLoadingStateImpl extends TimerSettingsDataLoadingState
    with DiagnosticableTreeMixin {
  const _$TimerSettingsDataLoadingStateImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerSettingsState.loading'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsDataLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TimerSettings timerSettings) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TimerSettings timerSettings)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TimerSettings timerSettings)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerSettingsDataLoadingState value) loading,
    required TResult Function(TimerSettingsDataLoadedState value) loaded,
    required TResult Function(TimerSettingsDataErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerSettingsDataLoadingState value)? loading,
    TResult? Function(TimerSettingsDataLoadedState value)? loaded,
    TResult? Function(TimerSettingsDataErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerSettingsDataLoadingState value)? loading,
    TResult Function(TimerSettingsDataLoadedState value)? loaded,
    TResult Function(TimerSettingsDataErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TimerSettingsDataLoadingState extends TimerSettingsState {
  const factory TimerSettingsDataLoadingState() =
      _$TimerSettingsDataLoadingStateImpl;
  const TimerSettingsDataLoadingState._() : super._();
}

/// @nodoc
abstract class _$$TimerSettingsDataLoadedStateImplCopyWith<$Res> {
  factory _$$TimerSettingsDataLoadedStateImplCopyWith(
          _$TimerSettingsDataLoadedStateImpl value,
          $Res Function(_$TimerSettingsDataLoadedStateImpl) then) =
      __$$TimerSettingsDataLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$TimerSettingsDataLoadedStateImplCopyWithImpl<$Res>
    extends _$TimerSettingsStateCopyWithImpl<$Res,
        _$TimerSettingsDataLoadedStateImpl>
    implements _$$TimerSettingsDataLoadedStateImplCopyWith<$Res> {
  __$$TimerSettingsDataLoadedStateImplCopyWithImpl(
      _$TimerSettingsDataLoadedStateImpl _value,
      $Res Function(_$TimerSettingsDataLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = null,
  }) {
    return _then(_$TimerSettingsDataLoadedStateImpl(
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class _$TimerSettingsDataLoadedStateImpl extends TimerSettingsDataLoadedState
    with DiagnosticableTreeMixin {
  const _$TimerSettingsDataLoadedStateImpl({required this.timerSettings})
      : super._();

  @override
  final TimerSettings timerSettings;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsState.loaded(timerSettings: $timerSettings)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerSettingsState.loaded'))
      ..add(DiagnosticsProperty('timerSettings', timerSettings));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsDataLoadedStateImpl &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingsDataLoadedStateImplCopyWith<
          _$TimerSettingsDataLoadedStateImpl>
      get copyWith => __$$TimerSettingsDataLoadedStateImplCopyWithImpl<
          _$TimerSettingsDataLoadedStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TimerSettings timerSettings) loaded,
    required TResult Function() error,
  }) {
    return loaded(timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TimerSettings timerSettings)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TimerSettings timerSettings)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(timerSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerSettingsDataLoadingState value) loading,
    required TResult Function(TimerSettingsDataLoadedState value) loaded,
    required TResult Function(TimerSettingsDataErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerSettingsDataLoadingState value)? loading,
    TResult? Function(TimerSettingsDataLoadedState value)? loaded,
    TResult? Function(TimerSettingsDataErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerSettingsDataLoadingState value)? loading,
    TResult Function(TimerSettingsDataLoadedState value)? loaded,
    TResult Function(TimerSettingsDataErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TimerSettingsDataLoadedState extends TimerSettingsState {
  const factory TimerSettingsDataLoadedState(
          {required final TimerSettings timerSettings}) =
      _$TimerSettingsDataLoadedStateImpl;
  const TimerSettingsDataLoadedState._() : super._();

  TimerSettings get timerSettings;

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerSettingsDataLoadedStateImplCopyWith<
          _$TimerSettingsDataLoadedStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerSettingsDataErrorStateImplCopyWith<$Res> {
  factory _$$TimerSettingsDataErrorStateImplCopyWith(
          _$TimerSettingsDataErrorStateImpl value,
          $Res Function(_$TimerSettingsDataErrorStateImpl) then) =
      __$$TimerSettingsDataErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerSettingsDataErrorStateImplCopyWithImpl<$Res>
    extends _$TimerSettingsStateCopyWithImpl<$Res,
        _$TimerSettingsDataErrorStateImpl>
    implements _$$TimerSettingsDataErrorStateImplCopyWith<$Res> {
  __$$TimerSettingsDataErrorStateImplCopyWithImpl(
      _$TimerSettingsDataErrorStateImpl _value,
      $Res Function(_$TimerSettingsDataErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerSettingsDataErrorStateImpl extends TimerSettingsDataErrorState
    with DiagnosticableTreeMixin {
  const _$TimerSettingsDataErrorStateImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerSettingsState.error()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerSettingsState.error'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsDataErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(TimerSettings timerSettings) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(TimerSettings timerSettings)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(TimerSettings timerSettings)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(TimerSettingsDataLoadingState value) loading,
    required TResult Function(TimerSettingsDataLoadedState value) loaded,
    required TResult Function(TimerSettingsDataErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(TimerSettingsDataLoadingState value)? loading,
    TResult? Function(TimerSettingsDataLoadedState value)? loaded,
    TResult? Function(TimerSettingsDataErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(TimerSettingsDataLoadingState value)? loading,
    TResult Function(TimerSettingsDataLoadedState value)? loaded,
    TResult Function(TimerSettingsDataErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TimerSettingsDataErrorState extends TimerSettingsState {
  const factory TimerSettingsDataErrorState() =
      _$TimerSettingsDataErrorStateImpl;
  const TimerSettingsDataErrorState._() : super._();
}
