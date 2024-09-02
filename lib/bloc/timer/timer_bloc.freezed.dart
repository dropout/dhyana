// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TimerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
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
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerEventCopyWith<$Res> {
  factory $TimerEventCopyWith(
          TimerEvent value, $Res Function(TimerEvent) then) =
      _$TimerEventCopyWithImpl<$Res, TimerEvent>;
}

/// @nodoc
class _$TimerEventCopyWithImpl<$Res, $Val extends TimerEvent>
    implements $TimerEventCopyWith<$Res> {
  _$TimerEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WarmupTickedImplCopyWith<$Res> {
  factory _$$WarmupTickedImplCopyWith(
          _$WarmupTickedImpl value, $Res Function(_$WarmupTickedImpl) then) =
      __$$WarmupTickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int ticks});
}

/// @nodoc
class __$$WarmupTickedImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$WarmupTickedImpl>
    implements _$$WarmupTickedImplCopyWith<$Res> {
  __$$WarmupTickedImplCopyWithImpl(
      _$WarmupTickedImpl _value, $Res Function(_$WarmupTickedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticks = null,
  }) {
    return _then(_$WarmupTickedImpl(
      ticks: null == ticks
          ? _value.ticks
          : ticks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WarmupTickedImpl extends WarmupTicked with DiagnosticableTreeMixin {
  _$WarmupTickedImpl({required this.ticks}) : super._();

  @override
  final int ticks;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.warmupTicked(ticks: $ticks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerEvent.warmupTicked'))
      ..add(DiagnosticsProperty('ticks', ticks));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarmupTickedImpl &&
            (identical(other.ticks, ticks) || other.ticks == ticks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticks);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WarmupTickedImplCopyWith<_$WarmupTickedImpl> get copyWith =>
      __$$WarmupTickedImplCopyWithImpl<_$WarmupTickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return warmupTicked(ticks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return warmupTicked?.call(ticks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (warmupTicked != null) {
      return warmupTicked(ticks);
    }
    return orElse();
  }

  @override
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
    return warmupTicked(this);
  }

  @override
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
    return warmupTicked?.call(this);
  }

  @override
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
    if (warmupTicked != null) {
      return warmupTicked(this);
    }
    return orElse();
  }
}

abstract class WarmupTicked extends TimerEvent {
  factory WarmupTicked({required final int ticks}) = _$WarmupTickedImpl;
  WarmupTicked._() : super._();

  int get ticks;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WarmupTickedImplCopyWith<_$WarmupTickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WarmupCompletedImplCopyWith<$Res> {
  factory _$$WarmupCompletedImplCopyWith(_$WarmupCompletedImpl value,
          $Res Function(_$WarmupCompletedImpl) then) =
      __$$WarmupCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WarmupCompletedImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$WarmupCompletedImpl>
    implements _$$WarmupCompletedImplCopyWith<$Res> {
  __$$WarmupCompletedImplCopyWithImpl(
      _$WarmupCompletedImpl _value, $Res Function(_$WarmupCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WarmupCompletedImpl extends WarmupCompleted
    with DiagnosticableTreeMixin {
  _$WarmupCompletedImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.warmupCompleted()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerEvent.warmupCompleted'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WarmupCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return warmupCompleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return warmupCompleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (warmupCompleted != null) {
      return warmupCompleted();
    }
    return orElse();
  }

  @override
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
    return warmupCompleted(this);
  }

  @override
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
    return warmupCompleted?.call(this);
  }

  @override
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
    if (warmupCompleted != null) {
      return warmupCompleted(this);
    }
    return orElse();
  }
}

abstract class WarmupCompleted extends TimerEvent {
  factory WarmupCompleted() = _$WarmupCompletedImpl;
  WarmupCompleted._() : super._();
}

/// @nodoc
abstract class _$$TimerStartedImplCopyWith<$Res> {
  factory _$$TimerStartedImplCopyWith(
          _$TimerStartedImpl value, $Res Function(_$TimerStartedImpl) then) =
      __$$TimerStartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerStartedImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerStartedImpl>
    implements _$$TimerStartedImplCopyWith<$Res> {
  __$$TimerStartedImplCopyWithImpl(
      _$TimerStartedImpl _value, $Res Function(_$TimerStartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerStartedImpl extends TimerStarted with DiagnosticableTreeMixin {
  _$TimerStartedImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.started()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerEvent.started'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerStartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
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
    return started(this);
  }

  @override
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
    return started?.call(this);
  }

  @override
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
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class TimerStarted extends TimerEvent {
  factory TimerStarted() = _$TimerStartedImpl;
  TimerStarted._() : super._();
}

/// @nodoc
abstract class _$$TimerPausedImplCopyWith<$Res> {
  factory _$$TimerPausedImplCopyWith(
          _$TimerPausedImpl value, $Res Function(_$TimerPausedImpl) then) =
      __$$TimerPausedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerPausedImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerPausedImpl>
    implements _$$TimerPausedImplCopyWith<$Res> {
  __$$TimerPausedImplCopyWithImpl(
      _$TimerPausedImpl _value, $Res Function(_$TimerPausedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerPausedImpl extends TimerPaused with DiagnosticableTreeMixin {
  _$TimerPausedImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.paused()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerEvent.paused'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerPausedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return paused();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return paused?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused();
    }
    return orElse();
  }

  @override
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
    return paused(this);
  }

  @override
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
    return paused?.call(this);
  }

  @override
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
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class TimerPaused extends TimerEvent {
  factory TimerPaused() = _$TimerPausedImpl;
  TimerPaused._() : super._();
}

/// @nodoc
abstract class _$$TimerResumedImplCopyWith<$Res> {
  factory _$$TimerResumedImplCopyWith(
          _$TimerResumedImpl value, $Res Function(_$TimerResumedImpl) then) =
      __$$TimerResumedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerResumedImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerResumedImpl>
    implements _$$TimerResumedImplCopyWith<$Res> {
  __$$TimerResumedImplCopyWithImpl(
      _$TimerResumedImpl _value, $Res Function(_$TimerResumedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerResumedImpl extends TimerResumed with DiagnosticableTreeMixin {
  _$TimerResumedImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.resumed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerEvent.resumed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerResumedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return resumed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return resumed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed();
    }
    return orElse();
  }

  @override
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
    return resumed(this);
  }

  @override
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
    return resumed?.call(this);
  }

  @override
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
    if (resumed != null) {
      return resumed(this);
    }
    return orElse();
  }
}

abstract class TimerResumed extends TimerEvent {
  factory TimerResumed() = _$TimerResumedImpl;
  TimerResumed._() : super._();
}

/// @nodoc
abstract class _$$TimerCompletedImplCopyWith<$Res> {
  factory _$$TimerCompletedImplCopyWith(_$TimerCompletedImpl value,
          $Res Function(_$TimerCompletedImpl) then) =
      __$$TimerCompletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerCompletedImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerCompletedImpl>
    implements _$$TimerCompletedImplCopyWith<$Res> {
  __$$TimerCompletedImplCopyWithImpl(
      _$TimerCompletedImpl _value, $Res Function(_$TimerCompletedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerCompletedImpl extends TimerCompleted with DiagnosticableTreeMixin {
  _$TimerCompletedImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.completed()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerEvent.completed'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerCompletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
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
    return completed(this);
  }

  @override
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
    return completed?.call(this);
  }

  @override
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
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class TimerCompleted extends TimerEvent {
  factory TimerCompleted() = _$TimerCompletedImpl;
  TimerCompleted._() : super._();
}

/// @nodoc
abstract class _$$TimerTickedImplCopyWith<$Res> {
  factory _$$TimerTickedImplCopyWith(
          _$TimerTickedImpl value, $Res Function(_$TimerTickedImpl) then) =
      __$$TimerTickedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int ticks});
}

/// @nodoc
class __$$TimerTickedImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerTickedImpl>
    implements _$$TimerTickedImplCopyWith<$Res> {
  __$$TimerTickedImplCopyWithImpl(
      _$TimerTickedImpl _value, $Res Function(_$TimerTickedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticks = null,
  }) {
    return _then(_$TimerTickedImpl(
      ticks: null == ticks
          ? _value.ticks
          : ticks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerTickedImpl extends TimerTicked with DiagnosticableTreeMixin {
  _$TimerTickedImpl({required this.ticks}) : super._();

  @override
  final int ticks;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.timerTicked(ticks: $ticks)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerEvent.timerTicked'))
      ..add(DiagnosticsProperty('ticks', ticks));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerTickedImpl &&
            (identical(other.ticks, ticks) || other.ticks == ticks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticks);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerTickedImplCopyWith<_$TimerTickedImpl> get copyWith =>
      __$$TimerTickedImplCopyWithImpl<_$TimerTickedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return timerTicked(ticks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return timerTicked?.call(ticks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (timerTicked != null) {
      return timerTicked(ticks);
    }
    return orElse();
  }

  @override
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
    return timerTicked(this);
  }

  @override
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
    return timerTicked?.call(this);
  }

  @override
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
    if (timerTicked != null) {
      return timerTicked(this);
    }
    return orElse();
  }
}

abstract class TimerTicked extends TimerEvent {
  factory TimerTicked({required final int ticks}) = _$TimerTickedImpl;
  TimerTicked._() : super._();

  int get ticks;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerTickedImplCopyWith<_$TimerTickedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerResetImplCopyWith<$Res> {
  factory _$$TimerResetImplCopyWith(
          _$TimerResetImpl value, $Res Function(_$TimerResetImpl) then) =
      __$$TimerResetImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerResetImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerResetImpl>
    implements _$$TimerResetImplCopyWith<$Res> {
  __$$TimerResetImplCopyWithImpl(
      _$TimerResetImpl _value, $Res Function(_$TimerResetImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerResetImpl extends TimerReset with DiagnosticableTreeMixin {
  _$TimerResetImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.reset()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerEvent.reset'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerResetImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return reset();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return reset?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
    }
    return orElse();
  }

  @override
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
    return reset(this);
  }

  @override
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
    return reset?.call(this);
  }

  @override
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
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class TimerReset extends TimerEvent {
  factory TimerReset() = _$TimerResetImpl;
  TimerReset._() : super._();
}

/// @nodoc
abstract class _$$TimerErrorOccurredImplCopyWith<$Res> {
  factory _$$TimerErrorOccurredImplCopyWith(_$TimerErrorOccurredImpl value,
          $Res Function(_$TimerErrorOccurredImpl) then) =
      __$$TimerErrorOccurredImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error, StackTrace stackTrace});
}

/// @nodoc
class __$$TimerErrorOccurredImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerErrorOccurredImpl>
    implements _$$TimerErrorOccurredImplCopyWith<$Res> {
  __$$TimerErrorOccurredImplCopyWithImpl(_$TimerErrorOccurredImpl _value,
      $Res Function(_$TimerErrorOccurredImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = null,
  }) {
    return _then(_$TimerErrorOccurredImpl(
      error: freezed == error ? _value.error : error,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$TimerErrorOccurredImpl extends TimerErrorOccurred
    with DiagnosticableTreeMixin {
  _$TimerErrorOccurredImpl({this.error, required this.stackTrace}) : super._();

  @override
  final Object? error;
  @override
  final StackTrace stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.error(error: $error, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TimerEvent.error'))
      ..add(DiagnosticsProperty('error', error))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerErrorOccurredImpl &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerErrorOccurredImplCopyWith<_$TimerErrorOccurredImpl> get copyWith =>
      __$$TimerErrorOccurredImplCopyWithImpl<_$TimerErrorOccurredImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return error(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return error?.call(this.error, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error, stackTrace);
    }
    return orElse();
  }

  @override
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
    return error(this);
  }

  @override
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
    return error?.call(this);
  }

  @override
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
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class TimerErrorOccurred extends TimerEvent {
  factory TimerErrorOccurred(
      {final Object? error,
      required final StackTrace stackTrace}) = _$TimerErrorOccurredImpl;
  TimerErrorOccurred._() : super._();

  Object? get error;
  StackTrace get stackTrace;

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerErrorOccurredImplCopyWith<_$TimerErrorOccurredImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerFinishedImplCopyWith<$Res> {
  factory _$$TimerFinishedImplCopyWith(
          _$TimerFinishedImpl value, $Res Function(_$TimerFinishedImpl) then) =
      __$$TimerFinishedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerFinishedImplCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerFinishedImpl>
    implements _$$TimerFinishedImplCopyWith<$Res> {
  __$$TimerFinishedImplCopyWithImpl(
      _$TimerFinishedImpl _value, $Res Function(_$TimerFinishedImpl) _then)
      : super(_value, _then);

  /// Create a copy of TimerEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$TimerFinishedImpl extends TimerFinished with DiagnosticableTreeMixin {
  _$TimerFinishedImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.finished()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerEvent.finished'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerFinishedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticks) warmupTicked,
    required TResult Function() warmupCompleted,
    required TResult Function() started,
    required TResult Function() paused,
    required TResult Function() resumed,
    required TResult Function() completed,
    required TResult Function(int ticks) timerTicked,
    required TResult Function() reset,
    required TResult Function(Object? error, StackTrace stackTrace) error,
    required TResult Function() finished,
  }) {
    return finished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticks)? warmupTicked,
    TResult? Function()? warmupCompleted,
    TResult? Function()? started,
    TResult? Function()? paused,
    TResult? Function()? resumed,
    TResult? Function()? completed,
    TResult? Function(int ticks)? timerTicked,
    TResult? Function()? reset,
    TResult? Function(Object? error, StackTrace stackTrace)? error,
    TResult? Function()? finished,
  }) {
    return finished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticks)? warmupTicked,
    TResult Function()? warmupCompleted,
    TResult Function()? started,
    TResult Function()? paused,
    TResult Function()? resumed,
    TResult Function()? completed,
    TResult Function(int ticks)? timerTicked,
    TResult Function()? reset,
    TResult Function(Object? error, StackTrace stackTrace)? error,
    TResult Function()? finished,
    required TResult orElse(),
  }) {
    if (finished != null) {
      return finished();
    }
    return orElse();
  }

  @override
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
    return finished(this);
  }

  @override
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
    return finished?.call(this);
  }

  @override
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
    if (finished != null) {
      return finished(this);
    }
    return orElse();
  }
}

abstract class TimerFinished extends TimerEvent {
  factory TimerFinished() = _$TimerFinishedImpl;
  TimerFinished._() : super._();
}

/// @nodoc
mixin _$TimerState {
  TimerSettings get timerSettings => throw _privateConstructorUsedError;
  TimerStatus get timerStatus => throw _privateConstructorUsedError;
  TimerStage get timerStage => throw _privateConstructorUsedError;
  Duration get elapsedWarmupTime => throw _privateConstructorUsedError;
  Duration get elapsedTime => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TimerStateCopyWith<TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerStateCopyWith<$Res> {
  factory $TimerStateCopyWith(
          TimerState value, $Res Function(TimerState) then) =
      _$TimerStateCopyWithImpl<$Res, TimerState>;
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
class _$TimerStateCopyWithImpl<$Res, $Val extends TimerState>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      timerStatus: null == timerStatus
          ? _value.timerStatus
          : timerStatus // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      timerStage: null == timerStage
          ? _value.timerStage
          : timerStage // ignore: cast_nullable_to_non_nullable
              as TimerStage,
      elapsedWarmupTime: null == elapsedWarmupTime
          ? _value.elapsedWarmupTime
          : elapsedWarmupTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      elapsedTime: null == elapsedTime
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TimerStateImplCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$TimerStateImplCopyWith(
          _$TimerStateImpl value, $Res Function(_$TimerStateImpl) then) =
      __$$TimerStateImplCopyWithImpl<$Res>;
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
class __$$TimerStateImplCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$TimerStateImpl>
    implements _$$TimerStateImplCopyWith<$Res> {
  __$$TimerStateImplCopyWithImpl(
      _$TimerStateImpl _value, $Res Function(_$TimerStateImpl) _then)
      : super(_value, _then);

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
    return _then(_$TimerStateImpl(
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
      timerStatus: null == timerStatus
          ? _value.timerStatus
          : timerStatus // ignore: cast_nullable_to_non_nullable
              as TimerStatus,
      timerStage: null == timerStage
          ? _value.timerStage
          : timerStage // ignore: cast_nullable_to_non_nullable
              as TimerStage,
      elapsedWarmupTime: null == elapsedWarmupTime
          ? _value.elapsedWarmupTime
          : elapsedWarmupTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      elapsedTime: null == elapsedTime
          ? _value.elapsedTime
          : elapsedTime // ignore: cast_nullable_to_non_nullable
              as Duration,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$TimerStateImpl extends _TimerState with DiagnosticableTreeMixin {
  const _$TimerStateImpl(
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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerState(timerSettings: $timerSettings, timerStatus: $timerStatus, timerStage: $timerStage, elapsedWarmupTime: $elapsedWarmupTime, elapsedTime: $elapsedTime, startTime: $startTime, endTime: $endTime)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
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
            other is _$TimerStateImpl &&
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

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      __$$TimerStateImplCopyWithImpl<_$TimerStateImpl>(this, _$identity);
}

abstract class _TimerState extends TimerState {
  const factory _TimerState(
      {required final TimerSettings timerSettings,
      required final TimerStatus timerStatus,
      required final TimerStage timerStage,
      required final Duration elapsedWarmupTime,
      required final Duration elapsedTime,
      final DateTime? startTime,
      final DateTime? endTime}) = _$TimerStateImpl;
  const _TimerState._() : super._();

  @override
  TimerSettings get timerSettings;
  @override
  TimerStatus get timerStatus;
  @override
  TimerStage get timerStage;
  @override
  Duration get elapsedWarmupTime;
  @override
  Duration get elapsedTime;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;

  /// Create a copy of TimerState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TimerStateImplCopyWith<_$TimerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
