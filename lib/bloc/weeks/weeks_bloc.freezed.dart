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
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        queryWeeks,
    required TResult Function(List<Week> weeks) receiveUpdate,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryWeeks,
    TResult? Function(List<Week> weeks)? receiveUpdate,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryWeeks,
    TResult Function(List<Week> weeks)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetWeeksEvent value) queryWeeks,
    required TResult Function(ReceiveUpdateWeeksEvent value) receiveUpdate,
    required TResult Function(WeeksErrorEvent value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetWeeksEvent value)? queryWeeks,
    TResult? Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult? Function(WeeksErrorEvent value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$WeeksEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'WeeksEvent.started()';
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
        queryWeeks,
    required TResult Function(List<Week> weeks) receiveUpdate,
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
        queryWeeks,
    TResult? Function(List<Week> weeks)? receiveUpdate,
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
        queryWeeks,
    TResult Function(List<Week> weeks)? receiveUpdate,
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
    required TResult Function(GetWeeksEvent value) queryWeeks,
    required TResult Function(ReceiveUpdateWeeksEvent value) receiveUpdate,
    required TResult Function(WeeksErrorEvent value) error,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetWeeksEvent value)? queryWeeks,
    TResult? Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult? Function(WeeksErrorEvent value)? error,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetWeeksEvent value)? queryWeeks,
    TResult Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult Function(WeeksErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements WeeksEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetWeeksEventImplCopyWith<$Res> {
  factory _$$GetWeeksEventImplCopyWith(
          _$GetWeeksEventImpl value, $Res Function(_$GetWeeksEventImpl) then) =
      __$$GetWeeksEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to, bool useStream});
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
    Object? to = freezed,
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

