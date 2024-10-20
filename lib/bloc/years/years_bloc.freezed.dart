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
        getYear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, DateTime from, DateTime? to)? getYear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, DateTime from, DateTime? to)? getYear,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetYearsEvent value) getYear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetYearsEvent value)? getYear,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetYearsEvent value)? getYear,
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
abstract class _$$GetYearsEventImplCopyWith<$Res>
    implements $YearsEventCopyWith<$Res> {
  factory _$$GetYearsEventImplCopyWith(
          _$GetYearsEventImpl value, $Res Function(_$GetYearsEventImpl) then) =
      __$$GetYearsEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class __$$GetYearsEventImplCopyWithImpl<$Res>
    extends _$YearsEventCopyWithImpl<$Res, _$GetYearsEventImpl>
    implements _$$GetYearsEventImplCopyWith<$Res> {
  __$$GetYearsEventImplCopyWithImpl(
      _$GetYearsEventImpl _value, $Res Function(_$GetYearsEventImpl) _then)
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
    return _then(_$GetYearsEventImpl(
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

class _$GetYearsEventImpl implements GetYearsEvent {
  const _$GetYearsEventImpl(
      {required this.profileId, required this.from, this.to});

  @override
  final String profileId;
  @override
  final DateTime from;
  @override
  final DateTime? to;

  @override
  String toString() {
    return 'YearsEvent.getYear(profileId: $profileId, from: $from, to: $to)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetYearsEventImpl &&
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
  _$$GetYearsEventImplCopyWith<_$GetYearsEventImpl> get copyWith =>
      __$$GetYearsEventImplCopyWithImpl<_$GetYearsEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String profileId, DateTime from, DateTime? to)
        getYear,
  }) {
    return getYear(profileId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, DateTime from, DateTime? to)? getYear,
  }) {
    return getYear?.call(profileId, from, to);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, DateTime from, DateTime? to)? getYear,
    required TResult orElse(),
  }) {
    if (getYear != null) {
      return getYear(profileId, from, to);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GetYearsEvent value) getYear,
  }) {
    return getYear(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GetYearsEvent value)? getYear,
  }) {
    return getYear?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GetYearsEvent value)? getYear,
    required TResult orElse(),
  }) {
    if (getYear != null) {
      return getYear(this);
    }
    return orElse();
  }
}

abstract class GetYearsEvent implements YearsEvent {
  const factory GetYearsEvent(
      {required final String profileId,
      required final DateTime from,
      final DateTime? to}) = _$GetYearsEventImpl;

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
  _$$GetYearsEventImplCopyWith<_$GetYearsEventImpl> get copyWith =>
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
    required TResult Function(YearsLoading value) loading,
    required TResult Function(YearsLoaded value) loaded,
    required TResult Function(YearsLoadingError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(YearsLoading value)? loading,
    TResult? Function(YearsLoaded value)? loaded,
    TResult? Function(YearsLoadingError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(YearsLoading value)? loading,
    TResult Function(YearsLoaded value)? loaded,
    TResult Function(YearsLoadingError value)? error,
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
abstract class _$$YearsLoadingImplCopyWith<$Res> {
  factory _$$YearsLoadingImplCopyWith(
          _$YearsLoadingImpl value, $Res Function(_$YearsLoadingImpl) then) =
      __$$YearsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$YearsLoadingImplCopyWithImpl<$Res>
    extends _$YearsStateCopyWithImpl<$Res, _$YearsLoadingImpl>
    implements _$$YearsLoadingImplCopyWith<$Res> {
  __$$YearsLoadingImplCopyWithImpl(
      _$YearsLoadingImpl _value, $Res Function(_$YearsLoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$YearsLoadingImpl implements YearsLoading {
  const _$YearsLoadingImpl();

  @override
  String toString() {
    return 'YearsState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$YearsLoadingImpl);
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
    required TResult Function(YearsLoading value) loading,
    required TResult Function(YearsLoaded value) loaded,
    required TResult Function(YearsLoadingError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(YearsLoading value)? loading,
    TResult? Function(YearsLoaded value)? loaded,
    TResult? Function(YearsLoadingError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(YearsLoading value)? loading,
    TResult Function(YearsLoaded value)? loaded,
    TResult Function(YearsLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class YearsLoading implements YearsState {
  const factory YearsLoading() = _$YearsLoadingImpl;
}

/// @nodoc
abstract class _$$YearsLoadedImplCopyWith<$Res> {
  factory _$$YearsLoadedImplCopyWith(
          _$YearsLoadedImpl value, $Res Function(_$YearsLoadedImpl) then) =
      __$$YearsLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Year> years});
}

/// @nodoc
class __$$YearsLoadedImplCopyWithImpl<$Res>
    extends _$YearsStateCopyWithImpl<$Res, _$YearsLoadedImpl>
    implements _$$YearsLoadedImplCopyWith<$Res> {
  __$$YearsLoadedImplCopyWithImpl(
      _$YearsLoadedImpl _value, $Res Function(_$YearsLoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? years = null,
  }) {
    return _then(_$YearsLoadedImpl(
      years: null == years
          ? _value._years
          : years // ignore: cast_nullable_to_non_nullable
              as List<Year>,
    ));
  }
}

/// @nodoc

class _$YearsLoadedImpl implements YearsLoaded {
  const _$YearsLoadedImpl({required final List<Year> years}) : _years = years;

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
            other is _$YearsLoadedImpl &&
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
  _$$YearsLoadedImplCopyWith<_$YearsLoadedImpl> get copyWith =>
      __$$YearsLoadedImplCopyWithImpl<_$YearsLoadedImpl>(this, _$identity);

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
    required TResult Function(YearsLoading value) loading,
    required TResult Function(YearsLoaded value) loaded,
    required TResult Function(YearsLoadingError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(YearsLoading value)? loading,
    TResult? Function(YearsLoaded value)? loaded,
    TResult? Function(YearsLoadingError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(YearsLoading value)? loading,
    TResult Function(YearsLoaded value)? loaded,
    TResult Function(YearsLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class YearsLoaded implements YearsState {
  const factory YearsLoaded({required final List<Year> years}) =
      _$YearsLoadedImpl;

  List<Year> get years;

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YearsLoadedImplCopyWith<_$YearsLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$YearsLoadingErrorImplCopyWith<$Res> {
  factory _$$YearsLoadingErrorImplCopyWith(_$YearsLoadingErrorImpl value,
          $Res Function(_$YearsLoadingErrorImpl) then) =
      __$$YearsLoadingErrorImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$YearsLoadingErrorImplCopyWithImpl<$Res>
    extends _$YearsStateCopyWithImpl<$Res, _$YearsLoadingErrorImpl>
    implements _$$YearsLoadingErrorImplCopyWith<$Res> {
  __$$YearsLoadingErrorImplCopyWithImpl(_$YearsLoadingErrorImpl _value,
      $Res Function(_$YearsLoadingErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$YearsLoadingErrorImpl implements YearsLoadingError {
  const _$YearsLoadingErrorImpl();

  @override
  String toString() {
    return 'YearsState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$YearsLoadingErrorImpl);
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
    required TResult Function(YearsLoading value) loading,
    required TResult Function(YearsLoaded value) loaded,
    required TResult Function(YearsLoadingError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(YearsLoading value)? loading,
    TResult? Function(YearsLoaded value)? loaded,
    TResult? Function(YearsLoadingError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(YearsLoading value)? loading,
    TResult Function(YearsLoaded value)? loaded,
    TResult Function(YearsLoadingError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class YearsLoadingError implements YearsState {
  const factory YearsLoadingError() = _$YearsLoadingErrorImpl;
}
