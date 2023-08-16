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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
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
}

/// @nodoc
abstract class _$$WarmupTickedCopyWith<$Res> {
  factory _$$WarmupTickedCopyWith(
          _$WarmupTicked value, $Res Function(_$WarmupTicked) then) =
      __$$WarmupTickedCopyWithImpl<$Res>;
  @useResult
  $Res call({int ticks});
}

/// @nodoc
class __$$WarmupTickedCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$WarmupTicked>
    implements _$$WarmupTickedCopyWith<$Res> {
  __$$WarmupTickedCopyWithImpl(
      _$WarmupTicked _value, $Res Function(_$WarmupTicked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticks = null,
  }) {
    return _then(_$WarmupTicked(
      ticks: null == ticks
          ? _value.ticks
          : ticks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$WarmupTicked extends WarmupTicked with DiagnosticableTreeMixin {
  _$WarmupTicked({required this.ticks}) : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WarmupTicked &&
            (identical(other.ticks, ticks) || other.ticks == ticks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WarmupTickedCopyWith<_$WarmupTicked> get copyWith =>
      __$$WarmupTickedCopyWithImpl<_$WarmupTicked>(this, _$identity);

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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
    required TResult orElse(),
  }) {
    if (warmupTicked != null) {
      return warmupTicked(this);
    }
    return orElse();
  }
}

abstract class WarmupTicked extends TimerEvent {
  factory WarmupTicked({required final int ticks}) = _$WarmupTicked;
  WarmupTicked._() : super._();

  int get ticks;
  @JsonKey(ignore: true)
  _$$WarmupTickedCopyWith<_$WarmupTicked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WarmupCompletedCopyWith<$Res> {
  factory _$$WarmupCompletedCopyWith(
          _$WarmupCompleted value, $Res Function(_$WarmupCompleted) then) =
      __$$WarmupCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WarmupCompletedCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$WarmupCompleted>
    implements _$$WarmupCompletedCopyWith<$Res> {
  __$$WarmupCompletedCopyWithImpl(
      _$WarmupCompleted _value, $Res Function(_$WarmupCompleted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WarmupCompleted extends WarmupCompleted with DiagnosticableTreeMixin {
  _$WarmupCompleted() : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WarmupCompleted);
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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
    required TResult orElse(),
  }) {
    if (warmupCompleted != null) {
      return warmupCompleted(this);
    }
    return orElse();
  }
}

abstract class WarmupCompleted extends TimerEvent {
  factory WarmupCompleted() = _$WarmupCompleted;
  WarmupCompleted._() : super._();
}

/// @nodoc
abstract class _$$TimerStartedCopyWith<$Res> {
  factory _$$TimerStartedCopyWith(
          _$TimerStarted value, $Res Function(_$TimerStarted) then) =
      __$$TimerStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerStartedCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerStarted>
    implements _$$TimerStartedCopyWith<$Res> {
  __$$TimerStartedCopyWithImpl(
      _$TimerStarted _value, $Res Function(_$TimerStarted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerStarted extends TimerStarted with DiagnosticableTreeMixin {
  _$TimerStarted() : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerStarted);
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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class TimerStarted extends TimerEvent {
  factory TimerStarted() = _$TimerStarted;
  TimerStarted._() : super._();
}

/// @nodoc
abstract class _$$TimerPausedCopyWith<$Res> {
  factory _$$TimerPausedCopyWith(
          _$TimerPaused value, $Res Function(_$TimerPaused) then) =
      __$$TimerPausedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerPausedCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerPaused>
    implements _$$TimerPausedCopyWith<$Res> {
  __$$TimerPausedCopyWithImpl(
      _$TimerPaused _value, $Res Function(_$TimerPaused) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerPaused extends TimerPaused with DiagnosticableTreeMixin {
  _$TimerPaused() : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerPaused);
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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class TimerPaused extends TimerEvent {
  factory TimerPaused() = _$TimerPaused;
  TimerPaused._() : super._();
}

/// @nodoc
abstract class _$$TimerResumedCopyWith<$Res> {
  factory _$$TimerResumedCopyWith(
          _$TimerResumed value, $Res Function(_$TimerResumed) then) =
      __$$TimerResumedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerResumedCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerResumed>
    implements _$$TimerResumedCopyWith<$Res> {
  __$$TimerResumedCopyWithImpl(
      _$TimerResumed _value, $Res Function(_$TimerResumed) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerResumed extends TimerResumed with DiagnosticableTreeMixin {
  _$TimerResumed() : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerResumed);
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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
    required TResult orElse(),
  }) {
    if (resumed != null) {
      return resumed(this);
    }
    return orElse();
  }
}

abstract class TimerResumed extends TimerEvent {
  factory TimerResumed() = _$TimerResumed;
  TimerResumed._() : super._();
}

/// @nodoc
abstract class _$$TimerCompletedCopyWith<$Res> {
  factory _$$TimerCompletedCopyWith(
          _$TimerCompleted value, $Res Function(_$TimerCompleted) then) =
      __$$TimerCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerCompletedCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerCompleted>
    implements _$$TimerCompletedCopyWith<$Res> {
  __$$TimerCompletedCopyWithImpl(
      _$TimerCompleted _value, $Res Function(_$TimerCompleted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerCompleted extends TimerCompleted with DiagnosticableTreeMixin {
  _$TimerCompleted() : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerCompleted);
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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }
}

abstract class TimerCompleted extends TimerEvent {
  factory TimerCompleted() = _$TimerCompleted;
  TimerCompleted._() : super._();
}

/// @nodoc
abstract class _$$TimerTickedCopyWith<$Res> {
  factory _$$TimerTickedCopyWith(
          _$TimerTicked value, $Res Function(_$TimerTicked) then) =
      __$$TimerTickedCopyWithImpl<$Res>;
  @useResult
  $Res call({int ticks});
}

/// @nodoc
class __$$TimerTickedCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerTicked>
    implements _$$TimerTickedCopyWith<$Res> {
  __$$TimerTickedCopyWithImpl(
      _$TimerTicked _value, $Res Function(_$TimerTicked) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ticks = null,
  }) {
    return _then(_$TimerTicked(
      ticks: null == ticks
          ? _value.ticks
          : ticks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TimerTicked extends TimerTicked with DiagnosticableTreeMixin {
  _$TimerTicked({required this.ticks}) : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerTicked &&
            (identical(other.ticks, ticks) || other.ticks == ticks));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerTickedCopyWith<_$TimerTicked> get copyWith =>
      __$$TimerTickedCopyWithImpl<_$TimerTicked>(this, _$identity);

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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
    required TResult orElse(),
  }) {
    if (timerTicked != null) {
      return timerTicked(this);
    }
    return orElse();
  }
}

abstract class TimerTicked extends TimerEvent {
  factory TimerTicked({required final int ticks}) = _$TimerTicked;
  TimerTicked._() : super._();

  int get ticks;
  @JsonKey(ignore: true)
  _$$TimerTickedCopyWith<_$TimerTicked> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TimerResetCopyWith<$Res> {
  factory _$$TimerResetCopyWith(
          _$TimerReset value, $Res Function(_$TimerReset) then) =
      __$$TimerResetCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TimerResetCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerReset>
    implements _$$TimerResetCopyWith<$Res> {
  __$$TimerResetCopyWithImpl(
      _$TimerReset _value, $Res Function(_$TimerReset) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TimerReset extends TimerReset with DiagnosticableTreeMixin {
  _$TimerReset() : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TimerReset);
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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class TimerReset extends TimerEvent {
  factory TimerReset() = _$TimerReset;
  TimerReset._() : super._();
}

/// @nodoc
abstract class _$$TimerErrorOccurredCopyWith<$Res> {
  factory _$$TimerErrorOccurredCopyWith(_$TimerErrorOccurred value,
          $Res Function(_$TimerErrorOccurred) then) =
      __$$TimerErrorOccurredCopyWithImpl<$Res>;
  @useResult
  $Res call({Object? error, StackTrace stackTrace});
}

/// @nodoc
class __$$TimerErrorOccurredCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$TimerErrorOccurred>
    implements _$$TimerErrorOccurredCopyWith<$Res> {
  __$$TimerErrorOccurredCopyWithImpl(
      _$TimerErrorOccurred _value, $Res Function(_$TimerErrorOccurred) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? stackTrace = null,
  }) {
    return _then(_$TimerErrorOccurred(
      error: freezed == error ? _value.error : error,
      stackTrace: null == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$TimerErrorOccurred extends TimerErrorOccurred
    with DiagnosticableTreeMixin {
  _$TimerErrorOccurred({this.error, required this.stackTrace}) : super._();

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TimerErrorOccurred &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), stackTrace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TimerErrorOccurredCopyWith<_$TimerErrorOccurred> get copyWith =>
      __$$TimerErrorOccurredCopyWithImpl<_$TimerErrorOccurred>(
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
    required TResult Function() timerStarted,
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
    TResult? Function()? timerStarted,
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
    TResult Function()? timerStarted,
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
    required TResult Function(FinishTimer value) timerStarted,
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
    TResult? Function(FinishTimer value)? timerStarted,
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
    TResult Function(FinishTimer value)? timerStarted,
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
      required final StackTrace stackTrace}) = _$TimerErrorOccurred;
  TimerErrorOccurred._() : super._();

  Object? get error;
  StackTrace get stackTrace;
  @JsonKey(ignore: true)
  _$$TimerErrorOccurredCopyWith<_$TimerErrorOccurred> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FinishTimerCopyWith<$Res> {
  factory _$$FinishTimerCopyWith(
          _$FinishTimer value, $Res Function(_$FinishTimer) then) =
      __$$FinishTimerCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FinishTimerCopyWithImpl<$Res>
    extends _$TimerEventCopyWithImpl<$Res, _$FinishTimer>
    implements _$$FinishTimerCopyWith<$Res> {
  __$$FinishTimerCopyWithImpl(
      _$FinishTimer _value, $Res Function(_$FinishTimer) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FinishTimer extends FinishTimer with DiagnosticableTreeMixin {
  _$FinishTimer() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TimerEvent.timerStarted()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'TimerEvent.timerStarted'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FinishTimer);
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
    required TResult Function() timerStarted,
  }) {
    return timerStarted();
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
    TResult? Function()? timerStarted,
  }) {
    return timerStarted?.call();
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
    TResult Function()? timerStarted,
    required TResult orElse(),
  }) {
    if (timerStarted != null) {
      return timerStarted();
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
    required TResult Function(FinishTimer value) timerStarted,
  }) {
    return timerStarted(this);
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
    TResult? Function(FinishTimer value)? timerStarted,
  }) {
    return timerStarted?.call(this);
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
    TResult Function(FinishTimer value)? timerStarted,
    required TResult orElse(),
  }) {
    if (timerStarted != null) {
      return timerStarted(this);
    }
    return orElse();
  }
}

abstract class FinishTimer extends TimerEvent {
  factory FinishTimer() = _$FinishTimer;
  FinishTimer._() : super._();
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

  @JsonKey(ignore: true)
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

  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_TimerStateCopyWith<$Res>
    implements $TimerStateCopyWith<$Res> {
  factory _$$_TimerStateCopyWith(
          _$_TimerState value, $Res Function(_$_TimerState) then) =
      __$$_TimerStateCopyWithImpl<$Res>;
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
class __$$_TimerStateCopyWithImpl<$Res>
    extends _$TimerStateCopyWithImpl<$Res, _$_TimerState>
    implements _$$_TimerStateCopyWith<$Res> {
  __$$_TimerStateCopyWithImpl(
      _$_TimerState _value, $Res Function(_$_TimerState) _then)
      : super(_value, _then);

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
    return _then(_$_TimerState(
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

class _$_TimerState extends _TimerState with DiagnosticableTreeMixin {
  const _$_TimerState(
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerState &&
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

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerStateCopyWith<_$_TimerState> get copyWith =>
      __$$_TimerStateCopyWithImpl<_$_TimerState>(this, _$identity);
}

abstract class _TimerState extends TimerState {
  const factory _TimerState(
      {required final TimerSettings timerSettings,
      required final TimerStatus timerStatus,
      required final TimerStage timerStage,
      required final Duration elapsedWarmupTime,
      required final Duration elapsedTime,
      final DateTime? startTime,
      final DateTime? endTime}) = _$_TimerState;
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
  @override
  @JsonKey(ignore: true)
  _$$_TimerStateCopyWith<_$_TimerState> get copyWith =>
      throw _privateConstructorUsedError;
}
