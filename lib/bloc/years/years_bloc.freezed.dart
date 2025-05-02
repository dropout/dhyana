// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'years_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$YearsEvent {
  String get profileId => throw _privateConstructorUsedError;
  DateTime get from => throw _privateConstructorUsedError;
  DateTime? get to => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String profileId, DateTime from, DateTime? to)
        queryYears,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, DateTime from, DateTime? to)?
        queryYears,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, DateTime from, DateTime? to)? queryYears,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryYearsEvent value) queryYears,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryYearsEvent value)? queryYears,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryYearsEvent value)? queryYears,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of YearsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YearsEventCopyWith<YearsEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearsEventCopyWith<$Res> {
  factory $YearsEventCopyWith(
          YearsEvent value, $Res Function(YearsEvent) then) =
      _$YearsEventCopyWithImpl<$Res, YearsEvent>;
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class _$YearsEventCopyWithImpl<$Res, $Val extends YearsEvent>
    implements $YearsEventCopyWith<$Res> {
  _$YearsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YearsEvent
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
abstract class _$$QueryYearsEventImplCopyWith<$Res>
    implements $YearsEventCopyWith<$Res> {
  factory _$$QueryYearsEventImplCopyWith(_$QueryYearsEventImpl value,
          $Res Function(_$QueryYearsEventImpl) then) =
      __$$QueryYearsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class __$$QueryYearsEventImplCopyWithImpl<$Res>
    extends _$YearsEventCopyWithImpl<$Res, _$QueryYearsEventImpl>
    implements _$$QueryYearsEventImplCopyWith<$Res> {
  __$$QueryYearsEventImplCopyWithImpl(
      _$QueryYearsEventImpl _value, $Res Function(_$QueryYearsEventImpl) _then)
      : super(_value, _then);

  /// Create a copy of YearsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = freezed,
  }) {
    return _then(_$QueryYearsEventImpl(
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

class _$QueryYearsEventImpl implements QueryYearsEvent {
  const _$QueryYearsEventImpl(
      {required this.profileId, required this.from, this.to});

  @override
  final String profileId;
  @override
  final DateTime from;
  @override
  final DateTime? to;

  @override
  String toString() {
    return 'YearsEvent.queryYears(profileId: $profileId, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$QueryYearsEventImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to);

  /// Create a copy of YearsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$QueryYearsEventImplCopyWith<_$QueryYearsEventImpl> get copyWith =>
      __$$QueryYearsEventImplCopyWithImpl<_$QueryYearsEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String profileId, DateTime from, DateTime? to)
        queryYears,
  }) {
    return queryYears(profileId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, DateTime from, DateTime? to)?
        queryYears,
  }) {
    return queryYears?.call(profileId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, DateTime from, DateTime? to)? queryYears,
    required TResult orElse(),
  }) {
    if (queryYears != null) {
      return queryYears(profileId, from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(QueryYearsEvent value) queryYears,
  }) {
    return queryYears(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(QueryYearsEvent value)? queryYears,
  }) {
    return queryYears?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(QueryYearsEvent value)? queryYears,
    required TResult orElse(),
  }) {
    if (queryYears != null) {
      return queryYears(this);
    }
    return orElse();
  }
}

abstract class QueryYearsEvent implements YearsEvent {
  const factory QueryYearsEvent(
      {required final String profileId,
      required final DateTime from,
      final DateTime? to}) = _$QueryYearsEventImpl;

  @override
  String get profileId;
  @override
  DateTime get from;
  @override
  DateTime? get to;

  /// Create a copy of YearsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$QueryYearsEventImplCopyWith<_$QueryYearsEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$YearsState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Year> years) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Year> years)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Year> years)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(YearsLoadingState value) loading,
    required TResult Function(YearsLoadedState value) loaded,
    required TResult Function(YearsLoadingErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(YearsLoadingState value)? loading,
    TResult? Function(YearsLoadedState value)? loaded,
    TResult? Function(YearsLoadingErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(YearsLoadingState value)? loading,
    TResult Function(YearsLoadedState value)? loaded,
    TResult Function(YearsLoadingErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearsStateCopyWith<$Res> {
  factory $YearsStateCopyWith(
          YearsState value, $Res Function(YearsState) then) =
      _$YearsStateCopyWithImpl<$Res, YearsState>;
}

/// @nodoc
class _$YearsStateCopyWithImpl<$Res, $Val extends YearsState>
    implements $YearsStateCopyWith<$Res> {
  _$YearsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$YearsLoadingStateImplCopyWith<$Res> {
  factory _$$YearsLoadingStateImplCopyWith(_$YearsLoadingStateImpl value,
          $Res Function(_$YearsLoadingStateImpl) then) =
      __$$YearsLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$YearsLoadingStateImplCopyWithImpl<$Res>
    extends _$YearsStateCopyWithImpl<$Res, _$YearsLoadingStateImpl>
    implements _$$YearsLoadingStateImplCopyWith<$Res> {
  __$$YearsLoadingStateImplCopyWithImpl(_$YearsLoadingStateImpl _value,
      $Res Function(_$YearsLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$YearsLoadingStateImpl implements YearsLoadingState {
  const _$YearsLoadingStateImpl();

  @override
  String toString() {
    return 'YearsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$YearsLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Year> years) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Year> years)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Year> years)? loaded,
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
    required TResult Function(YearsLoadingState value) loading,
    required TResult Function(YearsLoadedState value) loaded,
    required TResult Function(YearsLoadingErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(YearsLoadingState value)? loading,
    TResult? Function(YearsLoadedState value)? loaded,
    TResult? Function(YearsLoadingErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(YearsLoadingState value)? loading,
    TResult Function(YearsLoadedState value)? loaded,
    TResult Function(YearsLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class YearsLoadingState implements YearsState {
  const factory YearsLoadingState() = _$YearsLoadingStateImpl;
}

/// @nodoc
abstract class _$$YearsLoadedStateImplCopyWith<$Res> {
  factory _$$YearsLoadedStateImplCopyWith(_$YearsLoadedStateImpl value,
          $Res Function(_$YearsLoadedStateImpl) then) =
      __$$YearsLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Year> years});
}

/// @nodoc
class __$$YearsLoadedStateImplCopyWithImpl<$Res>
    extends _$YearsStateCopyWithImpl<$Res, _$YearsLoadedStateImpl>
    implements _$$YearsLoadedStateImplCopyWith<$Res> {
  __$$YearsLoadedStateImplCopyWithImpl(_$YearsLoadedStateImpl _value,
      $Res Function(_$YearsLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? years = null,
  }) {
    return _then(_$YearsLoadedStateImpl(
      years: null == years
          ? _value._years
          : years // ignore: cast_nullable_to_non_nullable
              as List<Year>,
    ));
  }
}

/// @nodoc

class _$YearsLoadedStateImpl implements YearsLoadedState {
  const _$YearsLoadedStateImpl({required final List<Year> years})
      : _years = years;

  final List<Year> _years;
  @override
  List<Year> get years {
    if (_years is EqualUnmodifiableListView) return _years;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_years);
  }

  @override
  String toString() {
    return 'YearsState.loaded(years: $years)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YearsLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._years, _years));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_years));

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YearsLoadedStateImplCopyWith<_$YearsLoadedStateImpl> get copyWith =>
      __$$YearsLoadedStateImplCopyWithImpl<_$YearsLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Year> years) loaded,
    required TResult Function() error,
  }) {
    return loaded(years);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Year> years)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(years);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Year> years)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(years);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(YearsLoadingState value) loading,
    required TResult Function(YearsLoadedState value) loaded,
    required TResult Function(YearsLoadingErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(YearsLoadingState value)? loading,
    TResult? Function(YearsLoadedState value)? loaded,
    TResult? Function(YearsLoadingErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(YearsLoadingState value)? loading,
    TResult Function(YearsLoadedState value)? loaded,
    TResult Function(YearsLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class YearsLoadedState implements YearsState {
  const factory YearsLoadedState({required final List<Year> years}) =
      _$YearsLoadedStateImpl;

  List<Year> get years;

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YearsLoadedStateImplCopyWith<_$YearsLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$YearsLoadingErrorStateImplCopyWith<$Res> {
  factory _$$YearsLoadingErrorStateImplCopyWith(
          _$YearsLoadingErrorStateImpl value,
          $Res Function(_$YearsLoadingErrorStateImpl) then) =
      __$$YearsLoadingErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$YearsLoadingErrorStateImplCopyWithImpl<$Res>
    extends _$YearsStateCopyWithImpl<$Res, _$YearsLoadingErrorStateImpl>
    implements _$$YearsLoadingErrorStateImplCopyWith<$Res> {
  __$$YearsLoadingErrorStateImplCopyWithImpl(
      _$YearsLoadingErrorStateImpl _value,
      $Res Function(_$YearsLoadingErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$YearsLoadingErrorStateImpl implements YearsLoadingErrorState {
  const _$YearsLoadingErrorStateImpl();

  @override
  String toString() {
    return 'YearsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YearsLoadingErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Year> years) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Year> years)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Year> years)? loaded,
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
    required TResult Function(YearsLoadingState value) loading,
    required TResult Function(YearsLoadedState value) loaded,
    required TResult Function(YearsLoadingErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(YearsLoadingState value)? loading,
    TResult? Function(YearsLoadedState value)? loaded,
    TResult? Function(YearsLoadingErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(YearsLoadingState value)? loading,
    TResult Function(YearsLoadedState value)? loaded,
    TResult Function(YearsLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class YearsLoadingErrorState implements YearsState {
  const factory YearsLoadingErrorState() = _$YearsLoadingErrorStateImpl;
}
