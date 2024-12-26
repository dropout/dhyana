// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'days_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DaysEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)
        queryDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryDays,
    TResult Function(List<Day> days)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryDaysEvent value) queryDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryDaysEvent value)? queryDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryDaysEvent value)? queryDays,
    TResult Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult Function(DaysErrorEvent value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaysEventCopyWith<$Res> {
  factory $DaysEventCopyWith(DaysEvent value, $Res Function(DaysEvent) then) =
      _$DaysEventCopyWithImpl<$Res, DaysEvent>;
}

/// @nodoc
class _$DaysEventCopyWithImpl<$Res, $Val extends DaysEvent>
    implements $DaysEventCopyWith<$Res> {
  _$DaysEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$QueryDaysEventImplCopyWith<$Res> {
  factory _$$QueryDaysEventImplCopyWith(_$QueryDaysEventImpl value,
          $Res Function(_$QueryDaysEventImpl) then) =
      __$$QueryDaysEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileId, DateTime from, DateTime to, bool useStream});
}

/// @nodoc
class __$$QueryDaysEventImplCopyWithImpl<$Res>
    extends _$DaysEventCopyWithImpl<$Res, _$QueryDaysEventImpl>
    implements _$$QueryDaysEventImplCopyWith<$Res> {
  __$$QueryDaysEventImplCopyWithImpl(
      _$QueryDaysEventImpl _value, $Res Function(_$QueryDaysEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = null,
    Object? useStream = null,
  }) {
    return _then(_$QueryDaysEventImpl(
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

class _$QueryDaysEventImpl extends QueryDaysEvent {
  const _$QueryDaysEventImpl(
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
    return 'DaysEvent.queryDays(profileId: $profileId, from: $from, to: $to, useStream: $useStream)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryDaysEventImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.useStream, useStream) ||
                other.useStream == useStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to, useStream);

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryDaysEventImplCopyWith<_$QueryDaysEventImpl> get copyWith =>
      __$$QueryDaysEventImplCopyWithImpl<_$QueryDaysEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)
        queryDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) {
    return queryDays(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return queryDays?.call(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryDays,
    TResult Function(List<Day> days)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (queryDays != null) {
      return queryDays(profileId, from, to, useStream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryDaysEvent value) queryDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return queryDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryDaysEvent value)? queryDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return queryDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryDaysEvent value)? queryDays,
    TResult Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult Function(DaysErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (queryDays != null) {
      return queryDays(this);
    }
    return orElse();
  }
}

abstract class QueryDaysEvent extends DaysEvent {
  const factory QueryDaysEvent(
      {required final String profileId,
      required final DateTime from,
      required final DateTime to,
      final bool useStream}) = _$QueryDaysEventImpl;
  const QueryDaysEvent._() : super._();

  String get profileId;
  DateTime get from;
  DateTime get to;
  bool get useStream;

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryDaysEventImplCopyWith<_$QueryDaysEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveUpdateDaysEventImplCopyWith<$Res> {
  factory _$$ReceiveUpdateDaysEventImplCopyWith(
          _$ReceiveUpdateDaysEventImpl value,
          $Res Function(_$ReceiveUpdateDaysEventImpl) then) =
      __$$ReceiveUpdateDaysEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Day> days});
}

/// @nodoc
class __$$ReceiveUpdateDaysEventImplCopyWithImpl<$Res>
    extends _$DaysEventCopyWithImpl<$Res, _$ReceiveUpdateDaysEventImpl>
    implements _$$ReceiveUpdateDaysEventImplCopyWith<$Res> {
  __$$ReceiveUpdateDaysEventImplCopyWithImpl(
      _$ReceiveUpdateDaysEventImpl _value,
      $Res Function(_$ReceiveUpdateDaysEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
  }) {
    return _then(_$ReceiveUpdateDaysEventImpl(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc

class _$ReceiveUpdateDaysEventImpl extends ReceiveUpdateDaysEvent {
  const _$ReceiveUpdateDaysEventImpl({required final List<Day> days})
      : _days = days,
        super._();

  final List<Day> _days;
  @override
  List<Day> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'DaysEvent.receiveUpdate(days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveUpdateDaysEventImpl &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_days));

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveUpdateDaysEventImplCopyWith<_$ReceiveUpdateDaysEventImpl>
      get copyWith => __$$ReceiveUpdateDaysEventImplCopyWithImpl<
          _$ReceiveUpdateDaysEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)
        queryDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) {
    return receiveUpdate(days);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return receiveUpdate?.call(days);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryDays,
    TResult Function(List<Day> days)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (receiveUpdate != null) {
      return receiveUpdate(days);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryDaysEvent value) queryDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return receiveUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryDaysEvent value)? queryDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return receiveUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryDaysEvent value)? queryDays,
    TResult Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult Function(DaysErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (receiveUpdate != null) {
      return receiveUpdate(this);
    }
    return orElse();
  }
}

abstract class ReceiveUpdateDaysEvent extends DaysEvent {
  const factory ReceiveUpdateDaysEvent({required final List<Day> days}) =
      _$ReceiveUpdateDaysEventImpl;
  const ReceiveUpdateDaysEvent._() : super._();

  List<Day> get days;

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveUpdateDaysEventImplCopyWith<_$ReceiveUpdateDaysEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DaysErrorEventImplCopyWith<$Res> {
  factory _$$DaysErrorEventImplCopyWith(_$DaysErrorEventImpl value,
          $Res Function(_$DaysErrorEventImpl) then) =
      __$$DaysErrorEventImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DaysErrorEventImplCopyWithImpl<$Res>
    extends _$DaysEventCopyWithImpl<$Res, _$DaysErrorEventImpl>
    implements _$$DaysErrorEventImplCopyWith<$Res> {
  __$$DaysErrorEventImplCopyWithImpl(
      _$DaysErrorEventImpl _value, $Res Function(_$DaysErrorEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DaysErrorEventImpl extends DaysErrorEvent {
  const _$DaysErrorEventImpl() : super._();

  @override
  String toString() {
    return 'DaysEvent.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DaysErrorEventImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)
        queryDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String profileId, DateTime from, DateTime to, bool useStream)?
        queryDays,
    TResult Function(List<Day> days)? receiveUpdate,
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
    required TResult Function(QueryDaysEvent value) queryDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryDaysEvent value)? queryDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryDaysEvent value)? queryDays,
    TResult Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult Function(DaysErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DaysErrorEvent extends DaysEvent {
  const factory DaysErrorEvent() = _$DaysErrorEventImpl;
  const DaysErrorEvent._() : super._();
}

/// @nodoc
mixin _$DaysState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(DateTime from, DateTime to, List<Day> days,
            CalculatedStats calculatedStats)
        loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(DateTime from, DateTime to, List<Day> days,
            CalculatedStats calculatedStats)?
        loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(DateTime from, DateTime to, List<Day> days,
            CalculatedStats calculatedStats)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DaysLoadingState value) loading,
    required TResult Function(DaysLoadedState value) loaded,
    required TResult Function(DaysLoadingErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DaysLoadingState value)? loading,
    TResult? Function(DaysLoadedState value)? loaded,
    TResult? Function(DaysLoadingErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DaysLoadingState value)? loading,
    TResult Function(DaysLoadedState value)? loaded,
    TResult Function(DaysLoadingErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DaysStateCopyWith<$Res> {
  factory $DaysStateCopyWith(DaysState value, $Res Function(DaysState) then) =
      _$DaysStateCopyWithImpl<$Res, DaysState>;
}

/// @nodoc
class _$DaysStateCopyWithImpl<$Res, $Val extends DaysState>
    implements $DaysStateCopyWith<$Res> {
  _$DaysStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DaysLoadingStateImplCopyWith<$Res> {
  factory _$$DaysLoadingStateImplCopyWith(_$DaysLoadingStateImpl value,
          $Res Function(_$DaysLoadingStateImpl) then) =
      __$$DaysLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DaysLoadingStateImplCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$DaysLoadingStateImpl>
    implements _$$DaysLoadingStateImplCopyWith<$Res> {
  __$$DaysLoadingStateImplCopyWithImpl(_$DaysLoadingStateImpl _value,
      $Res Function(_$DaysLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DaysLoadingStateImpl implements DaysLoadingState {
  const _$DaysLoadingStateImpl();

  @override
  String toString() {
    return 'DaysState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DaysLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(DateTime from, DateTime to, List<Day> days,
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
    TResult? Function(DateTime from, DateTime to, List<Day> days,
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
    TResult Function(DateTime from, DateTime to, List<Day> days,
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
    required TResult Function(DaysLoadingState value) loading,
    required TResult Function(DaysLoadedState value) loaded,
    required TResult Function(DaysLoadingErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DaysLoadingState value)? loading,
    TResult? Function(DaysLoadedState value)? loaded,
    TResult? Function(DaysLoadingErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DaysLoadingState value)? loading,
    TResult Function(DaysLoadedState value)? loaded,
    TResult Function(DaysLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DaysLoadingState implements DaysState {
  const factory DaysLoadingState() = _$DaysLoadingStateImpl;
}

/// @nodoc
abstract class _$$DaysLoadedStateImplCopyWith<$Res> {
  factory _$$DaysLoadedStateImplCopyWith(_$DaysLoadedStateImpl value,
          $Res Function(_$DaysLoadedStateImpl) then) =
      __$$DaysLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      List<Day> days,
      CalculatedStats calculatedStats});

  $CalculatedStatsCopyWith<$Res> get calculatedStats;
}

/// @nodoc
class __$$DaysLoadedStateImplCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$DaysLoadedStateImpl>
    implements _$$DaysLoadedStateImplCopyWith<$Res> {
  __$$DaysLoadedStateImplCopyWithImpl(
      _$DaysLoadedStateImpl _value, $Res Function(_$DaysLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? days = null,
    Object? calculatedStats = null,
  }) {
    return _then(_$DaysLoadedStateImpl(
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      calculatedStats: null == calculatedStats
          ? _value.calculatedStats
          : calculatedStats // ignore: cast_nullable_to_non_nullable
              as CalculatedStats,
    ));
  }

  /// Create a copy of DaysState
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

class _$DaysLoadedStateImpl implements DaysLoadedState {
  const _$DaysLoadedStateImpl(
      {required this.from,
      required this.to,
      required final List<Day> days,
      required this.calculatedStats})
      : _days = days;

  @override
  final DateTime from;
  @override
  final DateTime to;
  final List<Day> _days;
  @override
  List<Day> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  final CalculatedStats calculatedStats;

  @override
  String toString() {
    return 'DaysState.loaded(from: $from, to: $to, days: $days, calculatedStats: $calculatedStats)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaysLoadedStateImpl &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.calculatedStats, calculatedStats) ||
                other.calculatedStats == calculatedStats));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to,
      const DeepCollectionEquality().hash(_days), calculatedStats);

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DaysLoadedStateImplCopyWith<_$DaysLoadedStateImpl> get copyWith =>
      __$$DaysLoadedStateImplCopyWithImpl<_$DaysLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(DateTime from, DateTime to, List<Day> days,
            CalculatedStats calculatedStats)
        loaded,
    required TResult Function() error,
  }) {
    return loaded(from, to, days, calculatedStats);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(DateTime from, DateTime to, List<Day> days,
            CalculatedStats calculatedStats)?
        loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(from, to, days, calculatedStats);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(DateTime from, DateTime to, List<Day> days,
            CalculatedStats calculatedStats)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(from, to, days, calculatedStats);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DaysLoadingState value) loading,
    required TResult Function(DaysLoadedState value) loaded,
    required TResult Function(DaysLoadingErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DaysLoadingState value)? loading,
    TResult? Function(DaysLoadedState value)? loaded,
    TResult? Function(DaysLoadingErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DaysLoadingState value)? loading,
    TResult Function(DaysLoadedState value)? loaded,
    TResult Function(DaysLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DaysLoadedState implements DaysState {
  const factory DaysLoadedState(
      {required final DateTime from,
      required final DateTime to,
      required final List<Day> days,
      required final CalculatedStats calculatedStats}) = _$DaysLoadedStateImpl;

  DateTime get from;
  DateTime get to;
  List<Day> get days;
  CalculatedStats get calculatedStats;

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DaysLoadedStateImplCopyWith<_$DaysLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DaysLoadingErrorStateImplCopyWith<$Res> {
  factory _$$DaysLoadingErrorStateImplCopyWith(
          _$DaysLoadingErrorStateImpl value,
          $Res Function(_$DaysLoadingErrorStateImpl) then) =
      __$$DaysLoadingErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DaysLoadingErrorStateImplCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$DaysLoadingErrorStateImpl>
    implements _$$DaysLoadingErrorStateImplCopyWith<$Res> {
  __$$DaysLoadingErrorStateImplCopyWithImpl(_$DaysLoadingErrorStateImpl _value,
      $Res Function(_$DaysLoadingErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DaysLoadingErrorStateImpl implements DaysLoadingErrorState {
  const _$DaysLoadingErrorStateImpl();

  @override
  String toString() {
    return 'DaysState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaysLoadingErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(DateTime from, DateTime to, List<Day> days,
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
    TResult? Function(DateTime from, DateTime to, List<Day> days,
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
    TResult Function(DateTime from, DateTime to, List<Day> days,
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
    required TResult Function(DaysLoadingState value) loading,
    required TResult Function(DaysLoadedState value) loaded,
    required TResult Function(DaysLoadingErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DaysLoadingState value)? loading,
    TResult? Function(DaysLoadedState value)? loaded,
    TResult? Function(DaysLoadingErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DaysLoadingState value)? loading,
    TResult Function(DaysLoadedState value)? loaded,
    TResult Function(DaysLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DaysLoadingErrorState implements DaysState {
  const factory DaysLoadingErrorState() = _$DaysLoadingErrorStateImpl;
}
