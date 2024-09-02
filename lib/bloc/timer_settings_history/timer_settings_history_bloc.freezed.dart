// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimerSettingsHistoryEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TimerSettings timerSettings) saveSettings,
    required TResult Function(String profileId) loadSettingsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TimerSettings timerSettings)? saveSettings,
    TResult? Function(String profileId)? loadSettingsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TimerSettings timerSettings)? saveSettings,
    TResult Function(String profileId)? loadSettingsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SaveTimerSettingsHistoryEvent value) saveSettings,
    required TResult Function(LoadTimerSettingsHistoryEvent value)
        loadSettingsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SaveTimerSettingsHistoryEvent value)? saveSettings,
    TResult? Function(LoadTimerSettingsHistoryEvent value)? loadSettingsList,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SaveTimerSettingsHistoryEvent value)? saveSettings,
    TResult Function(LoadTimerSettingsHistoryEvent value)? loadSettingsList,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingsHistoryEventCopyWith<$Res> {
  factory $TimerSettingsHistoryEventCopyWith(TimerSettingsHistoryEvent value,
          $Res Function(TimerSettingsHistoryEvent) then) =
      _$TimerSettingsHistoryEventCopyWithImpl<$Res, TimerSettingsHistoryEvent>;
}

/// @nodoc
class _$TimerSettingsHistoryEventCopyWithImpl<$Res,
        $Val extends TimerSettingsHistoryEvent>
    implements $TimerSettingsHistoryEventCopyWith<$Res> {
  _$TimerSettingsHistoryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TimerSettingsHistoryEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TimerSettingsHistoryEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TimerSettings timerSettings) saveSettings,
    required TResult Function(String profileId) loadSettingsList,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TimerSettings timerSettings)? saveSettings,
    TResult? Function(String profileId)? loadSettingsList,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TimerSettings timerSettings)? saveSettings,
    TResult Function(String profileId)? loadSettingsList,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SaveTimerSettingsHistoryEvent value) saveSettings,
    required TResult Function(LoadTimerSettingsHistoryEvent value)
        loadSettingsList,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SaveTimerSettingsHistoryEvent value)? saveSettings,
    TResult? Function(LoadTimerSettingsHistoryEvent value)? loadSettingsList,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SaveTimerSettingsHistoryEvent value)? saveSettings,
    TResult Function(LoadTimerSettingsHistoryEvent value)? loadSettingsList,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TimerSettingsHistoryEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SaveTimerSettingsHistoryEventImplCopyWith<$Res> {
  factory _$$SaveTimerSettingsHistoryEventImplCopyWith(
          _$SaveTimerSettingsHistoryEventImpl value,
          $Res Function(_$SaveTimerSettingsHistoryEventImpl) then) =
      __$$SaveTimerSettingsHistoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$SaveTimerSettingsHistoryEventImplCopyWithImpl<$Res>
    extends _$TimerSettingsHistoryEventCopyWithImpl<$Res,
        _$SaveTimerSettingsHistoryEventImpl>
    implements _$$SaveTimerSettingsHistoryEventImplCopyWith<$Res> {
  __$$SaveTimerSettingsHistoryEventImplCopyWithImpl(
      _$SaveTimerSettingsHistoryEventImpl _value,
      $Res Function(_$SaveTimerSettingsHistoryEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = null,
  }) {
    return _then(_$SaveTimerSettingsHistoryEventImpl(
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  /// Create a copy of TimerSettingsHistoryEvent
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

class _$SaveTimerSettingsHistoryEventImpl
    implements SaveTimerSettingsHistoryEvent {
  const _$SaveTimerSettingsHistoryEventImpl({required this.timerSettings});

  @override
  final TimerSettings timerSettings;

  @override
  String toString() {
    return 'TimerSettingsHistoryEvent.saveSettings(timerSettings: $timerSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SaveTimerSettingsHistoryEventImpl &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings);

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SaveTimerSettingsHistoryEventImplCopyWith<
          _$SaveTimerSettingsHistoryEventImpl>
      get copyWith => __$$SaveTimerSettingsHistoryEventImplCopyWithImpl<
          _$SaveTimerSettingsHistoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TimerSettings timerSettings) saveSettings,
    required TResult Function(String profileId) loadSettingsList,
  }) {
    return saveSettings(timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TimerSettings timerSettings)? saveSettings,
    TResult? Function(String profileId)? loadSettingsList,
  }) {
    return saveSettings?.call(timerSettings);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TimerSettings timerSettings)? saveSettings,
    TResult Function(String profileId)? loadSettingsList,
    required TResult orElse(),
  }) {
    if (saveSettings != null) {
      return saveSettings(timerSettings);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SaveTimerSettingsHistoryEvent value) saveSettings,
    required TResult Function(LoadTimerSettingsHistoryEvent value)
        loadSettingsList,
  }) {
    return saveSettings(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SaveTimerSettingsHistoryEvent value)? saveSettings,
    TResult? Function(LoadTimerSettingsHistoryEvent value)? loadSettingsList,
  }) {
    return saveSettings?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SaveTimerSettingsHistoryEvent value)? saveSettings,
    TResult Function(LoadTimerSettingsHistoryEvent value)? loadSettingsList,
    required TResult orElse(),
  }) {
    if (saveSettings != null) {
      return saveSettings(this);
    }
    return orElse();
  }
}

