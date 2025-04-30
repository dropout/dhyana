// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weeks_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$WeeksEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)
        queryWeeks,
    required TResult Function(List<Week> weeks) receiveUpdate,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryWeeks,
    TResult? Function(List<Week> weeks)? receiveUpdate,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryWeeks,
    TResult Function(List<Week> weeks)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetWeeksEvent value) queryWeeks,
    required TResult Function(ReceiveUpdateWeeksEvent value) receiveUpdate,
    required TResult Function(WeeksErrorEvent value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetWeeksEvent value)? queryWeeks,
    TResult? Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult? Function(WeeksErrorEvent value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWeeksEvent value)? queryWeeks,
    TResult Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult Function(WeeksErrorEvent value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeksEventCopyWith<$Res> {
  factory $WeeksEventCopyWith(
          WeeksEvent value, $Res Function(WeeksEvent) then) =
      _$WeeksEventCopyWithImpl<$Res, WeeksEvent>;
}

/// @nodoc
class _$WeeksEventCopyWithImpl<$Res, $Val extends WeeksEvent>
    implements $WeeksEventCopyWith<$Res> {
  _$WeeksEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetWeeksEventImplCopyWith<$Res> {
  factory _$$GetWeeksEventImplCopyWith(
          _$GetWeeksEventImpl value, $Res Function(_$GetWeeksEventImpl) then) =
      __$$GetWeeksEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileId, DateTime from, DateTime to, bool useStream});
}

/// @nodoc
class __$$GetWeeksEventImplCopyWithImpl<$Res>
    extends _$WeeksEventCopyWithImpl<$Res, _$GetWeeksEventImpl>
    implements _$$GetWeeksEventImplCopyWith<$Res> {
  __$$GetWeeksEventImplCopyWithImpl(
      _$GetWeeksEventImpl _value, $Res Function(_$GetWeeksEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = null,
    Object? useStream = null,
  }) {
    return _then(_$GetWeeksEventImpl(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      useStream: null == useStream
          ? _value.useStream
          : useStream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$GetWeeksEventImpl extends GetWeeksEvent {
  const _$GetWeeksEventImpl(
      {required this.profileId,
      required this.from,
      required this.to,
      this.useStream = false})
      : super._();

  @override
  final String profileId;
  @override
  final DateTime from;
  @override
  final DateTime to;
  @override
  @JsonKey()
  final bool useStream;

  @override
  String toString() {
    return 'WeeksEvent.queryWeeks(profileId: $profileId, from: $from, to: $to, useStream: $useStream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetWeeksEventImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.useStream, useStream) ||
                other.useStream == useStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to, useStream);

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetWeeksEventImplCopyWith<_$GetWeeksEventImpl> get copyWith =>
      __$$GetWeeksEventImplCopyWithImpl<_$GetWeeksEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)
        queryWeeks,
    required TResult Function(List<Week> weeks) receiveUpdate,
    required TResult Function() error,
  }) {
    return queryWeeks(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryWeeks,
    TResult? Function(List<Week> weeks)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return queryWeeks?.call(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryWeeks,
    TResult Function(List<Week> weeks)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (queryWeeks != null) {
      return queryWeeks(profileId, from, to, useStream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetWeeksEvent value) queryWeeks,
    required TResult Function(ReceiveUpdateWeeksEvent value) receiveUpdate,
    required TResult Function(WeeksErrorEvent value) error,
  }) {
    return queryWeeks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetWeeksEvent value)? queryWeeks,
    TResult? Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult? Function(WeeksErrorEvent value)? error,
  }) {
    return queryWeeks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWeeksEvent value)? queryWeeks,
    TResult Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult Function(WeeksErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (queryWeeks != null) {
      return queryWeeks(this);
    }
    return orElse();
  }
}

abstract class GetWeeksEvent extends WeeksEvent {
  const factory GetWeeksEvent(
      {required final String profileId,
      required final DateTime from,
      required final DateTime to,
      final bool useStream}) = _$GetWeeksEventImpl;
  const GetWeeksEvent._() : super._();

  String get profileId;
  DateTime get from;
  DateTime get to;
  bool get useStream;

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetWeeksEventImplCopyWith<_$GetWeeksEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveUpdateWeeksEventImplCopyWith<$Res> {
  factory _$$ReceiveUpdateWeeksEventImplCopyWith(
          _$ReceiveUpdateWeeksEventImpl value,
          $Res Function(_$ReceiveUpdateWeeksEventImpl) then) =
      __$$ReceiveUpdateWeeksEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Week> weeks});
}

