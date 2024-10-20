// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'months_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MonthEvent {
  String get profileId => throw _privateConstructorUsedError;
  DateTime get from => throw _privateConstructorUsedError;
  DateTime? get to => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String profileId, DateTime from, DateTime? to)
        getMonths,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, DateTime from, DateTime? to)? getMonths,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, DateTime from, DateTime? to)? getMonths,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMonthEvent value) getMonths,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMonthEvent value)? getMonths,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMonthEvent value)? getMonths,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MonthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthEventCopyWith<MonthEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthEventCopyWith<$Res> {
  factory $MonthEventCopyWith(
          MonthEvent value, $Res Function(MonthEvent) then) =
      _$MonthEventCopyWithImpl<$Res, MonthEvent>;
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class _$MonthEventCopyWithImpl<$Res, $Val extends MonthEvent>
    implements $MonthEventCopyWith<$Res> {
  _$MonthEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetMonthEventImplCopyWith<$Res>
    implements $MonthEventCopyWith<$Res> {
  factory _$$GetMonthEventImplCopyWith(
          _$GetMonthEventImpl value, $Res Function(_$GetMonthEventImpl) then) =
      __$$GetMonthEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class __$$GetMonthEventImplCopyWithImpl<$Res>
    extends _$MonthEventCopyWithImpl<$Res, _$GetMonthEventImpl>
    implements _$$GetMonthEventImplCopyWith<$Res> {
  __$$GetMonthEventImplCopyWithImpl(
      _$GetMonthEventImpl _value, $Res Function(_$GetMonthEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = freezed,
  }) {
    return _then(_$GetMonthEventImpl(
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
    ));
  }
}

/// @nodoc

class _$GetMonthEventImpl implements GetMonthEvent {
  const _$GetMonthEventImpl(
      {required this.profileId, required this.from, this.to});

  @override
  final String profileId;
  @override
  final DateTime from;
  @override
  final DateTime? to;

  @override
  String toString() {
    return 'MonthEvent.getMonths(profileId: $profileId, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMonthEventImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to);

  /// Create a copy of MonthEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMonthEventImplCopyWith<_$GetMonthEventImpl> get copyWith =>
      __$$GetMonthEventImplCopyWithImpl<_$GetMonthEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String profileId, DateTime from, DateTime? to)
        getMonths,
  }) {
    return getMonths(profileId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, DateTime from, DateTime? to)? getMonths,
  }) {
    return getMonths?.call(profileId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, DateTime from, DateTime? to)? getMonths,
    required TResult orElse(),
  }) {
    if (getMonths != null) {
      return getMonths(profileId, from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetMonthEvent value) getMonths,
  }) {
    return getMonths(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetMonthEvent value)? getMonths,
  }) {
    return getMonths?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetMonthEvent value)? getMonths,
    required TResult orElse(),
  }) {
    if (getMonths != null) {
      return getMonths(this);
    }
    return orElse();
  }
}

abstract class GetMonthEvent implements MonthEvent {
  const factory GetMonthEvent(
      {required final String profileId,
      required final DateTime from,
      final DateTime? to}) = _$GetMonthEventImpl;

  @override
  String get profileId;
  @override
  DateTime get from;
  @override
  DateTime? get to;