class _$GetWeeksEventImpl implements GetWeeksEvent {
  const _$GetWeeksEventImpl(
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
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        queryWeeks,
    required TResult Function(List<Week> weeks) receiveUpdate,
    required TResult Function() error,
  }) {
    return queryWeeks(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryWeeks,
    TResult? Function(List<Week> weeks)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return queryWeeks?.call(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
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
    required TResult Function(_Started value) started,
    required TResult Function(GetWeeksEvent value) queryWeeks,
    required TResult Function(ReceiveUpdateWeeksEvent value) receiveUpdate,
    required TResult Function(WeeksErrorEvent value) error,
  }) {
    return queryWeeks(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetWeeksEvent value)? queryWeeks,
    TResult? Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult? Function(WeeksErrorEvent value)? error,
  }) {
    return queryWeeks?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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

abstract class GetWeeksEvent implements WeeksEvent {
  const factory GetWeeksEvent(
      {required final String profileId,
      required final DateTime from,
      final DateTime? to,
      final bool useStream}) = _$GetWeeksEventImpl;

  String get profileId;
  DateTime get from;
  DateTime? get to;
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

class _$ReceiveUpdateWeeksEventImpl implements ReceiveUpdateWeeksEvent {
  const _$ReceiveUpdateWeeksEventImpl({required final List<Week> weeks})
      : _weeks = weeks;

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
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        queryWeeks,
    required TResult Function(List<Week> weeks) receiveUpdate,
    required TResult Function() error,
  }) {
    return receiveUpdate(weeks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        queryWeeks,
    TResult? Function(List<Week> weeks)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return receiveUpdate?.call(weeks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
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
    required TResult Function(_Started value) started,
    required TResult Function(GetWeeksEvent value) queryWeeks,
    required TResult Function(ReceiveUpdateWeeksEvent value) receiveUpdate,
    required TResult Function(WeeksErrorEvent value) error,
  }) {
    return receiveUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetWeeksEvent value)? queryWeeks,
    TResult? Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult? Function(WeeksErrorEvent value)? error,
  }) {
    return receiveUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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

abstract class ReceiveUpdateWeeksEvent implements WeeksEvent {
  const factory ReceiveUpdateWeeksEvent({required final List<Week> weeks}) =
      _$ReceiveUpdateWeeksEventImpl;

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

class _$WeeksErrorEventImpl implements WeeksErrorEvent {
  const _$WeeksErrorEventImpl();

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
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        queryWeeks,
    required TResult Function(List<Week> weeks) receiveUpdate,
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
        queryWeeks,
    TResult? Function(List<Week> weeks)? receiveUpdate,
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
    required TResult Function(_Started value) started,
    required TResult Function(GetWeeksEvent value) queryWeeks,
    required TResult Function(ReceiveUpdateWeeksEvent value) receiveUpdate,
    required TResult Function(WeeksErrorEvent value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetWeeksEvent value)? queryWeeks,
    TResult? Function(ReceiveUpdateWeeksEvent value)? receiveUpdate,
    TResult? Function(WeeksErrorEvent value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
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

abstract class WeeksErrorEvent implements WeeksEvent {
  const factory WeeksErrorEvent() = _$WeeksErrorEventImpl;
}

/// @nodoc
mixin _$WeeksState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Week> weeks) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Week> weeks)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Week> weeks)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeeksLoading value) loading,
    required TResult Function(WeeksLoaded value) loaded,
    required TResult Function(WeeksLoadingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeeksLoading value)? loading,
    TResult? Function(WeeksLoaded value)? loaded,
    TResult? Function(WeeksLoadingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeeksLoading value)? loading,
    TResult Function(WeeksLoaded value)? loaded,
    TResult Function(WeeksLoadingError value)? error,
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
abstract class _$$WeeksLoadingImplCopyWith<$Res> {
  factory _$$WeeksLoadingImplCopyWith(
          _$WeeksLoadingImpl value, $Res Function(_$WeeksLoadingImpl) then) =
      __$$WeeksLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeeksLoadingImplCopyWithImpl<$Res>
    extends _$WeeksStateCopyWithImpl<$Res, _$WeeksLoadingImpl>
    implements _$$WeeksLoadingImplCopyWith<$Res> {
  __$$WeeksLoadingImplCopyWithImpl(
      _$WeeksLoadingImpl _value, $Res Function(_$WeeksLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WeeksLoadingImpl implements WeeksLoading {
  const _$WeeksLoadingImpl();

  @override
  String toString() {
    return 'WeeksState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeeksLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Week> weeks) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Week> weeks)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Week> weeks)? loaded,
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
    required TResult Function(WeeksLoading value) loading,
    required TResult Function(WeeksLoaded value) loaded,
    required TResult Function(WeeksLoadingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeeksLoading value)? loading,
    TResult? Function(WeeksLoaded value)? loaded,
    TResult? Function(WeeksLoadingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeeksLoading value)? loading,
    TResult Function(WeeksLoaded value)? loaded,
    TResult Function(WeeksLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class WeeksLoading implements WeeksState {
  const factory WeeksLoading() = _$WeeksLoadingImpl;
}

/// @nodoc
abstract class _$$WeeksLoadedImplCopyWith<$Res> {
  factory _$$WeeksLoadedImplCopyWith(
          _$WeeksLoadedImpl value, $Res Function(_$WeeksLoadedImpl) then) =
      __$$WeeksLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Week> weeks});
}

/// @nodoc
class __$$WeeksLoadedImplCopyWithImpl<$Res>
    extends _$WeeksStateCopyWithImpl<$Res, _$WeeksLoadedImpl>
    implements _$$WeeksLoadedImplCopyWith<$Res> {
  __$$WeeksLoadedImplCopyWithImpl(
      _$WeeksLoadedImpl _value, $Res Function(_$WeeksLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weeks = null,
  }) {
    return _then(_$WeeksLoadedImpl(
      weeks: null == weeks
          ? _value._weeks
          : weeks // ignore: cast_nullable_to_non_nullable
              as List<Week>,
    ));
  }
}

/// @nodoc

class _$WeeksLoadedImpl implements WeeksLoaded {
  const _$WeeksLoadedImpl({required final List<Week> weeks}) : _weeks = weeks;

  final List<Week> _weeks;
  @override
  List<Week> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  @override
  String toString() {
    return 'WeeksState.loaded(weeks: $weeks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WeeksLoadedImpl &&
            const DeepCollectionEquality().equals(other._weeks, _weeks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_weeks));

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WeeksLoadedImplCopyWith<_$WeeksLoadedImpl> get copyWith =>
      __$$WeeksLoadedImplCopyWithImpl<_$WeeksLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Week> weeks) loaded,
    required TResult Function() error,
  }) {
    return loaded(weeks);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Week> weeks)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(weeks);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Week> weeks)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(weeks);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WeeksLoading value) loading,
    required TResult Function(WeeksLoaded value) loaded,
    required TResult Function(WeeksLoadingError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeeksLoading value)? loading,
    TResult? Function(WeeksLoaded value)? loaded,
    TResult? Function(WeeksLoadingError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeeksLoading value)? loading,
    TResult Function(WeeksLoaded value)? loaded,
    TResult Function(WeeksLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class WeeksLoaded implements WeeksState {
  const factory WeeksLoaded({required final List<Week> weeks}) =
      _$WeeksLoadedImpl;

  List<Week> get weeks;

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WeeksLoadedImplCopyWith<_$WeeksLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WeeksLoadingErrorImplCopyWith<$Res> {
  factory _$$WeeksLoadingErrorImplCopyWith(_$WeeksLoadingErrorImpl value,
          $Res Function(_$WeeksLoadingErrorImpl) then) =
      __$$WeeksLoadingErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WeeksLoadingErrorImplCopyWithImpl<$Res>
    extends _$WeeksStateCopyWithImpl<$Res, _$WeeksLoadingErrorImpl>
    implements _$$WeeksLoadingErrorImplCopyWith<$Res> {
  __$$WeeksLoadingErrorImplCopyWithImpl(_$WeeksLoadingErrorImpl _value,
      $Res Function(_$WeeksLoadingErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$WeeksLoadingErrorImpl implements WeeksLoadingError {
  const _$WeeksLoadingErrorImpl();

  @override
  String toString() {
    return 'WeeksState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$WeeksLoadingErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Week> weeks) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Week> weeks)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Week> weeks)? loaded,
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
    required TResult Function(WeeksLoading value) loading,
    required TResult Function(WeeksLoaded value) loaded,
    required TResult Function(WeeksLoadingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WeeksLoading value)? loading,
    TResult? Function(WeeksLoaded value)? loaded,
    TResult? Function(WeeksLoadingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WeeksLoading value)? loading,
    TResult Function(WeeksLoaded value)? loaded,
    TResult Function(WeeksLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class WeeksLoadingError implements WeeksState {
  const factory WeeksLoadingError() = _$WeeksLoadingErrorImpl;
}
