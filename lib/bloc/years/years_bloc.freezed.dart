// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'years_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$YearsEvent {
  String get profileId;
  DateTime get from;
  DateTime? get to;

  /// Create a copy of YearsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $YearsEventCopyWith<YearsEvent> get copyWith =>
      _$YearsEventCopyWithImpl<YearsEvent>(this as YearsEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YearsEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to);

  @override
  String toString() {
    return 'YearsEvent(profileId: $profileId, from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class $YearsEventCopyWith<$Res> {
  factory $YearsEventCopyWith(
          YearsEvent value, $Res Function(YearsEvent) _then) =
      _$YearsEventCopyWithImpl;
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class _$YearsEventCopyWithImpl<$Res> implements $YearsEventCopyWith<$Res> {
  _$YearsEventCopyWithImpl(this._self, this._then);

  final YearsEvent _self;
  final $Res Function(YearsEvent) _then;

  /// Create a copy of YearsEvent
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

class QueryYearsEvent implements YearsEvent {
  const QueryYearsEvent({required this.profileId, required this.from, this.to});

  @override
  final String profileId;
  @override
  final DateTime from;
  @override
  final DateTime? to;

  /// Create a copy of YearsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $QueryYearsEventCopyWith<QueryYearsEvent> get copyWith =>
      _$QueryYearsEventCopyWithImpl<QueryYearsEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is QueryYearsEvent &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, from, to);

  @override
  String toString() {
    return 'YearsEvent.queryYears(profileId: $profileId, from: $from, to: $to)';
  }
}

/// @nodoc
abstract mixin class $QueryYearsEventCopyWith<$Res>
    implements $YearsEventCopyWith<$Res> {
  factory $QueryYearsEventCopyWith(
          QueryYearsEvent value, $Res Function(QueryYearsEvent) _then) =
      _$QueryYearsEventCopyWithImpl;
  @override
  @useResult
  $Res call({String profileId, DateTime from, DateTime? to});
}

/// @nodoc
class _$QueryYearsEventCopyWithImpl<$Res>
    implements $QueryYearsEventCopyWith<$Res> {
  _$QueryYearsEventCopyWithImpl(this._self, this._then);

  final QueryYearsEvent _self;
  final $Res Function(QueryYearsEvent) _then;

  /// Create a copy of YearsEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
    Object? from = null,
    Object? to = freezed,
  }) {
    return _then(QueryYearsEvent(
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
mixin _$YearsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is YearsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'YearsState()';
  }
}

/// @nodoc
class $YearsStateCopyWith<$Res> {
  $YearsStateCopyWith(YearsState _, $Res Function(YearsState) __);
}

/// @nodoc

class YearsLoadingState implements YearsState {
  const YearsLoadingState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is YearsLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'YearsState.loading()';
  }
}

/// @nodoc

class YearsLoadedState implements YearsState {
  const YearsLoadedState({required final List<Year> years}) : _years = years;

  final List<Year> _years;
  List<Year> get years {
    if (_years is EqualUnmodifiableListView) return _years;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_years);
  }

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $YearsLoadedStateCopyWith<YearsLoadedState> get copyWith =>
      _$YearsLoadedStateCopyWithImpl<YearsLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is YearsLoadedState &&
            const DeepCollectionEquality().equals(other._years, _years));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_years));

  @override
  String toString() {
    return 'YearsState.loaded(years: $years)';
  }
}

/// @nodoc
abstract mixin class $YearsLoadedStateCopyWith<$Res>
    implements $YearsStateCopyWith<$Res> {
  factory $YearsLoadedStateCopyWith(
          YearsLoadedState value, $Res Function(YearsLoadedState) _then) =
      _$YearsLoadedStateCopyWithImpl;
  @useResult
  $Res call({List<Year> years});
}

/// @nodoc
class _$YearsLoadedStateCopyWithImpl<$Res>
    implements $YearsLoadedStateCopyWith<$Res> {
  _$YearsLoadedStateCopyWithImpl(this._self, this._then);

  final YearsLoadedState _self;
  final $Res Function(YearsLoadedState) _then;

  /// Create a copy of YearsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? years = null,
  }) {
    return _then(YearsLoadedState(
      years: null == years
          ? _self._years
          : years // ignore: cast_nullable_to_non_nullable
              as List<Year>,
    ));
  }
}

/// @nodoc

class YearsLoadingErrorState implements YearsState {
  const YearsLoadingErrorState();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is YearsLoadingErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'YearsState.error()';
  }
}

// dart format on
