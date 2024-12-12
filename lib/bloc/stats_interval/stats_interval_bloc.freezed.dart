// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_interval_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$StatsIntervalEvent {
  StatsInterval get statsInterval => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatsInterval statsInterval) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatsInterval statsInterval)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatsInterval statsInterval)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatsIntervalChangedEvent value) changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatsIntervalChangedEvent value)? changed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatsIntervalChangedEvent value)? changed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of StatsIntervalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsIntervalEventCopyWith<StatsIntervalEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsIntervalEventCopyWith<$Res> {
  factory $StatsIntervalEventCopyWith(
          StatsIntervalEvent value, $Res Function(StatsIntervalEvent) then) =
      _$StatsIntervalEventCopyWithImpl<$Res, StatsIntervalEvent>;
  @useResult
  $Res call({StatsInterval statsInterval});

  $StatsIntervalCopyWith<$Res> get statsInterval;
}

/// @nodoc
class _$StatsIntervalEventCopyWithImpl<$Res, $Val extends StatsIntervalEvent>
    implements $StatsIntervalEventCopyWith<$Res> {
  _$StatsIntervalEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsIntervalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statsInterval = null,
  }) {
    return _then(_value.copyWith(
      statsInterval: null == statsInterval
          ? _value.statsInterval
          : statsInterval // ignore: cast_nullable_to_non_nullable
              as StatsInterval,
    ) as $Val);
  }

  /// Create a copy of StatsIntervalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatsIntervalCopyWith<$Res> get statsInterval {
    return $StatsIntervalCopyWith<$Res>(_value.statsInterval, (value) {
      return _then(_value.copyWith(statsInterval: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatsIntervalChangedEventImplCopyWith<$Res>
    implements $StatsIntervalEventCopyWith<$Res> {
  factory _$$StatsIntervalChangedEventImplCopyWith(
          _$StatsIntervalChangedEventImpl value,
          $Res Function(_$StatsIntervalChangedEventImpl) then) =
      __$$StatsIntervalChangedEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StatsInterval statsInterval});

  @override
  $StatsIntervalCopyWith<$Res> get statsInterval;
}

/// @nodoc
class __$$StatsIntervalChangedEventImplCopyWithImpl<$Res>
    extends _$StatsIntervalEventCopyWithImpl<$Res,
        _$StatsIntervalChangedEventImpl>
    implements _$$StatsIntervalChangedEventImplCopyWith<$Res> {
  __$$StatsIntervalChangedEventImplCopyWithImpl(
      _$StatsIntervalChangedEventImpl _value,
      $Res Function(_$StatsIntervalChangedEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsIntervalEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statsInterval = null,
  }) {
    return _then(_$StatsIntervalChangedEventImpl(
      statsInterval: null == statsInterval
          ? _value.statsInterval
          : statsInterval // ignore: cast_nullable_to_non_nullable
              as StatsInterval,
    ));
  }
}

/// @nodoc

class _$StatsIntervalChangedEventImpl implements StatsIntervalChangedEvent {
  const _$StatsIntervalChangedEventImpl({required this.statsInterval});

  @override
  final StatsInterval statsInterval;

  @override
  String toString() {
    return 'StatsIntervalEvent.changed(statsInterval: $statsInterval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsIntervalChangedEventImpl &&
            (identical(other.statsInterval, statsInterval) ||
                other.statsInterval == statsInterval));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statsInterval);

  /// Create a copy of StatsIntervalEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsIntervalChangedEventImplCopyWith<_$StatsIntervalChangedEventImpl>
      get copyWith => __$$StatsIntervalChangedEventImplCopyWithImpl<
          _$StatsIntervalChangedEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatsInterval statsInterval) changed,
  }) {
    return changed(statsInterval);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatsInterval statsInterval)? changed,
  }) {
    return changed?.call(statsInterval);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatsInterval statsInterval)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(statsInterval);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StatsIntervalChangedEvent value) changed,
  }) {
    return changed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StatsIntervalChangedEvent value)? changed,
  }) {
    return changed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StatsIntervalChangedEvent value)? changed,
    required TResult orElse(),
  }) {
    if (changed != null) {
      return changed(this);
    }
    return orElse();
  }
}

abstract class StatsIntervalChangedEvent implements StatsIntervalEvent {
  const factory StatsIntervalChangedEvent(
          {required final StatsInterval statsInterval}) =
      _$StatsIntervalChangedEventImpl;

