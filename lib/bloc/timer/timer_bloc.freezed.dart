// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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

/// Adds pattern-matching-related methods to [TimerEvent].
extension TimerEventPatterns on TimerEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WarmupTicked value)? warmupTicked,
    TResult Function(WarmupCompleted value)? warmupCompleted,
    TResult Function(TimerStarted value)? started,
    TResult Function(TimerPaused value)? paused,
    TResult Function(TimerResumed value)? resumed,
    TResult Function(TimerCompleted value)? completed,
    TResult Function(TimerTicked value)? timerTicked,
    TResult Function(TimerReset value)? reset,
    TResult Function(TimerErrorOccurred value)? error,
    TResult Function(TimerFinished value)? finished,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case WarmupTicked() when warmupTicked != null:
        return warmupTicked(_that);
      case WarmupCompleted() when warmupCompleted != null:
        return warmupCompleted(_that);
      case TimerStarted() when started != null:
        return started(_that);
      case TimerPaused() when paused != null:
        return paused(_that);
      case TimerResumed() when resumed != null:
        return resumed(_that);
      case TimerCompleted() when completed != null:
        return completed(_that);
      case TimerTicked() when timerTicked != null:
        return timerTicked(_that);
      case TimerReset() when reset != null:
        return reset(_that);
      case TimerErrorOccurred() when error != null:
        return error(_that);
      case TimerFinished() when finished != null:
        return finished(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(WarmupTicked value) warmupTicked,
    required TResult Function(WarmupCompleted value) warmupCompleted,
    required TResult Function(TimerStarted value) started,
    required TResult Function(TimerPaused value) paused,
    required TResult Function(TimerResumed value) resumed,
    required TResult Function(TimerCompleted value) completed,
    required TResult Function(TimerTicked value) timerTicked,
    required TResult Function(TimerReset value) reset,
    required TResult Function(TimerErrorOccurred value) error,
    required TResult Function(TimerFinished value) finished,
  }) {
    final _that = this;
    switch (_that) {
      case WarmupTicked():
        return warmupTicked(_that);
      case WarmupCompleted():
        return warmupCompleted(_that);
      case TimerStarted():
        return started(_that);
      case TimerPaused():
        return paused(_that);
      case TimerResumed():
        return resumed(_that);
      case TimerCompleted():
        return completed(_that);
      case TimerTicked():
        return timerTicked(_that);
      case TimerReset():
        return reset(_that);
      case TimerErrorOccurred():
        return error(_that);
      case TimerFinished():
        return finished(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WarmupTicked value)? warmupTicked,
    TResult? Function(WarmupCompleted value)? warmupCompleted,
    TResult? Function(TimerStarted value)? started,
    TResult? Function(TimerPaused value)? paused,
    TResult? Function(TimerResumed value)? resumed,
    TResult? Function(TimerCompleted value)? completed,
    TResult? Function(TimerTicked value)? timerTicked,
    TResult? Function(TimerReset value)? reset,
    TResult? Function(TimerErrorOccurred value)? error,
    TResult? Function(TimerFinished value)? finished,
  }) {
    final _that = this;
    switch (_that) {
      case WarmupTicked() when warmupTicked != null:
        return warmupTicked(_that);
      case WarmupCompleted() when warmupCompleted != null:
        return warmupCompleted(_that);
      case TimerStarted() when started != null:
        return started(_that);
      case TimerPaused() when paused != null:
        return paused(_that);
      case TimerResumed() when resumed != null:
        return resumed(_that);
      case TimerCompleted() when completed != null:
        return completed(_that);
      case TimerTicked() when timerTicked != null:
        return timerTicked(_that);
      case TimerReset() when reset != null:
        return reset(_that);
      case TimerErrorOccurred() when error != null:
        return error(_that);
      case TimerFinished() when finished != null:
        return finished(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function(DateTime startTime)? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case WarmupTicked() when warmupTicked != null:
        return warmupTicked(_that.ticks);
      case WarmupCompleted() when warmupCompleted != null:
        return warmupCompleted();
      case TimerStarted() when started != null:
        return started(_that.startTime);
      case TimerPaused() when paused != null:
        return paused();
      case TimerResumed() when resumed != null:
        return resumed();
      case TimerCompleted() when completed != null:
        return completed();
      case TimerTicked() when timerTicked != null:
        return timerTicked(_that.ticks);
      case TimerReset() when reset != null:
        return reset();
      case TimerErrorOccurred() when error != null:
        return error(_that.error, _that.stackTrace);
      case TimerFinished() when finished != null:
        return finished();
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
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function(DateTime startTime) started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    final _that = this;
    switch (_that) {
      case WarmupTicked():
        return warmupTicked(_that.ticks);
      case WarmupCompleted():
        return warmupCompleted();
      case TimerStarted():
        return started(_that.startTime);
      case TimerPaused():
        return paused();
      case TimerResumed():
        return resumed();
      case TimerCompleted():
        return completed();
      case TimerTicked():
        return timerTicked(_that.ticks);
      case TimerReset():
        return reset();
      case TimerErrorOccurred():
        return error(_that.error, _that.stackTrace);
      case TimerFinished():
        return finished();
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function(DateTime startTime)? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    final _that = this;
    switch (_that) {
      case WarmupTicked() when warmupTicked != null:
        return warmupTicked(_that.ticks);
      case WarmupCompleted() when warmupCompleted != null:
        return warmupCompleted();
      case TimerStarted() when started != null:
        return started(_that.startTime);
      case TimerPaused() when paused != null:
        return paused();
      case TimerResumed() when resumed != null:
        return resumed();
      case TimerCompleted() when completed != null:
        return completed();
      case TimerTicked() when timerTicked != null:
        return timerTicked(_that.ticks);
      case TimerReset() when reset != null:
        return reset();
      case TimerErrorOccurred() when error != null:
        return error(_that.error, _that.stackTrace);
      case TimerFinished() when finished != null:
        return finished();
      case _:
        return null;
    }
  }
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

/// Adds pattern-matching-related methods to [TimerState].
extension TimerStatePatterns on TimerState {
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
    TResult Function(_TimerState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TimerState() when $default != null:
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
    TResult Function(_TimerState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimerState():
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
    TResult? Function(_TimerState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimerState() when $default != null:
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
            TimerSettings timerSettings,
            TimerStatus timerStatus,
            TimerStage timerStage,
            Duration elapsedWarmupTime,
            Duration elapsedTime,
            DateTime? startTime,
            DateTime? endTime)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _TimerState() when $default != null:
        return $default(
            _that.timerSettings,
            _that.timerStatus,
            _that.timerStage,
            _that.elapsedWarmupTime,
            _that.elapsedTime,
            _that.startTime,
            _that.endTime);
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
            TimerSettings timerSettings,
            TimerStatus timerStatus,
            TimerStage timerStage,
            Duration elapsedWarmupTime,
            Duration elapsedTime,
            DateTime? startTime,
            DateTime? endTime)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimerState():
        return $default(
            _that.timerSettings,
            _that.timerStatus,
            _that.timerStage,
            _that.elapsedWarmupTime,
            _that.elapsedTime,
            _that.startTime,
            _that.endTime);
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
            TimerSettings timerSettings,
            TimerStatus timerStatus,
            TimerStage timerStage,
            Duration elapsedWarmupTime,
            Duration elapsedTime,
            DateTime? startTime,
            DateTime? endTime)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _TimerState() when $default != null:
        return $default(
            _that.timerSettings,
            _that.timerStatus,
            _that.timerStage,
            _that.elapsedWarmupTime,
            _that.elapsedTime,
            _that.startTime,
            _that.endTime);
      case _:
        return null;
    }
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
