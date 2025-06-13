// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerEvent implements DiagnosticableTreeMixin {
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerEvent'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimerEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent()';
  }
}

/// @nodoc
class $TimerEventCopyWith<$Res> {
  $TimerEventCopyWith(TimerEvent _, $Res Function(TimerEvent) __);
}

/// @nodoc

class WarmupTicked extends TimerEvent with DiagnosticableTreeMixin {
  const WarmupTicked({required this.ticks}) : super._();

  final int ticks;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WarmupTickedCopyWith<WarmupTicked> get copyWith =>
      _$WarmupTickedCopyWithImpl<WarmupTicked>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerEvent.warmupTicked'))
      ..add(DiagnosticsProperty('ticks', ticks));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WarmupTicked &&
            (identical(other.ticks, ticks) || other.ticks == ticks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticks);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.warmupTicked(ticks: $ticks)';
  }
}

/// @nodoc
abstract mixin class $WarmupTickedCopyWith<$Res>
    implements $TimerEventCopyWith<$Res> {
  factory $WarmupTickedCopyWith(
          WarmupTicked value, $Res Function(WarmupTicked) _then) =
      _$WarmupTickedCopyWithImpl;
  @useResult
  $Res call({int ticks});
}

/// @nodoc
class _$WarmupTickedCopyWithImpl<$Res> implements $WarmupTickedCopyWith<$Res> {
  _$WarmupTickedCopyWithImpl(this._self, this._then);

  final WarmupTicked _self;
  final $Res Function(WarmupTicked) _then;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ticks = null,
  }) {
    return _then(WarmupTicked(
      ticks: null == ticks
          ? _self.ticks
          : ticks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class WarmupCompleted extends TimerEvent with DiagnosticableTreeMixin {
  const WarmupCompleted() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerEvent.warmupCompleted'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WarmupCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.warmupCompleted()';
  }
}

/// @nodoc

class TimerStarted extends TimerEvent with DiagnosticableTreeMixin {
  const TimerStarted({required this.startTime}) : super._();

  final DateTime startTime;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerStartedCopyWith<TimerStarted> get copyWith =>
      _$TimerStartedCopyWithImpl<TimerStarted>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerEvent.started'))
      ..add(DiagnosticsProperty('startTime', startTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerStarted &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, startTime);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.started(startTime: $startTime)';
  }
}

/// @nodoc
abstract mixin class $TimerStartedCopyWith<$Res>
    implements $TimerEventCopyWith<$Res> {
  factory $TimerStartedCopyWith(
          TimerStarted value, $Res Function(TimerStarted) _then) =
      _$TimerStartedCopyWithImpl;
  @useResult
  $Res call({DateTime startTime});
}

/// @nodoc
class _$TimerStartedCopyWithImpl<$Res> implements $TimerStartedCopyWith<$Res> {
  _$TimerStartedCopyWithImpl(this._self, this._then);

  final TimerStarted _self;
  final $Res Function(TimerStarted) _then;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? startTime = null,
  }) {
    return _then(TimerStarted(
      startTime: null == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class TimerPaused extends TimerEvent with DiagnosticableTreeMixin {
  const TimerPaused() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerEvent.paused'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimerPaused);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.paused()';
  }
}

/// @nodoc

class TimerResumed extends TimerEvent with DiagnosticableTreeMixin {
  const TimerResumed() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerEvent.resumed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimerResumed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.resumed()';
  }
}

/// @nodoc

class TimerCompleted extends TimerEvent with DiagnosticableTreeMixin {
  const TimerCompleted() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerEvent.completed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimerCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.completed()';
  }
}

/// @nodoc

class TimerTicked extends TimerEvent with DiagnosticableTreeMixin {
  const TimerTicked({required this.ticks}) : super._();

  final int ticks;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerTickedCopyWith<TimerTicked> get copyWith =>
      _$TimerTickedCopyWithImpl<TimerTicked>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerEvent.timerTicked'))
      ..add(DiagnosticsProperty('ticks', ticks));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerTicked &&
            (identical(other.ticks, ticks) || other.ticks == ticks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticks);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.timerTicked(ticks: $ticks)';
  }
}

/// @nodoc
abstract mixin class $TimerTickedCopyWith<$Res>
    implements $TimerEventCopyWith<$Res> {
  factory $TimerTickedCopyWith(
          TimerTicked value, $Res Function(TimerTicked) _then) =
      _$TimerTickedCopyWithImpl;
  @useResult
  $Res call({int ticks});
}

