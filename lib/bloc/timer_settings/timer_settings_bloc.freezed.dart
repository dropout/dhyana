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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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

  @JsonKey(ignore: true)
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
abstract class _$$LoadTimerSettingsDataCopyWith<$Res>
    implements $TimerSettingsEventCopyWith<$Res> {
  factory _$$LoadTimerSettingsDataCopyWith(_$LoadTimerSettingsData value,
          $Res Function(_$LoadTimerSettingsData) then) =
      __$$LoadTimerSettingsDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimerSettings? timerSettings});

  @override
  $TimerSettingsCopyWith<$Res>? get timerSettings;
}

/// @nodoc
class __$$LoadTimerSettingsDataCopyWithImpl<$Res>
    extends _$TimerSettingsEventCopyWithImpl<$Res, _$LoadTimerSettingsData>
    implements _$$LoadTimerSettingsDataCopyWith<$Res> {
  __$$LoadTimerSettingsDataCopyWithImpl(_$LoadTimerSettingsData _value,
      $Res Function(_$LoadTimerSettingsData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = freezed,
  }) {
    return _then(_$LoadTimerSettingsData(
      timerSettings: freezed == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings?,
    ));
  }
}

/// @nodoc

class _$LoadTimerSettingsData extends LoadTimerSettingsData
    with DiagnosticableTreeMixin {
  const _$LoadTimerSettingsData({this.timerSettings}) : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTimerSettingsData &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTimerSettingsDataCopyWith<_$LoadTimerSettingsData> get copyWith =>
      __$$LoadTimerSettingsDataCopyWithImpl<_$LoadTimerSettingsData>(
          this, _$identity);

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
      _$LoadTimerSettingsData;
  const LoadTimerSettingsData._() : super._();

  @override
  TimerSettings? get timerSettings;
  @override
  @JsonKey(ignore: true)
  _$$LoadTimerSettingsDataCopyWith<_$LoadTimerSettingsData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerSettingsChangedCopyWith<$Res>
    implements $TimerSettingsEventCopyWith<$Res> {
  factory _$$TimerSettingsChangedCopyWith(_$TimerSettingsChanged value,
          $Res Function(_$TimerSettingsChanged) then) =
      __$$TimerSettingsChangedCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({TimerSettings timerSettings});

  @override
  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$TimerSettingsChangedCopyWithImpl<$Res>
    extends _$TimerSettingsEventCopyWithImpl<$Res, _$TimerSettingsChanged>
    implements _$$TimerSettingsChangedCopyWith<$Res> {
  __$$TimerSettingsChangedCopyWithImpl(_$TimerSettingsChanged _value,
      $Res Function(_$TimerSettingsChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = null,
  }) {
    return _then(_$TimerSettingsChanged(
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class _$TimerSettingsChanged extends TimerSettingsChanged
    with DiagnosticableTreeMixin {
  const _$TimerSettingsChanged({required this.timerSettings}) : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsChanged &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingsChangedCopyWith<_$TimerSettingsChanged> get copyWith =>
      __$$TimerSettingsChangedCopyWithImpl<_$TimerSettingsChanged>(
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
      {required final TimerSettings timerSettings}) = _$TimerSettingsChanged;
  const TimerSettingsChanged._() : super._();

  @override
  TimerSettings get timerSettings;
  @override
  @JsonKey(ignore: true)
  _$$TimerSettingsChangedCopyWith<_$TimerSettingsChanged> get copyWith =>
      throw _privateConstructorUsedError;
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
}

/// @nodoc
abstract class _$$TimerSettingsDataLoadingStateCopyWith<$Res> {
  factory _$$TimerSettingsDataLoadingStateCopyWith(
          _$TimerSettingsDataLoadingState value,
          $Res Function(_$TimerSettingsDataLoadingState) then) =
      __$$TimerSettingsDataLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerSettingsDataLoadingStateCopyWithImpl<$Res>
    extends _$TimerSettingsStateCopyWithImpl<$Res,
        _$TimerSettingsDataLoadingState>
    implements _$$TimerSettingsDataLoadingStateCopyWith<$Res> {
  __$$TimerSettingsDataLoadingStateCopyWithImpl(
      _$TimerSettingsDataLoadingState _value,
      $Res Function(_$TimerSettingsDataLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerSettingsDataLoadingState extends TimerSettingsDataLoadingState
    with DiagnosticableTreeMixin {
  const _$TimerSettingsDataLoadingState() : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsDataLoadingState);
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
      _$TimerSettingsDataLoadingState;
  const TimerSettingsDataLoadingState._() : super._();
}

/// @nodoc
abstract class _$$TimerSettingsDataLoadedStateCopyWith<$Res> {
  factory _$$TimerSettingsDataLoadedStateCopyWith(
          _$TimerSettingsDataLoadedState value,
          $Res Function(_$TimerSettingsDataLoadedState) then) =
      __$$TimerSettingsDataLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$TimerSettingsDataLoadedStateCopyWithImpl<$Res>
    extends _$TimerSettingsStateCopyWithImpl<$Res,
        _$TimerSettingsDataLoadedState>
    implements _$$TimerSettingsDataLoadedStateCopyWith<$Res> {
  __$$TimerSettingsDataLoadedStateCopyWithImpl(
      _$TimerSettingsDataLoadedState _value,
      $Res Function(_$TimerSettingsDataLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = null,
  }) {
    return _then(_$TimerSettingsDataLoadedState(
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class _$TimerSettingsDataLoadedState extends TimerSettingsDataLoadedState
    with DiagnosticableTreeMixin {
  const _$TimerSettingsDataLoadedState({required this.timerSettings})
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsDataLoadedState &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingsDataLoadedStateCopyWith<_$TimerSettingsDataLoadedState>
      get copyWith => __$$TimerSettingsDataLoadedStateCopyWithImpl<
          _$TimerSettingsDataLoadedState>(this, _$identity);

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
      _$TimerSettingsDataLoadedState;
  const TimerSettingsDataLoadedState._() : super._();

  TimerSettings get timerSettings;
  @JsonKey(ignore: true)
  _$$TimerSettingsDataLoadedStateCopyWith<_$TimerSettingsDataLoadedState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerSettingsDataErrorStateCopyWith<$Res> {
  factory _$$TimerSettingsDataErrorStateCopyWith(
          _$TimerSettingsDataErrorState value,
          $Res Function(_$TimerSettingsDataErrorState) then) =
      __$$TimerSettingsDataErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerSettingsDataErrorStateCopyWithImpl<$Res>
    extends _$TimerSettingsStateCopyWithImpl<$Res,
        _$TimerSettingsDataErrorState>
    implements _$$TimerSettingsDataErrorStateCopyWith<$Res> {
  __$$TimerSettingsDataErrorStateCopyWithImpl(
      _$TimerSettingsDataErrorState _value,
      $Res Function(_$TimerSettingsDataErrorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerSettingsDataErrorState extends TimerSettingsDataErrorState
    with DiagnosticableTreeMixin {
  const _$TimerSettingsDataErrorState() : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsDataErrorState);
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
  const factory TimerSettingsDataErrorState() = _$TimerSettingsDataErrorState;
  const TimerSettingsDataErrorState._() : super._();
}
