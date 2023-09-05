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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$DaysEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        getDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        getDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        getDays,
    TResult Function(List<Day> days)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetDaysEvent value) getDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetDaysEvent value)? getDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetDaysEvent value)? getDays,
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
}

/// @nodoc
abstract class _$$_StartedCopyWith<$Res> {
  factory _$$_StartedCopyWith(
          _$_Started value, $Res Function(_$_Started) then) =
      __$$_StartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_StartedCopyWithImpl<$Res>
    extends _$DaysEventCopyWithImpl<$Res, _$_Started>
    implements _$$_StartedCopyWith<$Res> {
  __$$_StartedCopyWithImpl(_$_Started _value, $Res Function(_$_Started) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'DaysEvent.started()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        getDays,
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
        getDays,
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
        getDays,
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
    required TResult Function(GetDaysEvent value) getDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetDaysEvent value)? getDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetDaysEvent value)? getDays,
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
  const factory _Started() = _$_Started;
}

/// @nodoc
abstract class _$$GetDaysEventCopyWith<$Res> {
  factory _$$GetDaysEventCopyWith(
          _$GetDaysEvent value, $Res Function(_$GetDaysEvent) then) =
      __$$GetDaysEventCopyWithImpl<$Res>;
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to, bool useStream});
}

/// @nodoc
class __$$GetDaysEventCopyWithImpl<$Res>
    extends _$DaysEventCopyWithImpl<$Res, _$GetDaysEvent>
    implements _$$GetDaysEventCopyWith<$Res> {
  __$$GetDaysEventCopyWithImpl(
      _$GetDaysEvent _value, $Res Function(_$GetDaysEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = freezed,
    Object? useStream = null,
  }) {
    return _then(_$GetDaysEvent(
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

class _$GetDaysEvent implements GetDaysEvent {
  const _$GetDaysEvent(
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
    return 'DaysEvent.getDays(profileId: $profileId, from: $from, to: $to, useStream: $useStream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDaysEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.useStream, useStream) ||
                other.useStream == useStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to, useStream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDaysEventCopyWith<_$GetDaysEvent> get copyWith =>
      __$$GetDaysEventCopyWithImpl<_$GetDaysEvent>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        getDays,
    required TResult Function(List<Day> days) receiveUpdate,
    required TResult Function() error,
  }) {
    return getDays(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        getDays,
    TResult? Function(List<Day> days)? receiveUpdate,
    TResult? Function()? error,
  }) {
    return getDays?.call(profileId, from, to, useStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)?
        getDays,
    TResult Function(List<Day> days)? receiveUpdate,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (getDays != null) {
      return getDays(profileId, from, to, useStream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetDaysEvent value) getDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return getDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetDaysEvent value)? getDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return getDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetDaysEvent value)? getDays,
    TResult Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult Function(DaysErrorEvent value)? error,
    required TResult orElse(),
  }) {
    if (getDays != null) {
      return getDays(this);
    }
    return orElse();
  }
}

abstract class GetDaysEvent implements DaysEvent {
  const factory GetDaysEvent(
      {required final String profileId,
      required final DateTime from,
      final DateTime? to,
      final bool useStream}) = _$GetDaysEvent;

  String get profileId;
  DateTime get from;
  DateTime? get to;
  bool get useStream;
  @JsonKey(ignore: true)
  _$$GetDaysEventCopyWith<_$GetDaysEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveUpdateDaysEventCopyWith<$Res> {
  factory _$$ReceiveUpdateDaysEventCopyWith(_$ReceiveUpdateDaysEvent value,
          $Res Function(_$ReceiveUpdateDaysEvent) then) =
      __$$ReceiveUpdateDaysEventCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Day> days});
}