/// @nodoc
class _$TimerTickedCopyWithImpl<$Res> implements $TimerTickedCopyWith<$Res> {
  _$TimerTickedCopyWithImpl(this._self, this._then);

  final TimerTicked _self;
  final $Res Function(TimerTicked) _then;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ticks = null,
  }) {
    return _then(TimerTicked(
      ticks: null == ticks
          ? _self.ticks
          : ticks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class TimerReset extends TimerEvent with DiagnosticableTreeMixin {
  const TimerReset() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerEvent.reset'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimerReset);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.reset()';
  }
}

/// @nodoc

class TimerErrorOccurred extends TimerEvent with DiagnosticableTreeMixin {
  const TimerErrorOccurred({this.error, required this.stackTrace}) : super._();

  final Object? error;
  final StackTrace stackTrace;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerErrorOccurredCopyWith<TimerErrorOccurred> get copyWith =>
      _$TimerErrorOccurredCopyWithImpl<TimerErrorOccurred>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerEvent.error'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerErrorOccurred &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.error(error: $error, stackTrace: $stackTrace)';
  }
}

/// @nodoc
abstract mixin class $TimerErrorOccurredCopyWith<$Res>
    implements $TimerEventCopyWith<$Res> {
  factory $TimerErrorOccurredCopyWith(
          TimerErrorOccurred value, $Res Function(TimerErrorOccurred) _then) =
      _$TimerErrorOccurredCopyWithImpl;
  @useResult
  $Res call({Object? error, StackTrace stackTrace});
}

/// @nodoc
class _$TimerErrorOccurredCopyWithImpl<$Res>
    implements $TimerErrorOccurredCopyWith<$Res> {
  _$TimerErrorOccurredCopyWithImpl(this._self, this._then);

  final TimerErrorOccurred _self;
  final $Res Function(TimerErrorOccurred) _then;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = freezed,
    Object? stackTrace = null,
  }) {
    return _then(TimerErrorOccurred(
      error: freezed == error ? _self.error : error,
      stackTrace: null == stackTrace
          ? _self.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class TimerFinished extends TimerEvent with DiagnosticableTreeMixin {
  const TimerFinished() : super._();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties..add(DiagnosticsProperty('type', 'TimerEvent.finished'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is TimerFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.finished()';
  }
}

/// @nodoc
mixin _$TimerState implements DiagnosticableTreeMixin {
  TimerSettings get timerSettings;
  TimerStatus get timerStatus;
  TimerStage get timerStage;
  Duration get elapsedWarmupTime;
  Duration get elapsedTime;
  DateTime? get startTime;
  DateTime? get endTime;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TimerStateCopyWith<TimerState> get copyWith =>
      _$TimerStateCopyWithImpl<TimerState>(this as TimerState, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerState'))
      ..add(DiagnosticsProperty('timerSettings', timerSettings))
      ..add(DiagnosticsProperty('timerStatus', timerStatus))
      ..add(DiagnosticsProperty('timerStage', timerStage))
      ..add(DiagnosticsProperty('elapsedWarmupTime', elapsedWarmupTime))
      ..add(DiagnosticsProperty('elapsedTime', elapsedTime))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is TimerState &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings) &&
            (identical(other.timerStatus, timerStatus) ||
                other.timerStatus == timerStatus) &&
            (identical(other.timerStage, timerStage) ||
                other.timerStage == timerStage) &&
            (identical(other.elapsedWarmupTime, elapsedWarmupTime) ||
                other.elapsedWarmupTime == elapsedWarmupTime) &&
            (identical(other.elapsedTime, elapsedTime) ||
                other.elapsedTime == elapsedTime) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings, timerStatus,
      timerStage, elapsedWarmupTime, elapsedTime, startTime, endTime);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState(timerSettings: $timerSettings, timerStatus: $timerStatus, timerStage: $timerStage, elapsedWarmupTime: $elapsedWarmupTime, elapsedTime: $elapsedTime, startTime: $startTime, endTime: $endTime)';
  }
}

/// @nodoc
abstract mixin class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) _then) =
      _$TimerStateCopyWithImpl;
  @useResult
  $Res call(
      {TimerSettings timerSettings,
      TimerStatus timerStatus,
      TimerStage timerStage,
      Duration elapsedWarmupTime,
      Duration elapsedTime,
      DateTime? startTime,
      DateTime? endTime});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class _$TimerStateCopyWithImpl<$Res> implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._self, this._then);

  final TimerState _self;
  final $Res Function(TimerState) _then;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? timerSettings = null,
    Object? timerStatus = null,
    Object? timerStage = null,
    Object? elapsedWarmupTime = null,
    Object? elapsedTime = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_self.copyWith(
      timerSettings: null == timerSettings
          ? _self.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      timerStatus: null == timerStatus
          ? _self.timerStatus
          : timerStatus // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      timerStage: null == timerStage
          ? _self.timerStage
          : timerStage // ignore: cast_nullable_to_non_nullable
              as TimerStage,
      elapsedWarmupTime: null == elapsedWarmupTime
          ? _self.elapsedWarmupTime
          : elapsedWarmupTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      elapsedTime: null == elapsedTime
          ? _self.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of TimerState
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

class _TimerState extends TimerState with DiagnosticableTreeMixin {
  const _TimerState(
      {required this.timerSettings,
      required this.timerStatus,
      required this.timerStage,
      required this.elapsedWarmupTime,
      required this.elapsedTime,
      this.startTime,
      this.endTime})
      : super._();

  @override
  final TimerSettings timerSettings;
  @override
  final TimerStatus timerStatus;
  @override
  final TimerStage timerStage;
  @override
  final Duration elapsedWarmupTime;
  @override
  final Duration elapsedTime;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TimerStateCopyWith<_TimerState> get copyWith =>
      __$TimerStateCopyWithImpl<_TimerState>(this, _$identity);

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'TimerState'))
      ..add(DiagnosticsProperty('timerSettings', timerSettings))
      ..add(DiagnosticsProperty('timerStatus', timerStatus))
      ..add(DiagnosticsProperty('timerStage', timerStage))
      ..add(DiagnosticsProperty('elapsedWarmupTime', elapsedWarmupTime))
      ..add(DiagnosticsProperty('elapsedTime', elapsedTime))
      ..add(DiagnosticsProperty('startTime', startTime))
      ..add(DiagnosticsProperty('endTime', endTime));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TimerState &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings) &&
            (identical(other.timerStatus, timerStatus) ||
                other.timerStatus == timerStatus) &&
            (identical(other.timerStage, timerStage) ||
                other.timerStage == timerStage) &&
            (identical(other.elapsedWarmupTime, elapsedWarmupTime) ||
                other.elapsedWarmupTime == elapsedWarmupTime) &&
            (identical(other.elapsedTime, elapsedTime) ||
                other.elapsedTime == elapsedTime) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timerSettings, timerStatus,
      timerStage, elapsedWarmupTime, elapsedTime, startTime, endTime);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState(timerSettings: $timerSettings, timerStatus: $timerStatus, timerStage: $timerStage, elapsedWarmupTime: $elapsedWarmupTime, elapsedTime: $elapsedTime, startTime: $startTime, endTime: $endTime)';
  }
}