abstract class SaveTimerSettingsHistoryEvent
    implements TimerSettingsHistoryEvent {
  const factory SaveTimerSettingsHistoryEvent(
          {required final TimerSettings timerSettings}) =
      _$SaveTimerSettingsHistoryEventImpl;

  TimerSettings get timerSettings;

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SaveTimerSettingsHistoryEventImplCopyWith<
          _$SaveTimerSettingsHistoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadTimerSettingsHistoryEventImplCopyWith<$Res> {
  factory _$$LoadTimerSettingsHistoryEventImplCopyWith(
          _$LoadTimerSettingsHistoryEventImpl value,
          $Res Function(_$LoadTimerSettingsHistoryEventImpl) then) =
      __$$LoadTimerSettingsHistoryEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileId});
}

/// @nodoc
class __$$LoadTimerSettingsHistoryEventImplCopyWithImpl<$Res>
    extends _$TimerSettingsHistoryEventCopyWithImpl<$Res,
        _$LoadTimerSettingsHistoryEventImpl>
    implements _$$LoadTimerSettingsHistoryEventImplCopyWith<$Res> {
  __$$LoadTimerSettingsHistoryEventImplCopyWithImpl(
      _$LoadTimerSettingsHistoryEventImpl _value,
      $Res Function(_$LoadTimerSettingsHistoryEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
  }) {
    return _then(_$LoadTimerSettingsHistoryEventImpl(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadTimerSettingsHistoryEventImpl
    implements LoadTimerSettingsHistoryEvent {
  const _$LoadTimerSettingsHistoryEventImpl({required this.profileId});

  @override
  final String profileId;

  @override
  String toString() {
    return 'TimerSettingsHistoryEvent.loadSettingsList(profileId: $profileId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadTimerSettingsHistoryEventImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId);

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadTimerSettingsHistoryEventImplCopyWith<
          _$LoadTimerSettingsHistoryEventImpl>
      get copyWith => __$$LoadTimerSettingsHistoryEventImplCopyWithImpl<
          _$LoadTimerSettingsHistoryEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TimerSettings timerSettings) saveSettings,
    required TResult Function(String profileId) loadSettingsList,
  }) {
    return loadSettingsList(profileId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TimerSettings timerSettings)? saveSettings,
    TResult? Function(String profileId)? loadSettingsList,
  }) {
    return loadSettingsList?.call(profileId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TimerSettings timerSettings)? saveSettings,
    TResult Function(String profileId)? loadSettingsList,
    required TResult orElse(),
  }) {
    if (loadSettingsList != null) {
      return loadSettingsList(profileId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SaveTimerSettingsHistoryEvent value) saveSettings,
    required TResult Function(LoadTimerSettingsHistoryEvent value)
        loadSettingsList,
  }) {
    return loadSettingsList(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SaveTimerSettingsHistoryEvent value)? saveSettings,
    TResult? Function(LoadTimerSettingsHistoryEvent value)? loadSettingsList,
  }) {
    return loadSettingsList?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SaveTimerSettingsHistoryEvent value)? saveSettings,
    TResult Function(LoadTimerSettingsHistoryEvent value)? loadSettingsList,
    required TResult orElse(),
  }) {
    if (loadSettingsList != null) {
      return loadSettingsList(this);
    }
    return orElse();
  }
}

