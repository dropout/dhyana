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
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        queryDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryDays,
    TResult Function(List<Day> days)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(QueryDaysEvent value) queryDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(QueryDaysEvent value)? queryDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$DaysEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'DaysEvent.started()';
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
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        queryDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryDays,
    TResult Function(List<Day> days)? receiveUpdate,
    TResult Function()? error,
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
    required TResult Function(QueryDaysEvent value) queryDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(QueryDaysEvent value)? queryDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(QueryDaysEvent value)? queryDays,
    TResult Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult Function(DaysErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements DaysEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$QueryDaysEventImplCopyWith<$Res> {
  factory _$$QueryDaysEventImplCopyWith(_$QueryDaysEventImpl value,
          $Res Function(_$QueryDaysEventImpl) then) =
      __$$QueryDaysEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to, bool useStream});
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
    Object? to = freezed,
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
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      useStream: null == useStream
          ? _value.useStream
          : useStream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$QueryDaysEventImpl implements QueryDaysEvent {
  const _$QueryDaysEventImpl(
      {required this.profileId,
      required this.from,
      this.to,
      this.useStream = false});

  @override
  final String profileId;
  @override
  final DateTime from;
  @override
  final DateTime? to;
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
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        queryDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) {
    return queryDays(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return queryDays?.call(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
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
    required TResult Function(_Started value) started,
    required TResult Function(QueryDaysEvent value) queryDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return queryDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(QueryDaysEvent value)? queryDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return queryDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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

abstract class QueryDaysEvent implements DaysEvent {
  const factory QueryDaysEvent(
      {required final String profileId,
      required final DateTime from,
      final DateTime? to,
      final bool useStream}) = _$QueryDaysEventImpl;

  String get profileId;
  DateTime get from;
  DateTime? get to;
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

class _$ReceiveUpdateDaysEventImpl implements ReceiveUpdateDaysEvent {
  const _$ReceiveUpdateDaysEventImpl({required final List<Day> days})
      : _days = days;

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
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        queryDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) {
    return receiveUpdate(days);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return receiveUpdate?.call(days);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
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
    required TResult Function(_Started value) started,
    required TResult Function(QueryDaysEvent value) queryDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return receiveUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(QueryDaysEvent value)? queryDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return receiveUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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

abstract class ReceiveUpdateDaysEvent implements DaysEvent {
  const factory ReceiveUpdateDaysEvent({required final List<Day> days}) =
      _$ReceiveUpdateDaysEventImpl;

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

class _$DaysErrorEventImpl implements DaysErrorEvent {
  const _$DaysErrorEventImpl();

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
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        queryDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
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
    required TResult Function(_Started value) started,
    required TResult Function(QueryDaysEvent value) queryDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(QueryDaysEvent value)? queryDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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

abstract class DaysErrorEvent implements DaysEvent {
  const factory DaysErrorEvent() = _$DaysErrorEventImpl;
}

/// @nodoc
mixin _$DaysState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Day> days) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Day> days)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Day> days)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DaysLoading value) loading,
    required TResult Function(DaysLoaded value) loaded,
    required TResult Function(DaysLoadingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DaysLoading value)? loading,
    TResult? Function(DaysLoaded value)? loaded,
    TResult? Function(DaysLoadingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DaysLoading value)? loading,
    TResult Function(DaysLoaded value)? loaded,
    TResult Function(DaysLoadingError value)? error,
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
abstract class _$$DaysLoadingImplCopyWith<$Res> {
  factory _$$DaysLoadingImplCopyWith(
          _$DaysLoadingImpl value, $Res Function(_$DaysLoadingImpl) then) =
      __$$DaysLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DaysLoadingImplCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$DaysLoadingImpl>
    implements _$$DaysLoadingImplCopyWith<$Res> {
  __$$DaysLoadingImplCopyWithImpl(
      _$DaysLoadingImpl _value, $Res Function(_$DaysLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DaysLoadingImpl implements DaysLoading {
  const _$DaysLoadingImpl();

  @override
  String toString() {
    return 'DaysState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DaysLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Day> days) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Day> days)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Day> days)? loaded,
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
    required TResult Function(DaysLoading value) loading,
    required TResult Function(DaysLoaded value) loaded,
    required TResult Function(DaysLoadingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DaysLoading value)? loading,
    TResult? Function(DaysLoaded value)? loaded,
    TResult? Function(DaysLoadingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DaysLoading value)? loading,
    TResult Function(DaysLoaded value)? loaded,
    TResult Function(DaysLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DaysLoading implements DaysState {
  const factory DaysLoading() = _$DaysLoadingImpl;
}

/// @nodoc
abstract class _$$DaysLoadedImplCopyWith<$Res> {
  factory _$$DaysLoadedImplCopyWith(
          _$DaysLoadedImpl value, $Res Function(_$DaysLoadedImpl) then) =
      __$$DaysLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Day> days});
}

/// @nodoc
class __$$DaysLoadedImplCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$DaysLoadedImpl>
    implements _$$DaysLoadedImplCopyWith<$Res> {
  __$$DaysLoadedImplCopyWithImpl(
      _$DaysLoadedImpl _value, $Res Function(_$DaysLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
  }) {
    return _then(_$DaysLoadedImpl(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc

class _$DaysLoadedImpl implements DaysLoaded {
  const _$DaysLoadedImpl({required final List<Day> days}) : _days = days;

  final List<Day> _days;
  @override
  List<Day> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  @override
  String toString() {
    return 'DaysState.loaded(days: $days)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaysLoadedImpl &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_days));

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DaysLoadedImplCopyWith<_$DaysLoadedImpl> get copyWith =>
      __$$DaysLoadedImplCopyWithImpl<_$DaysLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Day> days) loaded,
    required TResult Function() error,
  }) {
    return loaded(days);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Day> days)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(days);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Day> days)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(days);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DaysLoading value) loading,
    required TResult Function(DaysLoaded value) loaded,
    required TResult Function(DaysLoadingError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DaysLoading value)? loading,
    TResult? Function(DaysLoaded value)? loaded,
    TResult? Function(DaysLoadingError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DaysLoading value)? loading,
    TResult Function(DaysLoaded value)? loaded,
    TResult Function(DaysLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DaysLoaded implements DaysState {
  const factory DaysLoaded({required final List<Day> days}) = _$DaysLoadedImpl;

  List<Day> get days;

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DaysLoadedImplCopyWith<_$DaysLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DaysLoadingErrorImplCopyWith<$Res> {
  factory _$$DaysLoadingErrorImplCopyWith(_$DaysLoadingErrorImpl value,
          $Res Function(_$DaysLoadingErrorImpl) then) =
      __$$DaysLoadingErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DaysLoadingErrorImplCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$DaysLoadingErrorImpl>
    implements _$$DaysLoadingErrorImplCopyWith<$Res> {
  __$$DaysLoadingErrorImplCopyWithImpl(_$DaysLoadingErrorImpl _value,
      $Res Function(_$DaysLoadingErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DaysLoadingErrorImpl implements DaysLoadingError {
  const _$DaysLoadingErrorImpl();

  @override
  String toString() {
    return 'DaysState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DaysLoadingErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Day> days) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Day> days)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Day> days)? loaded,
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
    required TResult Function(DaysLoading value) loading,
    required TResult Function(DaysLoaded value) loaded,
    required TResult Function(DaysLoadingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DaysLoading value)? loading,
    TResult? Function(DaysLoaded value)? loaded,
    TResult? Function(DaysLoadingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DaysLoading value)? loading,
    TResult Function(DaysLoaded value)? loaded,
    TResult Function(DaysLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DaysLoadingError implements DaysState {
  const factory DaysLoadingError() = _$DaysLoadingErrorImpl;
}
