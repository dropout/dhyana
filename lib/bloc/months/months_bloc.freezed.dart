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
mixin _$MonthsEvent {
  String get profileId => throw _privateConstructorUsedError;
  DateTime get from => throw _privateConstructorUsedError;
  DateTime? get to => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String profileId, DateTime from, DateTime? to)
        queryMonths,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, DateTime from, DateTime? to)?
        queryMonths,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, DateTime from, DateTime? to)?
        queryMonths,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryMonthsEvent value) queryMonths,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryMonthsEvent value)? queryMonths,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryMonthsEvent value)? queryMonths,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of MonthsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthsEventCopyWith<MonthsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthsEventCopyWith<$Res> {
  factory $MonthsEventCopyWith(
          MonthsEvent value, $Res Function(MonthsEvent) then) =
      _$MonthsEventCopyWithImpl<$Res, MonthsEvent>;
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class _$MonthsEventCopyWithImpl<$Res, $Val extends MonthsEvent>
    implements $MonthsEventCopyWith<$Res> {
  _$MonthsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthsEvent
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
abstract class _$$QueryMonthsEventImplCopyWith<$Res>
    implements $MonthsEventCopyWith<$Res> {
  factory _$$QueryMonthsEventImplCopyWith(_$QueryMonthsEventImpl value,
          $Res Function(_$QueryMonthsEventImpl) then) =
      __$$QueryMonthsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class __$$QueryMonthsEventImplCopyWithImpl<$Res>
    extends _$MonthsEventCopyWithImpl<$Res, _$QueryMonthsEventImpl>
    implements _$$QueryMonthsEventImplCopyWith<$Res> {
  __$$QueryMonthsEventImplCopyWithImpl(_$QueryMonthsEventImpl _value,
      $Res Function(_$QueryMonthsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = freezed,
  }) {
    return _then(_$QueryMonthsEventImpl(
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

class _$QueryMonthsEventImpl implements QueryMonthsEvent {
  const _$QueryMonthsEventImpl(
      {required this.profileId, required this.from, this.to});

  @override
  final String profileId;
  @override
  final DateTime from;
  @override
  final DateTime? to;

  @override
  String toString() {
    return 'MonthsEvent.queryMonths(profileId: $profileId, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryMonthsEventImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to);

  /// Create a copy of MonthsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryMonthsEventImplCopyWith<_$QueryMonthsEventImpl> get copyWith =>
      __$$QueryMonthsEventImplCopyWithImpl<_$QueryMonthsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String profileId, DateTime from, DateTime? to)
        queryMonths,
  }) {
    return queryMonths(profileId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, DateTime from, DateTime? to)?
        queryMonths,
  }) {
    return queryMonths?.call(profileId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, DateTime from, DateTime? to)?
        queryMonths,
    required TResult orElse(),
  }) {
    if (queryMonths != null) {
      return queryMonths(profileId, from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryMonthsEvent value) queryMonths,
  }) {
    return queryMonths(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryMonthsEvent value)? queryMonths,
  }) {
    return queryMonths?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryMonthsEvent value)? queryMonths,
    required TResult orElse(),
  }) {
    if (queryMonths != null) {
      return queryMonths(this);
    }
    return orElse();
  }
}

abstract class QueryMonthsEvent implements MonthsEvent {
  const factory QueryMonthsEvent(
      {required final String profileId,
      required final DateTime from,
      final DateTime? to}) = _$QueryMonthsEventImpl;

  @override
  String get profileId;
  @override
  DateTime get from;
  @override
  DateTime? get to;