  /// Create a copy of MonthEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetMonthEventImplCopyWith<_$GetMonthEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Month> months) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Month> months)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Month> months)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MonthLoading value) loading,
    required TResult Function(MonthLoaded value) loaded,
    required TResult Function(MonthLoadingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonthLoading value)? loading,
    TResult? Function(MonthLoaded value)? loaded,
    TResult? Function(MonthLoadingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonthLoading value)? loading,
    TResult Function(MonthLoaded value)? loaded,
    TResult Function(MonthLoadingError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthStateCopyWith<$Res> {
  factory $MonthStateCopyWith(
          MonthState value, $Res Function(MonthState) then) =
      _$MonthStateCopyWithImpl<$Res, MonthState>;
}

/// @nodoc
class _$MonthStateCopyWithImpl<$Res, $Val extends MonthState>
    implements $MonthStateCopyWith<$Res> {
  _$MonthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MonthLoadingImplCopyWith<$Res> {
  factory _$$MonthLoadingImplCopyWith(
          _$MonthLoadingImpl value, $Res Function(_$MonthLoadingImpl) then) =
      __$$MonthLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MonthLoadingImplCopyWithImpl<$Res>
    extends _$MonthStateCopyWithImpl<$Res, _$MonthLoadingImpl>
    implements _$$MonthLoadingImplCopyWith<$Res> {
  __$$MonthLoadingImplCopyWithImpl(
      _$MonthLoadingImpl _value, $Res Function(_$MonthLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MonthLoadingImpl implements MonthLoading {
  const _$MonthLoadingImpl();

  @override
  String toString() {
    return 'MonthState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MonthLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Month> months) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Month> months)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Month> months)? loaded,
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
    required TResult Function(MonthLoading value) loading,
    required TResult Function(MonthLoaded value) loaded,
    required TResult Function(MonthLoadingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonthLoading value)? loading,
    TResult? Function(MonthLoaded value)? loaded,
    TResult? Function(MonthLoadingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonthLoading value)? loading,
    TResult Function(MonthLoaded value)? loaded,
    TResult Function(MonthLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MonthLoading implements MonthState {
  const factory MonthLoading() = _$MonthLoadingImpl;
}

/// @nodoc
abstract class _$$MonthLoadedImplCopyWith<$Res> {
  factory _$$MonthLoadedImplCopyWith(
          _$MonthLoadedImpl value, $Res Function(_$MonthLoadedImpl) then) =
      __$$MonthLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Month> months});
}

/// @nodoc
class __$$MonthLoadedImplCopyWithImpl<$Res>
    extends _$MonthStateCopyWithImpl<$Res, _$MonthLoadedImpl>
    implements _$$MonthLoadedImplCopyWith<$Res> {
  __$$MonthLoadedImplCopyWithImpl(
      _$MonthLoadedImpl _value, $Res Function(_$MonthLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = null,
  }) {
    return _then(_$MonthLoadedImpl(
      months: null == months
          ? _value._months
          : months // ignore: cast_nullable_to_non_nullable
              as List<Month>,
    ));
  }
}

/// @nodoc

class _$MonthLoadedImpl implements MonthLoaded {
  const _$MonthLoadedImpl({required final List<Month> months})
      : _months = months;

  final List<Month> _months;
  @override
  List<Month> get months {
    if (_months is EqualUnmodifiableListView) return _months;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_months);
  }

  @override
  String toString() {
    return 'MonthState.loaded(months: $months)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthLoadedImpl &&
            const DeepCollectionEquality().equals(other._months, _months));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_months));

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthLoadedImplCopyWith<_$MonthLoadedImpl> get copyWith =>
      __$$MonthLoadedImplCopyWithImpl<_$MonthLoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Month> months) loaded,
    required TResult Function() error,
  }) {
    return loaded(months);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Month> months)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(months);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Month> months)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(months);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(MonthLoading value) loading,
    required TResult Function(MonthLoaded value) loaded,
    required TResult Function(MonthLoadingError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonthLoading value)? loading,
    TResult? Function(MonthLoaded value)? loaded,
    TResult? Function(MonthLoadingError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonthLoading value)? loading,
    TResult Function(MonthLoaded value)? loaded,
    TResult Function(MonthLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MonthLoaded implements MonthState {
  const factory MonthLoaded({required final List<Month> months}) =
      _$MonthLoadedImpl;

  List<Month> get months;

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthLoadedImplCopyWith<_$MonthLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MonthLoadingErrorImplCopyWith<$Res> {
  factory _$$MonthLoadingErrorImplCopyWith(_$MonthLoadingErrorImpl value,
          $Res Function(_$MonthLoadingErrorImpl) then) =
      __$$MonthLoadingErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MonthLoadingErrorImplCopyWithImpl<$Res>
    extends _$MonthStateCopyWithImpl<$Res, _$MonthLoadingErrorImpl>
    implements _$$MonthLoadingErrorImplCopyWith<$Res> {
  __$$MonthLoadingErrorImplCopyWithImpl(_$MonthLoadingErrorImpl _value,
      $Res Function(_$MonthLoadingErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MonthLoadingErrorImpl implements MonthLoadingError {
  const _$MonthLoadingErrorImpl();

  @override
  String toString() {
    return 'MonthState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MonthLoadingErrorImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Month> months) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Month> months)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Month> months)? loaded,
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
    required TResult Function(MonthLoading value) loading,
    required TResult Function(MonthLoaded value) loaded,
    required TResult Function(MonthLoadingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonthLoading value)? loading,
    TResult? Function(MonthLoaded value)? loaded,
    TResult? Function(MonthLoadingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonthLoading value)? loading,
    TResult Function(MonthLoaded value)? loaded,
    TResult Function(MonthLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MonthLoadingError implements MonthState {
  const factory MonthLoadingError() = _$MonthLoadingErrorImpl;
}
