// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'weeks_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WeeksEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeeksEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeeksEvent()';
  }
}

/// @nodoc
class $WeeksEventCopyWith<$Res> {
  $WeeksEventCopyWith(WeeksEvent _, $Res Function(WeeksEvent) __);
}

/// @nodoc

class GetWeeksEvent extends WeeksEvent {
  const GetWeeksEvent(
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

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetWeeksEventCopyWith<GetWeeksEvent> get copyWith =>
      _$GetWeeksEventCopyWithImpl<GetWeeksEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetWeeksEvent &&
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
    return 'WeeksEvent.queryWeeks(profileId: $profileId, from: $from, to: $to, useStream: $useStream)';
  }
}

/// @nodoc
abstract mixin class $GetWeeksEventCopyWith<$Res>
    implements $WeeksEventCopyWith<$Res> {
  factory $GetWeeksEventCopyWith(
          GetWeeksEvent value, $Res Function(GetWeeksEvent) _then) =
      _$GetWeeksEventCopyWithImpl;
  @useResult
  $Res call({String profileId, DateTime from, DateTime to, bool useStream});
}

/// @nodoc
class _$GetWeeksEventCopyWithImpl<$Res>
    implements $GetWeeksEventCopyWith<$Res> {
  _$GetWeeksEventCopyWithImpl(this._self, this._then);

  final GetWeeksEvent _self;
  final $Res Function(GetWeeksEvent) _then;

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = null,
    Object? useStream = null,
  }) {
    return _then(GetWeeksEvent(
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

class ReceiveUpdateWeeksEvent extends WeeksEvent {
  const ReceiveUpdateWeeksEvent({required final List<Week> weeks})
      : _weeks = weeks,
        super._();

  final List<Week> _weeks;
  List<Week> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceiveUpdateWeeksEventCopyWith<ReceiveUpdateWeeksEvent> get copyWith =>
      _$ReceiveUpdateWeeksEventCopyWithImpl<ReceiveUpdateWeeksEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceiveUpdateWeeksEvent &&
            const DeepCollectionEquality().equals(other._weeks, _weeks));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_weeks));

  @override
  String toString() {
    return 'WeeksEvent.receiveUpdate(weeks: $weeks)';
  }
}

/// @nodoc
abstract mixin class $ReceiveUpdateWeeksEventCopyWith<$Res>
    implements $WeeksEventCopyWith<$Res> {
  factory $ReceiveUpdateWeeksEventCopyWith(ReceiveUpdateWeeksEvent value,
          $Res Function(ReceiveUpdateWeeksEvent) _then) =
      _$ReceiveUpdateWeeksEventCopyWithImpl;
  @useResult
  $Res call({List<Week> weeks});
}

/// @nodoc
class _$ReceiveUpdateWeeksEventCopyWithImpl<$Res>
    implements $ReceiveUpdateWeeksEventCopyWith<$Res> {
  _$ReceiveUpdateWeeksEventCopyWithImpl(this._self, this._then);

  final ReceiveUpdateWeeksEvent _self;
  final $Res Function(ReceiveUpdateWeeksEvent) _then;

  /// Create a copy of WeeksEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? weeks = null,
  }) {
    return _then(ReceiveUpdateWeeksEvent(
      weeks: null == weeks
          ? _self._weeks
          : weeks // ignore: cast_nullable_to_non_nullable
              as List<Week>,
    ));
  }
}

/// @nodoc

class WeeksErrorEvent extends WeeksEvent {
  const WeeksErrorEvent() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeeksErrorEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeeksEvent.error()';
  }
}

/// @nodoc
mixin _$WeeksState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeeksState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeeksState()';
  }
}

/// @nodoc
class $WeeksStateCopyWith<$Res> {
  $WeeksStateCopyWith(WeeksState _, $Res Function(WeeksState) __);
}

/// @nodoc

class WeeksLoadingState implements WeeksState {
  const WeeksLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeeksLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeeksState.loading()';
  }
}

/// @nodoc

class WeeksLoadedState implements WeeksState {
  const WeeksLoadedState(
      {required this.from,
      required this.to,
      required final List<Week> weeks,
      required this.calculatedStats})
      : _weeks = weeks;

  final DateTime from;
  final DateTime to;
  final List<Week> _weeks;
  List<Week> get weeks {
    if (_weeks is EqualUnmodifiableListView) return _weeks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_weeks);
  }

  final CalculatedStats calculatedStats;

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeeksLoadedStateCopyWith<WeeksLoadedState> get copyWith =>
      _$WeeksLoadedStateCopyWithImpl<WeeksLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WeeksLoadedState &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to) &&
            const DeepCollectionEquality().equals(other._weeks, _weeks) &&
            (identical(other.calculatedStats, calculatedStats) ||
                other.calculatedStats == calculatedStats));
  }

  @override
  int get hashCode => Object.hash(runtimeType, from, to,
      const DeepCollectionEquality().hash(_weeks), calculatedStats);

  @override
  String toString() {
    return 'WeeksState.loaded(from: $from, to: $to, weeks: $weeks, calculatedStats: $calculatedStats)';
  }
}

/// @nodoc
abstract mixin class $WeeksLoadedStateCopyWith<$Res>
    implements $WeeksStateCopyWith<$Res> {
  factory $WeeksLoadedStateCopyWith(
          WeeksLoadedState value, $Res Function(WeeksLoadedState) _then) =
      _$WeeksLoadedStateCopyWithImpl;
  @useResult
  $Res call(
      {DateTime from,
      DateTime to,
      List<Week> weeks,
      CalculatedStats calculatedStats});

  $CalculatedStatsCopyWith<$Res> get calculatedStats;
}

/// @nodoc
class _$WeeksLoadedStateCopyWithImpl<$Res>
    implements $WeeksLoadedStateCopyWith<$Res> {
  _$WeeksLoadedStateCopyWithImpl(this._self, this._then);

  final WeeksLoadedState _self;
  final $Res Function(WeeksLoadedState) _then;

  /// Create a copy of WeeksState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? from = null,
    Object? to = null,
    Object? weeks = null,
    Object? calculatedStats = null,
  }) {
    return _then(WeeksLoadedState(
      from: null == from
          ? _self.from
          : from // ignore: cast_nullable_to_non_nullable
              as DateTime,
      to: null == to
          ? _self.to
          : to // ignore: cast_nullable_to_non_nullable
              as DateTime,
      weeks: null == weeks
          ? _self._weeks
          : weeks // ignore: cast_nullable_to_non_nullable
              as List<Week>,
      calculatedStats: null == calculatedStats
          ? _self.calculatedStats
          : calculatedStats // ignore: cast_nullable_to_non_nullable
              as CalculatedStats,
    ));
  }

  /// Create a copy of WeeksState
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

class WeeksLoadingErrorState implements WeeksState {
  const WeeksLoadingErrorState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is WeeksLoadingErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'WeeksState.error()';
  }
}

// dart format on