/// @nodoc
abstract mixin class _$TimerStateCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$TimerStateCopyWith(
          _TimerState value, $Res Function(_TimerState) _then) =
      __$TimerStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TimerSettings timerSettings,
      TimerStatus timerStatus,
      TimerStage timerStage,
      Duration elapsedWarmupTime,
      Duration elapsedTime,
      DateTime? startTime,
      DateTime? endTime});

  @override
  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$TimerStateCopyWithImpl<$Res> implements _$TimerStateCopyWith<$Res> {
  __$TimerStateCopyWithImpl(this._self, this._then);

  final _TimerState _self;
  final $Res Function(_TimerState) _then;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timerSettings = null,
    Object? timerStatus = null,
    Object? timerStage = null,
    Object? elapsedWarmupTime = null,
    Object? elapsedTime = null,
    Object? startTime = freezed,
    Object? endTime = freezed,
  }) {
    return _then(_TimerState(
      timerSettings: null == timerSettings
          ? _self.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      timerStatus: null == timerStatus
          ? _self.timerStatus
          : timerStatus // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      timerStage: null == timerStage
          ? _self.timerStage
          : timerStage // ignore: cast_nullable_to_non_nullable
              as TimerStage,
      elapsedWarmupTime: null == elapsedWarmupTime
          ? _self.elapsedWarmupTime
          : elapsedWarmupTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      elapsedTime: null == elapsedTime
          ? _self.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      startTime: freezed == startTime
          ? _self.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _self.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_self.timerSettings, (value) {
      return _then(_self.copyWith(timerSettings: value));
    });
  }
}

// dart format on