abstract class LoadTimerSettingsHistoryEvent
    implements TimerSettingsHistoryEvent {
  const factory LoadTimerSettingsHistoryEvent(
      {required final String profileId}) = _$LoadTimerSettingsHistoryEventImpl;

  String get profileId;

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadTimerSettingsHistoryEventImplCopyWith<
          _$LoadTimerSettingsHistoryEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TimerSettingsHistoryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimerSettings> timerSettingsList) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimerSettings> timerSettingsList)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimerSettings> timerSettingsList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TimerSettingsHistoryLoading value) loading,
    required TResult Function(TimerSettingsHistoryLoaded value) loaded,
    required TResult Function(TimerSettingsHistoryError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TimerSettingsHistoryLoading value)? loading,
    TResult? Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult? Function(TimerSettingsHistoryError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TimerSettingsHistoryLoading value)? loading,
    TResult Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult Function(TimerSettingsHistoryError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerSettingsHistoryStateCopyWith<$Res> {
  factory $TimerSettingsHistoryStateCopyWith(TimerSettingsHistoryState value,
          $Res Function(TimerSettingsHistoryState) then) =
      _$TimerSettingsHistoryStateCopyWithImpl<$Res, TimerSettingsHistoryState>;
}

/// @nodoc
class _$TimerSettingsHistoryStateCopyWithImpl<$Res,
        $Val extends TimerSettingsHistoryState>
    implements $TimerSettingsHistoryStateCopyWith<$Res> {
  _$TimerSettingsHistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerSettingsHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TimerSettingsHistoryStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TimerSettingsHistoryState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimerSettings> timerSettingsList) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimerSettings> timerSettingsList)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimerSettings> timerSettingsList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TimerSettingsHistoryLoading value) loading,
    required TResult Function(TimerSettingsHistoryLoaded value) loaded,
    required TResult Function(TimerSettingsHistoryError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TimerSettingsHistoryLoading value)? loading,
    TResult? Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult? Function(TimerSettingsHistoryError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TimerSettingsHistoryLoading value)? loading,
    TResult Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult Function(TimerSettingsHistoryError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TimerSettingsHistoryState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$TimerSettingsHistoryLoadingImplCopyWith<$Res> {
  factory _$$TimerSettingsHistoryLoadingImplCopyWith(
          _$TimerSettingsHistoryLoadingImpl value,
          $Res Function(_$TimerSettingsHistoryLoadingImpl) then) =
      __$$TimerSettingsHistoryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerSettingsHistoryLoadingImplCopyWithImpl<$Res>
    extends _$TimerSettingsHistoryStateCopyWithImpl<$Res,
        _$TimerSettingsHistoryLoadingImpl>
    implements _$$TimerSettingsHistoryLoadingImplCopyWith<$Res> {
  __$$TimerSettingsHistoryLoadingImplCopyWithImpl(
      _$TimerSettingsHistoryLoadingImpl _value,
      $Res Function(_$TimerSettingsHistoryLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerSettingsHistoryLoadingImpl implements TimerSettingsHistoryLoading {
  const _$TimerSettingsHistoryLoadingImpl();

  @override
  String toString() {
    return 'TimerSettingsHistoryState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsHistoryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimerSettings> timerSettingsList) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimerSettings> timerSettingsList)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimerSettings> timerSettingsList)? loaded,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(TimerSettingsHistoryLoading value) loading,
    required TResult Function(TimerSettingsHistoryLoaded value) loaded,
    required TResult Function(TimerSettingsHistoryError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TimerSettingsHistoryLoading value)? loading,
    TResult? Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult? Function(TimerSettingsHistoryError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TimerSettingsHistoryLoading value)? loading,
    TResult Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult Function(TimerSettingsHistoryError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TimerSettingsHistoryLoading
    implements TimerSettingsHistoryState {
  const factory TimerSettingsHistoryLoading() =
      _$TimerSettingsHistoryLoadingImpl;
}

/// @nodoc
abstract class _$$TimerSettingsHistoryLoadedImplCopyWith<$Res> {
  factory _$$TimerSettingsHistoryLoadedImplCopyWith(
          _$TimerSettingsHistoryLoadedImpl value,
          $Res Function(_$TimerSettingsHistoryLoadedImpl) then) =
      __$$TimerSettingsHistoryLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TimerSettings> timerSettingsList});
}

/// @nodoc
class __$$TimerSettingsHistoryLoadedImplCopyWithImpl<$Res>
    extends _$TimerSettingsHistoryStateCopyWithImpl<$Res,
        _$TimerSettingsHistoryLoadedImpl>
    implements _$$TimerSettingsHistoryLoadedImplCopyWith<$Res> {
  __$$TimerSettingsHistoryLoadedImplCopyWithImpl(
      _$TimerSettingsHistoryLoadedImpl _value,
      $Res Function(_$TimerSettingsHistoryLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettingsList = null,
  }) {
    return _then(_$TimerSettingsHistoryLoadedImpl(
      timerSettingsList: null == timerSettingsList
          ? _value._timerSettingsList
          : timerSettingsList // ignore: cast_nullable_to_non_nullable
              as List<TimerSettings>,
    ));
  }
}

/// @nodoc

class _$TimerSettingsHistoryLoadedImpl implements TimerSettingsHistoryLoaded {
  const _$TimerSettingsHistoryLoadedImpl(
      {required final List<TimerSettings> timerSettingsList})
      : _timerSettingsList = timerSettingsList;

  final List<TimerSettings> _timerSettingsList;
  @override
  List<TimerSettings> get timerSettingsList {
    if (_timerSettingsList is EqualUnmodifiableListView)
      return _timerSettingsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timerSettingsList);
  }

  @override
  String toString() {
    return 'TimerSettingsHistoryState.loaded(timerSettingsList: $timerSettingsList)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsHistoryLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._timerSettingsList, _timerSettingsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_timerSettingsList));

  /// Create a copy of TimerSettingsHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerSettingsHistoryLoadedImplCopyWith<_$TimerSettingsHistoryLoadedImpl>
      get copyWith => __$$TimerSettingsHistoryLoadedImplCopyWithImpl<
          _$TimerSettingsHistoryLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimerSettings> timerSettingsList) loaded,
    required TResult Function() error,
  }) {
    return loaded(timerSettingsList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimerSettings> timerSettingsList)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(timerSettingsList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimerSettings> timerSettingsList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(timerSettingsList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TimerSettingsHistoryLoading value) loading,
    required TResult Function(TimerSettingsHistoryLoaded value) loaded,
    required TResult Function(TimerSettingsHistoryError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TimerSettingsHistoryLoading value)? loading,
    TResult? Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult? Function(TimerSettingsHistoryError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TimerSettingsHistoryLoading value)? loading,
    TResult Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult Function(TimerSettingsHistoryError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class TimerSettingsHistoryLoaded implements TimerSettingsHistoryState {
  const factory TimerSettingsHistoryLoaded(
          {required final List<TimerSettings> timerSettingsList}) =
      _$TimerSettingsHistoryLoadedImpl;

  List<TimerSettings> get timerSettingsList;

  /// Create a copy of TimerSettingsHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerSettingsHistoryLoadedImplCopyWith<_$TimerSettingsHistoryLoadedImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerSettingsHistoryErrorImplCopyWith<$Res> {
  factory _$$TimerSettingsHistoryErrorImplCopyWith(
          _$TimerSettingsHistoryErrorImpl value,
          $Res Function(_$TimerSettingsHistoryErrorImpl) then) =
      __$$TimerSettingsHistoryErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerSettingsHistoryErrorImplCopyWithImpl<$Res>
    extends _$TimerSettingsHistoryStateCopyWithImpl<$Res,
        _$TimerSettingsHistoryErrorImpl>
    implements _$$TimerSettingsHistoryErrorImplCopyWith<$Res> {
  __$$TimerSettingsHistoryErrorImplCopyWithImpl(
      _$TimerSettingsHistoryErrorImpl _value,
      $Res Function(_$TimerSettingsHistoryErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerSettingsHistoryState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerSettingsHistoryErrorImpl implements TimerSettingsHistoryError {
  const _$TimerSettingsHistoryErrorImpl();

  @override
  String toString() {
    return 'TimerSettingsHistoryState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerSettingsHistoryErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<TimerSettings> timerSettingsList) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<TimerSettings> timerSettingsList)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<TimerSettings> timerSettingsList)? loaded,
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
    required TResult Function(_Initial value) initial,
    required TResult Function(TimerSettingsHistoryLoading value) loading,
    required TResult Function(TimerSettingsHistoryLoaded value) loaded,
    required TResult Function(TimerSettingsHistoryError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TimerSettingsHistoryLoading value)? loading,
    TResult? Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult? Function(TimerSettingsHistoryError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TimerSettingsHistoryLoading value)? loading,
    TResult Function(TimerSettingsHistoryLoaded value)? loaded,
    TResult Function(TimerSettingsHistoryError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TimerSettingsHistoryError implements TimerSettingsHistoryState {
  const factory TimerSettingsHistoryError() = _$TimerSettingsHistoryErrorImpl;
}
