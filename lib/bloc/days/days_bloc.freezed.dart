// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'days_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DaysEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DaysEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DaysEvent()';
  }
}

/// @nodoc
class $DaysEventCopyWith<$Res> {
  $DaysEventCopyWith(DaysEvent _, $Res Function(DaysEvent) __);
}

/// @nodoc

class QueryDaysEvent extends DaysEvent {
  const QueryDaysEvent(
      {required this.profileId,
      required this.from,
      required this.to,
      this.useStream = false})
      : super._();

  final String profileId;
  final DateTime from;
  final DateTime to;
  @JsonKey()
  final bool useStream;

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryDaysEventCopyWith<QueryDaysEvent> get copyWith =>
      _$QueryDaysEventCopyWithImpl<QueryDaysEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryDaysEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.useStream, useStream) ||
                other.useStream == useStream));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to, useStream);

  @override
  String toString() {
    return 'DaysEvent.queryDays(profileId: $profileId, from: $from, to: $to, useStream: $useStream)';
  }
}

/// @nodoc
abstract mixin class $QueryDaysEventCopyWith<$Res>
    implements $DaysEventCopyWith<$Res> {
  factory $QueryDaysEventCopyWith(
          QueryDaysEvent value, $Res Function(QueryDaysEvent) _then) =
      _$QueryDaysEventCopyWithImpl;
  @useResult
  $Res call({String profileId, DateTime from, DateTime to, bool useStream});
}

/// @nodoc
class _$QueryDaysEventCopyWithImpl<$Res>
    implements $QueryDaysEventCopyWith<$Res> {
  _$QueryDaysEventCopyWithImpl(this._self, this._then);

  final QueryDaysEvent _self;
  final $Res Function(QueryDaysEvent) _then;

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = null,
    Object? useStream = null,
  }) {
    return _then(QueryDaysEvent(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      useStream: null == useStream
          ? _self.useStream
          : useStream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class ReceiveUpdateDaysEvent extends DaysEvent {
  const ReceiveUpdateDaysEvent({required final List<Day> days})
      : _days = days,
        super._();

  final List<Day> _days;
  List<Day> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceiveUpdateDaysEventCopyWith<ReceiveUpdateDaysEvent> get copyWith =>
      _$ReceiveUpdateDaysEventCopyWithImpl<ReceiveUpdateDaysEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceiveUpdateDaysEvent &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_days));

  @override
  String toString() {
    return 'DaysEvent.receiveUpdate(days: $days)';
  }
}

/// @nodoc
abstract mixin class $ReceiveUpdateDaysEventCopyWith<$Res>
    implements $DaysEventCopyWith<$Res> {
  factory $ReceiveUpdateDaysEventCopyWith(ReceiveUpdateDaysEvent value,
          $Res Function(ReceiveUpdateDaysEvent) _then) =
      _$ReceiveUpdateDaysEventCopyWithImpl;
  @useResult
  $Res call({List<Day> days});
}

/// @nodoc
class _$ReceiveUpdateDaysEventCopyWithImpl<$Res>
    implements $ReceiveUpdateDaysEventCopyWith<$Res> {
  _$ReceiveUpdateDaysEventCopyWithImpl(this._self, this._then);

  final ReceiveUpdateDaysEvent _self;
  final $Res Function(ReceiveUpdateDaysEvent) _then;

  /// Create a copy of DaysEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? days = null,
  }) {
    return _then(ReceiveUpdateDaysEvent(
      days: null == days
          ? _self._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc

class DaysErrorEvent extends DaysEvent {
  const DaysErrorEvent() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is DaysErrorEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'DaysEvent.error()';
  }
}

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
