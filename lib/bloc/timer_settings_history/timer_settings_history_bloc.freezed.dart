// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_history_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerSettingsHistoryEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsHistoryEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimerSettingsHistoryEvent()';
  }
}

/// @nodoc
class $TimerSettingsHistoryEventCopyWith<$Res> {
  $TimerSettingsHistoryEventCopyWith(
      TimerSettingsHistoryEvent _, $Res Function(TimerSettingsHistoryEvent) __);
}

/// @nodoc

class _Started implements TimerSettingsHistoryEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimerSettingsHistoryEvent.started()';
  }
}

/// @nodoc

class SaveTimerSettingsHistoryEvent implements TimerSettingsHistoryEvent {
  const SaveTimerSettingsHistoryEvent(
      {required this.profileId, required this.timerSettings});

  final String profileId;
  final TimerSettings timerSettings;

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SaveTimerSettingsHistoryEventCopyWith<SaveTimerSettingsHistoryEvent>
      get copyWith => _$SaveTimerSettingsHistoryEventCopyWithImpl<
          SaveTimerSettingsHistoryEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SaveTimerSettingsHistoryEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, timerSettings);

  @override
  String toString() {
    return 'TimerSettingsHistoryEvent.saveSettings(profileId: $profileId, timerSettings: $timerSettings)';
  }
}

/// @nodoc
abstract mixin class $SaveTimerSettingsHistoryEventCopyWith<$Res>
    implements $TimerSettingsHistoryEventCopyWith<$Res> {
  factory $SaveTimerSettingsHistoryEventCopyWith(
          SaveTimerSettingsHistoryEvent value,
          $Res Function(SaveTimerSettingsHistoryEvent) _then) =
      _$SaveTimerSettingsHistoryEventCopyWithImpl;
  @useResult
  $Res call({String profileId, TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class _$SaveTimerSettingsHistoryEventCopyWithImpl<$Res>
    implements $SaveTimerSettingsHistoryEventCopyWith<$Res> {
  _$SaveTimerSettingsHistoryEventCopyWithImpl(this._self, this._then);

  final SaveTimerSettingsHistoryEvent _self;
  final $Res Function(SaveTimerSettingsHistoryEvent) _then;

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
    Object? timerSettings = null,
  }) {
    return _then(SaveTimerSettingsHistoryEvent(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      timerSettings: null == timerSettings
          ? _self.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  /// Create a copy of TimerSettingsHistoryEvent
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

class LoadTimerSettingsHistoryEvent implements TimerSettingsHistoryEvent {
  const LoadTimerSettingsHistoryEvent({required this.profileId});

  final String profileId;

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadTimerSettingsHistoryEventCopyWith<LoadTimerSettingsHistoryEvent>
      get copyWith => _$LoadTimerSettingsHistoryEventCopyWithImpl<
          LoadTimerSettingsHistoryEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadTimerSettingsHistoryEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId);

  @override
  String toString() {
    return 'TimerSettingsHistoryEvent.loadSettingsList(profileId: $profileId)';
  }
}

/// @nodoc
abstract mixin class $LoadTimerSettingsHistoryEventCopyWith<$Res>
    implements $TimerSettingsHistoryEventCopyWith<$Res> {
  factory $LoadTimerSettingsHistoryEventCopyWith(
          LoadTimerSettingsHistoryEvent value,
          $Res Function(LoadTimerSettingsHistoryEvent) _then) =
      _$LoadTimerSettingsHistoryEventCopyWithImpl;
  @useResult
  $Res call({String profileId});
}

/// @nodoc
class _$LoadTimerSettingsHistoryEventCopyWithImpl<$Res>
    implements $LoadTimerSettingsHistoryEventCopyWith<$Res> {
  _$LoadTimerSettingsHistoryEventCopyWithImpl(this._self, this._then);

  final LoadTimerSettingsHistoryEvent _self;
  final $Res Function(LoadTimerSettingsHistoryEvent) _then;

  /// Create a copy of TimerSettingsHistoryEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
  }) {
    return _then(LoadTimerSettingsHistoryEvent(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$TimerSettingsHistoryState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsHistoryState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimerSettingsHistoryState()';
  }
}

/// @nodoc
class $TimerSettingsHistoryStateCopyWith<$Res> {
  $TimerSettingsHistoryStateCopyWith(
      TimerSettingsHistoryState _, $Res Function(TimerSettingsHistoryState) __);
}

/// @nodoc

class _Initial implements TimerSettingsHistoryState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimerSettingsHistoryState.initial()';
  }
}

/// @nodoc

class TimerSettingsHistoryLoading implements TimerSettingsHistoryState {
  const TimerSettingsHistoryLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsHistoryLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimerSettingsHistoryState.loading()';
  }
}

/// @nodoc

class TimerSettingsHistoryLoaded implements TimerSettingsHistoryState {
  const TimerSettingsHistoryLoaded(
      {required final List<TimerSettingsHistoryRecord> timerSettingsList})
      : _timerSettingsList = timerSettingsList;

  final List<TimerSettingsHistoryRecord> _timerSettingsList;
  List<TimerSettingsHistoryRecord> get timerSettingsList {
    if (_timerSettingsList is EqualUnmodifiableListView)
      return _timerSettingsList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timerSettingsList);
  }

  /// Create a copy of TimerSettingsHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerSettingsHistoryLoadedCopyWith<TimerSettingsHistoryLoaded>
      get copyWith =>
          _$TimerSettingsHistoryLoadedCopyWithImpl<TimerSettingsHistoryLoaded>(
              this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsHistoryLoaded &&
            const DeepCollectionEquality()
                .equals(other._timerSettingsList, _timerSettingsList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_timerSettingsList));

  @override
  String toString() {
    return 'TimerSettingsHistoryState.loaded(timerSettingsList: $timerSettingsList)';
  }
}

/// @nodoc
abstract mixin class $TimerSettingsHistoryLoadedCopyWith<$Res>
    implements $TimerSettingsHistoryStateCopyWith<$Res> {
  factory $TimerSettingsHistoryLoadedCopyWith(TimerSettingsHistoryLoaded value,
          $Res Function(TimerSettingsHistoryLoaded) _then) =
      _$TimerSettingsHistoryLoadedCopyWithImpl;
  @useResult
  $Res call({List<TimerSettingsHistoryRecord> timerSettingsList});
}

/// @nodoc
class _$TimerSettingsHistoryLoadedCopyWithImpl<$Res>
    implements $TimerSettingsHistoryLoadedCopyWith<$Res> {
  _$TimerSettingsHistoryLoadedCopyWithImpl(this._self, this._then);

  final TimerSettingsHistoryLoaded _self;
  final $Res Function(TimerSettingsHistoryLoaded) _then;

  /// Create a copy of TimerSettingsHistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timerSettingsList = null,
  }) {
    return _then(TimerSettingsHistoryLoaded(
      timerSettingsList: null == timerSettingsList
          ? _self._timerSettingsList
          : timerSettingsList // ignore: cast_nullable_to_non_nullable
              as List<TimerSettingsHistoryRecord>,
    ));
  }
}

/// @nodoc

class TimerSettingsHistoryError implements TimerSettingsHistoryState {
  const TimerSettingsHistoryError();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerSettingsHistoryError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'TimerSettingsHistoryState.error()';
  }
}

// dart format on