  /// Create a copy of MonthsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryMonthsEventImplCopyWith<_$QueryMonthsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$MonthsState {
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
    required TResult Function(MonthsLoadingState value) loading,
    required TResult Function(MonthsLoadedState value) loaded,
    required TResult Function(MonthsLoadingErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonthsLoadingState value)? loading,
    TResult? Function(MonthsLoadedState value)? loaded,
    TResult? Function(MonthsLoadingErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonthsLoadingState value)? loading,
    TResult Function(MonthsLoadedState value)? loaded,
    TResult Function(MonthsLoadingErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthsStateCopyWith<$Res> {
  factory $MonthsStateCopyWith(
          MonthsState value, $Res Function(MonthsState) then) =
      _$MonthsStateCopyWithImpl<$Res, MonthsState>;
}

/// @nodoc
class _$MonthsStateCopyWithImpl<$Res, $Val extends MonthsState>
    implements $MonthsStateCopyWith<$Res> {
  _$MonthsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$MonthsLoadingStateImplCopyWith<$Res> {
  factory _$$MonthsLoadingStateImplCopyWith(_$MonthsLoadingStateImpl value,
          $Res Function(_$MonthsLoadingStateImpl) then) =
      __$$MonthsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MonthsLoadingStateImplCopyWithImpl<$Res>
    extends _$MonthsStateCopyWithImpl<$Res, _$MonthsLoadingStateImpl>
    implements _$$MonthsLoadingStateImplCopyWith<$Res> {
  __$$MonthsLoadingStateImplCopyWithImpl(_$MonthsLoadingStateImpl _value,
      $Res Function(_$MonthsLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MonthsLoadingStateImpl implements MonthsLoadingState {
  const _$MonthsLoadingStateImpl();

  @override
  String toString() {
    return 'MonthsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$MonthsLoadingStateImpl);
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
    required TResult Function(MonthsLoadingState value) loading,
    required TResult Function(MonthsLoadedState value) loaded,
    required TResult Function(MonthsLoadingErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonthsLoadingState value)? loading,
    TResult? Function(MonthsLoadedState value)? loaded,
    TResult? Function(MonthsLoadingErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonthsLoadingState value)? loading,
    TResult Function(MonthsLoadedState value)? loaded,
    TResult Function(MonthsLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class MonthsLoadingState implements MonthsState {
  const factory MonthsLoadingState() = _$MonthsLoadingStateImpl;
}

/// @nodoc
abstract class _$$MonthsLoadedStateImplCopyWith<$Res> {
  factory _$$MonthsLoadedStateImplCopyWith(_$MonthsLoadedStateImpl value,
          $Res Function(_$MonthsLoadedStateImpl) then) =
      __$$MonthsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Month> months});
}

/// @nodoc
class __$$MonthsLoadedStateImplCopyWithImpl<$Res>
    extends _$MonthsStateCopyWithImpl<$Res, _$MonthsLoadedStateImpl>
    implements _$$MonthsLoadedStateImplCopyWith<$Res> {
  __$$MonthsLoadedStateImplCopyWithImpl(_$MonthsLoadedStateImpl _value,
      $Res Function(_$MonthsLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? months = null,
  }) {
    return _then(_$MonthsLoadedStateImpl(
      months: null == months
          ? _value._months
          : months // ignore: cast_nullable_to_non_nullable
              as List<Month>,
    ));
  }
}

/// @nodoc

class _$MonthsLoadedStateImpl implements MonthsLoadedState {
  const _$MonthsLoadedStateImpl({required final List<Month> months})
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
    return 'MonthsState.loaded(months: $months)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthsLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._months, _months));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_months));

  /// Create a copy of MonthsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthsLoadedStateImplCopyWith<_$MonthsLoadedStateImpl> get copyWith =>
      __$$MonthsLoadedStateImplCopyWithImpl<_$MonthsLoadedStateImpl>(
          this, _$identity);

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
    required TResult Function(MonthsLoadingState value) loading,
    required TResult Function(MonthsLoadedState value) loaded,
    required TResult Function(MonthsLoadingErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonthsLoadingState value)? loading,
    TResult? Function(MonthsLoadedState value)? loaded,
    TResult? Function(MonthsLoadingErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonthsLoadingState value)? loading,
    TResult Function(MonthsLoadedState value)? loaded,
    TResult Function(MonthsLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class MonthsLoadedState implements MonthsState {
  const factory MonthsLoadedState({required final List<Month> months}) =
      _$MonthsLoadedStateImpl;

  List<Month> get months;

  /// Create a copy of MonthsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthsLoadedStateImplCopyWith<_$MonthsLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$MonthsLoadingErrorStateImplCopyWith<$Res> {
  factory _$$MonthsLoadingErrorStateImplCopyWith(
          _$MonthsLoadingErrorStateImpl value,
          $Res Function(_$MonthsLoadingErrorStateImpl) then) =
      __$$MonthsLoadingErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$MonthsLoadingErrorStateImplCopyWithImpl<$Res>
    extends _$MonthsStateCopyWithImpl<$Res, _$MonthsLoadingErrorStateImpl>
    implements _$$MonthsLoadingErrorStateImplCopyWith<$Res> {
  __$$MonthsLoadingErrorStateImplCopyWithImpl(
      _$MonthsLoadingErrorStateImpl _value,
      $Res Function(_$MonthsLoadingErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$MonthsLoadingErrorStateImpl implements MonthsLoadingErrorState {
  const _$MonthsLoadingErrorStateImpl();

  @override
  String toString() {
    return 'MonthsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthsLoadingErrorStateImpl);
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
    required TResult Function(MonthsLoadingState value) loading,
    required TResult Function(MonthsLoadedState value) loaded,
    required TResult Function(MonthsLoadingErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(MonthsLoadingState value)? loading,
    TResult? Function(MonthsLoadedState value)? loaded,
    TResult? Function(MonthsLoadingErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(MonthsLoadingState value)? loading,
    TResult Function(MonthsLoadedState value)? loaded,
    TResult Function(MonthsLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class MonthsLoadingErrorState implements MonthsState {
  const factory MonthsLoadingErrorState() = _$MonthsLoadingErrorStateImpl;
}