/// @nodoc
class __$$ReceiveUpdateWeeksEventImplCopyWithImpl<$Res>
    extends _$WeeksEventCopyWithImpl<$Res, _$ReceiveUpdateWeeksEventImpl>
    implements _$$ReceiveUpdateWeeksEventImplCopyWith<$Res> {
  __$$ReceiveUpdateWeeksEventImplCopyWithImpl(
      _$ReceiveUpdateWeeksEventImpl _value,
      $Res Function(_$ReceiveUpdateWeeksEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeks = null,
  }) {
    return _then(_$ReceiveUpdateWeeksEventImpl(
      weeks: null == weeks
          ? _value._weeks
          : weeks // ignore: cast_nullable_to_non_nullable
              as List<Week>,
    ));
  }
}

/// @nodoc

class _$ReceiveUpdateWeeksEventImpl extends ReceiveUpdateWeeksEvent {
  const _$ReceiveUpdateWeeksEventImpl({required final List<Week> weeks})
      : _weeks = weeks,
        super._();

  final List<Week> _weeks;
  @override
  List<Week> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  @override
  String toString() {
    return 'WeeksEvent.receiveUpdate(weeks: $weeks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveUpdateWeeksEventImpl &&
            const DeepCollectionEquality().equals(other._weeks, _weeks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_weeks));

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveUpdateWeeksEventImplCopyWith<_$ReceiveUpdateWeeksEventImpl>
      get copyWith => __$$ReceiveUpdateWeeksEventImplCopyWithImpl<
          _$ReceiveUpdateWeeksEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)
        queryWeeks,
    required TResult Function(List<Week> weeks) receiveUpdate,
    required TResult Function() error,
  }) {
    return receiveUpdate(weeks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryWeeks,
    TResult? Function(List<Week> weeks)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return receiveUpdate?.call(weeks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryWeeks,
    TResult Function(List<Week> weeks)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (receiveUpdate != null) {
      return receiveUpdate(weeks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetWeeksEvent value) queryWeeks,
    required TResult Function(ReceiveUpdateWeeksEvent value) receiveUpdate,
    required TResult Function(WeeksErrorEvent value) error,
  }) {
    return receiveUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetWeeksEvent value)? queryWeeks,
    TResult? Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult? Function(WeeksErrorEvent value)? error,
  }) {
    return receiveUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWeeksEvent value)? queryWeeks,
    TResult Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult Function(WeeksErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (receiveUpdate != null) {
      return receiveUpdate(this);
    }
    return orElse();
  }
}

abstract class ReceiveUpdateWeeksEvent extends WeeksEvent {
  const factory ReceiveUpdateWeeksEvent({required final List<Week> weeks}) =
      _$ReceiveUpdateWeeksEventImpl;
  const ReceiveUpdateWeeksEvent._() : super._();