  @override
  StatsInterval get statsInterval;

  /// Create a copy of StatsIntervalEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsIntervalChangedEventImplCopyWith<_$StatsIntervalChangedEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$StatsIntervalState {
  StatsInterval get statsInterval => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatsInterval statsInterval) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatsInterval statsInterval)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatsInterval statsInterval)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatsIntervalState value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatsIntervalState value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatsIntervalState value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of StatsIntervalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatsIntervalStateCopyWith<StatsIntervalState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatsIntervalStateCopyWith<$Res> {
  factory $StatsIntervalStateCopyWith(
          StatsIntervalState value, $Res Function(StatsIntervalState) then) =
      _$StatsIntervalStateCopyWithImpl<$Res, StatsIntervalState>;
  @useResult
  $Res call({StatsInterval statsInterval});

  $StatsIntervalCopyWith<$Res> get statsInterval;
}

/// @nodoc
class _$StatsIntervalStateCopyWithImpl<$Res, $Val extends StatsIntervalState>
    implements $StatsIntervalStateCopyWith<$Res> {
  _$StatsIntervalStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatsIntervalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statsInterval = null,
  }) {
    return _then(_value.copyWith(
      statsInterval: null == statsInterval
          ? _value.statsInterval
          : statsInterval // ignore: cast_nullable_to_non_nullable
              as StatsInterval,
    ) as $Val);
  }

  /// Create a copy of StatsIntervalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatsIntervalCopyWith<$Res> get statsInterval {
    return $StatsIntervalCopyWith<$Res>(_value.statsInterval, (value) {
      return _then(_value.copyWith(statsInterval: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$StatsIntervalStateImplCopyWith<$Res>
    implements $StatsIntervalStateCopyWith<$Res> {
  factory _$$StatsIntervalStateImplCopyWith(_$StatsIntervalStateImpl value,
          $Res Function(_$StatsIntervalStateImpl) then) =
      __$$StatsIntervalStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({StatsInterval statsInterval});

  @override
  $StatsIntervalCopyWith<$Res> get statsInterval;
}

/// @nodoc
class __$$StatsIntervalStateImplCopyWithImpl<$Res>
    extends _$StatsIntervalStateCopyWithImpl<$Res, _$StatsIntervalStateImpl>
    implements _$$StatsIntervalStateImplCopyWith<$Res> {
  __$$StatsIntervalStateImplCopyWithImpl(_$StatsIntervalStateImpl _value,
      $Res Function(_$StatsIntervalStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatsIntervalState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statsInterval = null,
  }) {
    return _then(_$StatsIntervalStateImpl(
      statsInterval: null == statsInterval
          ? _value.statsInterval
          : statsInterval // ignore: cast_nullable_to_non_nullable
              as StatsInterval,
    ));
  }
}

/// @nodoc

class _$StatsIntervalStateImpl extends _StatsIntervalState {
  _$StatsIntervalStateImpl({required this.statsInterval}) : super._();

  @override
  final StatsInterval statsInterval;

  @override
  String toString() {
    return 'StatsIntervalState.loaded(statsInterval: $statsInterval)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatsIntervalStateImpl &&
            (identical(other.statsInterval, statsInterval) ||
                other.statsInterval == statsInterval));
  }

  @override
  int get hashCode => Object.hash(runtimeType, statsInterval);

  /// Create a copy of StatsIntervalState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatsIntervalStateImplCopyWith<_$StatsIntervalStateImpl> get copyWith =>
      __$$StatsIntervalStateImplCopyWithImpl<_$StatsIntervalStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(StatsInterval statsInterval) loaded,
  }) {
    return loaded(statsInterval);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(StatsInterval statsInterval)? loaded,
  }) {
    return loaded?.call(statsInterval);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(StatsInterval statsInterval)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(statsInterval);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_StatsIntervalState value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_StatsIntervalState value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_StatsIntervalState value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _StatsIntervalState extends StatsIntervalState {
  factory _StatsIntervalState({required final StatsInterval statsInterval}) =
      _$StatsIntervalStateImpl;
  _StatsIntervalState._() : super._();

  @override
  StatsInterval get statsInterval;

  /// Create a copy of StatsIntervalState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatsIntervalStateImplCopyWith<_$StatsIntervalStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
