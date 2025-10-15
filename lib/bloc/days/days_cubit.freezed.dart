// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'days_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DaysState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DaysState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DaysState()';
  }
}

/// @nodoc
class $DaysStateCopyWith<$Res> {
  $DaysStateCopyWith(DaysState _, $Res Function(DaysState) __);
}

/// Adds pattern-matching-related methods to [DaysState].
extension DaysStatePatterns on DaysState {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DaysLoadingState value)? loading,
    TResult Function(DaysLoadedState value)? loaded,
    TResult Function(DaysLoadingErrorState value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DaysLoadingState() when loading != null:
        return loading(_that);
      case DaysLoadedState() when loaded != null:
        return loaded(_that);
      case DaysLoadingErrorState() when error != null:
        return error(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DaysLoadingState value) loading,
    required TResult Function(DaysLoadedState value) loaded,
    required TResult Function(DaysLoadingErrorState value) error,
  }) {
    final _that = this;
    switch (_that) {
      case DaysLoadingState():
        return loading(_that);
      case DaysLoadedState():
        return loaded(_that);
      case DaysLoadingErrorState():
        return error(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DaysLoadingState value)? loading,
    TResult? Function(DaysLoadedState value)? loaded,
    TResult? Function(DaysLoadingErrorState value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case DaysLoadingState() when loading != null:
        return loading(_that);
      case DaysLoadedState() when loaded != null:
        return loaded(_that);
      case DaysLoadingErrorState() when error != null:
        return error(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(DateTime from, DateTime to, List<Day> days,
            CalculatedStats calculatedStats)?
        loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case DaysLoadingState() when loading != null:
        return loading();
      case DaysLoadedState() when loaded != null:
        return loaded(_that.from, _that.to, _that.days, _that.calculatedStats);
      case DaysLoadingErrorState() when error != null:
        return error();
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(DateTime from, DateTime to, List<Day> days,
            CalculatedStats calculatedStats)
        loaded,
    required TResult Function() error,
  }) {
    final _that = this;
    switch (_that) {
      case DaysLoadingState():
        return loading();
      case DaysLoadedState():
        return loaded(_that.from, _that.to, _that.days, _that.calculatedStats);
      case DaysLoadingErrorState():
        return error();
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(DateTime from, DateTime to, List<Day> days,
            CalculatedStats calculatedStats)?
        loaded,
    TResult? Function()? error,
  }) {
    final _that = this;
    switch (_that) {
      case DaysLoadingState() when loading != null:
        return loading();
      case DaysLoadedState() when loaded != null:
        return loaded(_that.from, _that.to, _that.days, _that.calculatedStats);
      case DaysLoadingErrorState() when error != null:
        return error();
      case _:
        return null;
    }
  }
}

/// @nodoc

class DaysLoadingState implements DaysState {
  const DaysLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DaysLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DaysState.loading()';
  }
}

/// @nodoc

class DaysLoadedState implements DaysState {
  const DaysLoadedState(
      {required this.from,
      required this.to,
      required final List<Day> days,
      required this.calculatedStats})
      : _days = days;

  final DateTime from;
  final DateTime to;
  final List<Day> _days;
  List<Day> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  final CalculatedStats calculatedStats;

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DaysLoadedStateCopyWith<DaysLoadedState> get copyWith =>
      _$DaysLoadedStateCopyWithImpl<DaysLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is DaysLoadedState &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other._days, _days) &&
            (identical(other.calculatedStats, calculatedStats) ||
                other.calculatedStats == calculatedStats));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to,
      const DeepCollectionEquality().hash(_days), calculatedStats);

  @override
  String toString() {
    return 'DaysState.loaded(from: $from, to: $to, days: $days, calculatedStats: $calculatedStats)';
  }
}

/// @nodoc
abstract mixin class $DaysLoadedStateCopyWith<$Res>
    implements $DaysStateCopyWith<$Res> {
  factory $DaysLoadedStateCopyWith(
          DaysLoadedState value, $Res Function(DaysLoadedState) _then) =
      _$DaysLoadedStateCopyWithImpl;
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      List<Day> days,
      CalculatedStats calculatedStats});

  $CalculatedStatsCopyWith<$Res> get calculatedStats;
}

/// @nodoc
class _$DaysLoadedStateCopyWithImpl<$Res>
    implements $DaysLoadedStateCopyWith<$Res> {
  _$DaysLoadedStateCopyWithImpl(this._self, this._then);

  final DaysLoadedState _self;
  final $Res Function(DaysLoadedState) _then;

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? days = null,
    Object? calculatedStats = null,
  }) {
    return _then(DaysLoadedState(
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      days: null == days
          ? _self._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
      calculatedStats: null == calculatedStats
          ? _self.calculatedStats
          : calculatedStats // ignore: cast_nullable_to_non_nullable
              as CalculatedStats,
    ));
  }

  /// Create a copy of DaysState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CalculatedStatsCopyWith<$Res> get calculatedStats {
    return $CalculatedStatsCopyWith<$Res>(_self.calculatedStats, (value) {
      return _then(_self.copyWith(calculatedStats: value));
    });
  }
}

/// @nodoc

class DaysLoadingErrorState implements DaysState {
  const DaysLoadingErrorState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DaysLoadingErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DaysState.error()';
  }
}

// dart format on