  List<Week> get weeks;

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveUpdateWeeksEventImplCopyWith<_$ReceiveUpdateWeeksEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeeksErrorEventImplCopyWith<$Res> {
  factory _$$WeeksErrorEventImplCopyWith(_$WeeksErrorEventImpl value,
          $Res Function(_$WeeksErrorEventImpl) then) =
      __$$WeeksErrorEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeeksErrorEventImplCopyWithImpl<$Res>
    extends _$WeeksEventCopyWithImpl<$Res, _$WeeksErrorEventImpl>
    implements _$$WeeksErrorEventImplCopyWith<$Res> {
  __$$WeeksErrorEventImplCopyWithImpl(
      _$WeeksErrorEventImpl _value, $Res Function(_$WeeksErrorEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WeeksErrorEventImpl extends WeeksErrorEvent {
  const _$WeeksErrorEventImpl() : super._();

  @override
  String toString() {
    return 'WeeksEvent.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeeksErrorEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)
        queryWeeks,
    required TResult Function(List<Week> weeks) receiveUpdate,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryWeeks,
    TResult? Function(List<Week> weeks)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryWeeks,
    TResult Function(List<Week> weeks)? receiveUpdate,
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
    required TResult Function(GetWeeksEvent value) queryWeeks,
    required TResult Function(ReceiveUpdateWeeksEvent value) receiveUpdate,
    required TResult Function(WeeksErrorEvent value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetWeeksEvent value)? queryWeeks,
    TResult? Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult? Function(WeeksErrorEvent value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetWeeksEvent value)? queryWeeks,
    TResult Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult Function(WeeksErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WeeksErrorEvent extends WeeksEvent {
  const factory WeeksErrorEvent() = _$WeeksErrorEventImpl;
  const WeeksErrorEvent._() : super._();
}

/// @nodoc
mixin _$WeeksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)?
        loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeeksLoadingState value) loading,
    required TResult Function(WeeksLoadedState value) loaded,
    required TResult Function(WeeksLoadingErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeeksLoadingState value)? loading,
    TResult? Function(WeeksLoadedState value)? loaded,
    TResult? Function(WeeksLoadingErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeeksLoadingState value)? loading,
    TResult Function(WeeksLoadedState value)? loaded,
    TResult Function(WeeksLoadingErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeeksStateCopyWith<$Res> {
  factory $WeeksStateCopyWith(
          WeeksState value, $Res Function(WeeksState) then) =
      _$WeeksStateCopyWithImpl<$Res, WeeksState>;
}

/// @nodoc
class _$WeeksStateCopyWithImpl<$Res, $Val extends WeeksState>
    implements $WeeksStateCopyWith<$Res> {
  _$WeeksStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$WeeksLoadingStateImplCopyWith<$Res> {
  factory _$$WeeksLoadingStateImplCopyWith(_$WeeksLoadingStateImpl value,
          $Res Function(_$WeeksLoadingStateImpl) then) =
      __$$WeeksLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeeksLoadingStateImplCopyWithImpl<$Res>
    extends _$WeeksStateCopyWithImpl<$Res, _$WeeksLoadingStateImpl>
    implements _$$WeeksLoadingStateImplCopyWith<$Res> {
  __$$WeeksLoadingStateImplCopyWithImpl(_$WeeksLoadingStateImpl _value,
      $Res Function(_$WeeksLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WeeksLoadingStateImpl implements WeeksLoadingState {
  const _$WeeksLoadingStateImpl();

  @override
  String toString() {
    return 'WeeksState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeeksLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)
        loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)?
        loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)?
        loaded,
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
    required TResult Function(WeeksLoadingState value) loading,
    required TResult Function(WeeksLoadedState value) loaded,
    required TResult Function(WeeksLoadingErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeeksLoadingState value)? loading,
    TResult? Function(WeeksLoadedState value)? loaded,
    TResult? Function(WeeksLoadingErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeeksLoadingState value)? loading,
    TResult Function(WeeksLoadedState value)? loaded,
    TResult Function(WeeksLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WeeksLoadingState implements WeeksState {
  const factory WeeksLoadingState() = _$WeeksLoadingStateImpl;
}

/// @nodoc
abstract class _$$WeeksLoadedStateImplCopyWith<$Res> {
  factory _$$WeeksLoadedStateImplCopyWith(_$WeeksLoadedStateImpl value,
          $Res Function(_$WeeksLoadedStateImpl) then) =
      __$$WeeksLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      List<Week> weeks,
      CalculatedStats calculatedStats});

  $CalculatedStatsCopyWith<$Res> get calculatedStats;
}

/// @nodoc
class __$$WeeksLoadedStateImplCopyWithImpl<$Res>
    extends _$WeeksStateCopyWithImpl<$Res, _$WeeksLoadedStateImpl>
    implements _$$WeeksLoadedStateImplCopyWith<$Res> {
  __$$WeeksLoadedStateImplCopyWithImpl(_$WeeksLoadedStateImpl _value,
      $Res Function(_$WeeksLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? weeks = null,
    Object? calculatedStats = null,
  }) {
    return _then(_$WeeksLoadedStateImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weeks: null == weeks
          ? _value._weeks
          : weeks // ignore: cast_nullable_to_non_nullable
              as List<Week>,
      calculatedStats: null == calculatedStats
          ? _value.calculatedStats
          : calculatedStats // ignore: cast_nullable_to_non_nullable
              as CalculatedStats,
    ));
  }

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculatedStatsCopyWith<$Res> get calculatedStats {
    return $CalculatedStatsCopyWith<$Res>(_value.calculatedStats, (value) {
      return _then(_value.copyWith(calculatedStats: value));
    });
  }
}

/// @nodoc

class _$WeeksLoadedStateImpl implements WeeksLoadedState {
  const _$WeeksLoadedStateImpl(
      {required this.from,
      required this.to,
      required final List<Week> weeks,
      required this.calculatedStats})
      : _weeks = weeks;

  @override
  final DateTime from;
  @override
  final DateTime to;
  final List<Week> _weeks;
  @override
  List<Week> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  @override
  final CalculatedStats calculatedStats;

  @override
  String toString() {
    return 'WeeksState.loaded(from: $from, to: $to, weeks: $weeks, calculatedStats: $calculatedStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeksLoadedStateImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other._weeks, _weeks) &&
            (identical(other.calculatedStats, calculatedStats) ||
                other.calculatedStats == calculatedStats));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to,
      const DeepCollectionEquality().hash(_weeks), calculatedStats);

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeksLoadedStateImplCopyWith<_$WeeksLoadedStateImpl> get copyWith =>
      __$$WeeksLoadedStateImplCopyWithImpl<_$WeeksLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(from, to, weeks, calculatedStats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)?
        loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(from, to, weeks, calculatedStats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(from, to, weeks, calculatedStats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeeksLoadingState value) loading,
    required TResult Function(WeeksLoadedState value) loaded,
    required TResult Function(WeeksLoadingErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeeksLoadingState value)? loading,
    TResult? Function(WeeksLoadedState value)? loaded,
    TResult? Function(WeeksLoadingErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeeksLoadingState value)? loading,
    TResult Function(WeeksLoadedState value)? loaded,
    TResult Function(WeeksLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class WeeksLoadedState implements WeeksState {
  const factory WeeksLoadedState(
      {required final DateTime from,
      required final DateTime to,
      required final List<Week> weeks,
      required final CalculatedStats calculatedStats}) = _$WeeksLoadedStateImpl;

  DateTime get from;
  DateTime get to;
  List<Week> get weeks;
  CalculatedStats get calculatedStats;

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeksLoadedStateImplCopyWith<_$WeeksLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeeksLoadingErrorStateImplCopyWith<$Res> {
  factory _$$WeeksLoadingErrorStateImplCopyWith(
          _$WeeksLoadingErrorStateImpl value,
          $Res Function(_$WeeksLoadingErrorStateImpl) then) =
      __$$WeeksLoadingErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeeksLoadingErrorStateImplCopyWithImpl<$Res>
    extends _$WeeksStateCopyWithImpl<$Res, _$WeeksLoadingErrorStateImpl>
    implements _$$WeeksLoadingErrorStateImplCopyWith<$Res> {
  __$$WeeksLoadingErrorStateImplCopyWithImpl(
      _$WeeksLoadingErrorStateImpl _value,
      $Res Function(_$WeeksLoadingErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WeeksLoadingErrorStateImpl implements WeeksLoadingErrorState {
  const _$WeeksLoadingErrorStateImpl();

  @override
  String toString() {
    return 'WeeksState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeksLoadingErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)
        loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)?
        loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(DateTime from, DateTime to, List<Week> weeks,
            CalculatedStats calculatedStats)?
        loaded,
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
    required TResult Function(WeeksLoadingState value) loading,
    required TResult Function(WeeksLoadedState value) loaded,
    required TResult Function(WeeksLoadingErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeeksLoadingState value)? loading,
    TResult? Function(WeeksLoadedState value)? loaded,
    TResult? Function(WeeksLoadingErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeeksLoadingState value)? loading,
    TResult Function(WeeksLoadedState value)? loaded,
    TResult Function(WeeksLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WeeksLoadingErrorState implements WeeksState {
  const factory WeeksLoadingErrorState() = _$WeeksLoadingErrorStateImpl;
}