/// @nodoc
class __$$ReceiveUpdateDaysEventCopyWithImpl<$Res>
    extends _$DaysEventCopyWithImpl<$Res, _$ReceiveUpdateDaysEvent>
    implements _$$ReceiveUpdateDaysEventCopyWith<$Res> {
  __$$ReceiveUpdateDaysEventCopyWithImpl(_$ReceiveUpdateDaysEvent _value,
      $Res Function(_$ReceiveUpdateDaysEvent) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
  }) {
    return _then(_$ReceiveUpdateDaysEvent(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc

class _$ReceiveUpdateDaysEvent implements ReceiveUpdateDaysEvent {
  const _$ReceiveUpdateDaysEvent({required final List<Day> days})
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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveUpdateDaysEvent &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_days));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveUpdateDaysEventCopyWith<_$ReceiveUpdateDaysEvent> get copyWith =>
      __$$ReceiveUpdateDaysEventCopyWithImpl<_$ReceiveUpdateDaysEvent>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        getDays,
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
        getDays,
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
        getDays,
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
    required TResult Function(GetDaysEvent value) getDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return receiveUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetDaysEvent value)? getDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return receiveUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetDaysEvent value)? getDays,
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
      _$ReceiveUpdateDaysEvent;

  List<Day> get days;
  @JsonKey(ignore: true)
  _$$ReceiveUpdateDaysEventCopyWith<_$ReceiveUpdateDaysEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DaysErrorEventCopyWith<$Res> {
  factory _$$DaysErrorEventCopyWith(
          _$DaysErrorEvent value, $Res Function(_$DaysErrorEvent) then) =
      __$$DaysErrorEventCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DaysErrorEventCopyWithImpl<$Res>
    extends _$DaysEventCopyWithImpl<$Res, _$DaysErrorEvent>
    implements _$$DaysErrorEventCopyWith<$Res> {
  __$$DaysErrorEventCopyWithImpl(
      _$DaysErrorEvent _value, $Res Function(_$DaysErrorEvent) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DaysErrorEvent implements DaysErrorEvent {
  const _$DaysErrorEvent();

  @override
  String toString() {
    return 'DaysEvent.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DaysErrorEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(
            String profileId, DateTime from, DateTime? to, bool useStream)
        getDays,
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
        getDays,
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
        getDays,
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
    required TResult Function(GetDaysEvent value) getDays,
    required TResult Function(ReceiveUpdateDaysEvent value) receiveUpdate,
    required TResult Function(DaysErrorEvent value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetDaysEvent value)? getDays,
    TResult? Function(ReceiveUpdateDaysEvent value)? receiveUpdate,
    TResult? Function(DaysErrorEvent value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetDaysEvent value)? getDays,
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
  const factory DaysErrorEvent() = _$DaysErrorEvent;
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
}

/// @nodoc
abstract class _$$DaysLoadingCopyWith<$Res> {
  factory _$$DaysLoadingCopyWith(
          _$DaysLoading value, $Res Function(_$DaysLoading) then) =
      __$$DaysLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DaysLoadingCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$DaysLoading>
    implements _$$DaysLoadingCopyWith<$Res> {
  __$$DaysLoadingCopyWithImpl(
      _$DaysLoading _value, $Res Function(_$DaysLoading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DaysLoading implements DaysLoading {
  const _$DaysLoading();

  @override
  String toString() {
    return 'DaysState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DaysLoading);
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
  const factory DaysLoading() = _$DaysLoading;
}

/// @nodoc
abstract class _$$DaysLoadedCopyWith<$Res> {
  factory _$$DaysLoadedCopyWith(
          _$DaysLoaded value, $Res Function(_$DaysLoaded) then) =
      __$$DaysLoadedCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Day> days});
}

/// @nodoc
class __$$DaysLoadedCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$DaysLoaded>
    implements _$$DaysLoadedCopyWith<$Res> {
  __$$DaysLoadedCopyWithImpl(
      _$DaysLoaded _value, $Res Function(_$DaysLoaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? days = null,
  }) {
    return _then(_$DaysLoaded(
      days: null == days
          ? _value._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc

class _$DaysLoaded implements DaysLoaded {
  const _$DaysLoaded({required final List<Day> days}) : _days = days;

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
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DaysLoaded &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_days));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DaysLoadedCopyWith<_$DaysLoaded> get copyWith =>
      __$$DaysLoadedCopyWithImpl<_$DaysLoaded>(this, _$identity);

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
  const factory DaysLoaded({required final List<Day> days}) = _$DaysLoaded;

  List<Day> get days;
  @JsonKey(ignore: true)
  _$$DaysLoadedCopyWith<_$DaysLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DaysLoadingErrorCopyWith<$Res> {
  factory _$$DaysLoadingErrorCopyWith(
          _$DaysLoadingError value, $Res Function(_$DaysLoadingError) then) =
      __$$DaysLoadingErrorCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DaysLoadingErrorCopyWithImpl<$Res>
    extends _$DaysStateCopyWithImpl<$Res, _$DaysLoadingError>
    implements _$$DaysLoadingErrorCopyWith<$Res> {
  __$$DaysLoadingErrorCopyWithImpl(
      _$DaysLoadingError _value, $Res Function(_$DaysLoadingError) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DaysLoadingError implements DaysLoadingError {
  const _$DaysLoadingError();

  @override
  String toString() {
    return 'DaysState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DaysLoadingError);
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
  const factory DaysLoadingError() = _$DaysLoadingError;
}
