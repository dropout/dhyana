// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'months_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MonthsEvent {
  String get profileId;
  DateTime get from;
  DateTime? get to;

  /// Create a copy of MonthsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MonthsEventCopyWith<MonthsEvent> get copyWith =>
      _$MonthsEventCopyWithImpl<MonthsEvent>(this as MonthsEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MonthsEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to);

  @override
  String toString() {
    return 'MonthsEvent(profileId: $profileId, from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class $MonthsEventCopyWith<$Res> {
  factory $MonthsEventCopyWith(
          MonthsEvent value, $Res Function(MonthsEvent) _then) =
      _$MonthsEventCopyWithImpl;
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class _$MonthsEventCopyWithImpl<$Res> implements $MonthsEventCopyWith<$Res> {
  _$MonthsEventCopyWithImpl(this._self, this._then);

  final MonthsEvent _self;
  final $Res Function(MonthsEvent) _then;

  /// Create a copy of MonthsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = freezed,
  }) {
    return _then(_self.copyWith(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class QueryMonthsEvent implements MonthsEvent {
  const QueryMonthsEvent(
      {required this.profileId, required this.from, this.to});

  @override
  final String profileId;
  @override
  final DateTime from;
  @override
  final DateTime? to;

  /// Create a copy of MonthsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryMonthsEventCopyWith<QueryMonthsEvent> get copyWith =>
      _$QueryMonthsEventCopyWithImpl<QueryMonthsEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryMonthsEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to);

  @override
  String toString() {
    return 'MonthsEvent.queryMonths(profileId: $profileId, from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class $QueryMonthsEventCopyWith<$Res>
    implements $MonthsEventCopyWith<$Res> {
  factory $QueryMonthsEventCopyWith(
          QueryMonthsEvent value, $Res Function(QueryMonthsEvent) _then) =
      _$QueryMonthsEventCopyWithImpl;
  @override
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class _$QueryMonthsEventCopyWithImpl<$Res>
    implements $QueryMonthsEventCopyWith<$Res> {
  _$QueryMonthsEventCopyWithImpl(this._self, this._then);

  final QueryMonthsEvent _self;
  final $Res Function(QueryMonthsEvent) _then;

  /// Create a copy of MonthsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = freezed,
  }) {
    return _then(QueryMonthsEvent(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: freezed == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$MonthsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MonthsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MonthsState()';
  }
}

/// @nodoc
class $MonthsStateCopyWith<$Res> {
  $MonthsStateCopyWith(MonthsState _, $Res Function(MonthsState) __);
}

/// @nodoc

class MonthsLoadingState implements MonthsState {
  const MonthsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MonthsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MonthsState.loading()';
  }
}

/// @nodoc

class MonthsLoadedState implements MonthsState {
  const MonthsLoadedState({required final List<Month> months})
      : _months = months;

  final List<Month> _months;
  List<Month> get months {
    if (_months is EqualUnmodifiableListView) return _months;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_months);
  }

  /// Create a copy of MonthsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MonthsLoadedStateCopyWith<MonthsLoadedState> get copyWith =>
      _$MonthsLoadedStateCopyWithImpl<MonthsLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MonthsLoadedState &&
            const DeepCollectionEquality().equals(other._months, _months));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_months));

  @override
  String toString() {
    return 'MonthsState.loaded(months: $months)';
  }
}

/// @nodoc
abstract mixin class $MonthsLoadedStateCopyWith<$Res>
    implements $MonthsStateCopyWith<$Res> {
  factory $MonthsLoadedStateCopyWith(
          MonthsLoadedState value, $Res Function(MonthsLoadedState) _then) =
      _$MonthsLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<Month> months});
}

/// @nodoc
class _$MonthsLoadedStateCopyWithImpl<$Res>
    implements $MonthsLoadedStateCopyWith<$Res> {
  _$MonthsLoadedStateCopyWithImpl(this._self, this._then);

  final MonthsLoadedState _self;
  final $Res Function(MonthsLoadedState) _then;

  /// Create a copy of MonthsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? months = null,
  }) {
    return _then(MonthsLoadedState(
      months: null == months
          ? _self._months
          : months // ignore: cast_nullable_to_non_nullable
              as List<Month>,
    ));
  }
}

/// @nodoc

class MonthsLoadingErrorState implements MonthsState {
  const MonthsLoadingErrorState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MonthsLoadingErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MonthsState.error()';
  }
}

// dart format on
