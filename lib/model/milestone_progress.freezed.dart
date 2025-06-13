// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MilestoneProgress implements DiagnosticableTreeMixin {
  int get completedDaysCount;
  int get targetDaysCount;
  List<Session> get sessions;

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MilestoneProgressCopyWith<MilestoneProgress> get copyWith =>
      _$MilestoneProgressCopyWithImpl<MilestoneProgress>(
          this as MilestoneProgress, _$identity);

  /// Serializes this MilestoneProgress to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MilestoneProgress'))
      ..add(DiagnosticsProperty('completedDaysCount', completedDaysCount))
      ..add(DiagnosticsProperty('targetDaysCount', targetDaysCount))
      ..add(DiagnosticsProperty('sessions', sessions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MilestoneProgress &&
            (identical(other.completedDaysCount, completedDaysCount) ||
                other.completedDaysCount == completedDaysCount) &&
            (identical(other.targetDaysCount, targetDaysCount) ||
                other.targetDaysCount == targetDaysCount) &&
            const DeepCollectionEquality().equals(other.sessions, sessions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, completedDaysCount,
      targetDaysCount, const DeepCollectionEquality().hash(sessions));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MilestoneProgress(completedDaysCount: $completedDaysCount, targetDaysCount: $targetDaysCount, sessions: $sessions)';
  }
}

/// @nodoc
abstract mixin class $MilestoneProgressCopyWith<$Res> {
  factory $MilestoneProgressCopyWith(
          MilestoneProgress value, $Res Function(MilestoneProgress) _then) =
      _$MilestoneProgressCopyWithImpl;
  @useResult
  $Res call(
      {int completedDaysCount, int targetDaysCount, List<Session> sessions});
}

/// @nodoc
class _$MilestoneProgressCopyWithImpl<$Res>
    implements $MilestoneProgressCopyWith<$Res> {
  _$MilestoneProgressCopyWithImpl(this._self, this._then);

  final MilestoneProgress _self;
  final $Res Function(MilestoneProgress) _then;

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedDaysCount = null,
    Object? targetDaysCount = null,
    Object? sessions = null,
  }) {
    return _then(_self.copyWith(
      completedDaysCount: null == completedDaysCount
          ? _self.completedDaysCount
          : completedDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      targetDaysCount: null == targetDaysCount
          ? _self.targetDaysCount
          : targetDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      sessions: null == sessions
          ? _self.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MilestoneProgress extends MilestoneProgress
    with DiagnosticableTreeMixin {
  const _MilestoneProgress(
      {this.completedDaysCount = 0,
      this.targetDaysCount = 7,
      final List<Session> sessions = const []})
      : _sessions = sessions,
        super._();
  factory _MilestoneProgress.fromJson(Map<String, dynamic> json) =>
      _$MilestoneProgressFromJson(json);

  @override
  @JsonKey()
  final int completedDaysCount;
  @override
  @JsonKey()
  final int targetDaysCount;
  final List<Session> _sessions;
  @override
  @JsonKey()
  List<Session> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MilestoneProgressCopyWith<_MilestoneProgress> get copyWith =>
      __$MilestoneProgressCopyWithImpl<_MilestoneProgress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MilestoneProgressToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'MilestoneProgress'))
      ..add(DiagnosticsProperty('completedDaysCount', completedDaysCount))
      ..add(DiagnosticsProperty('targetDaysCount', targetDaysCount))
      ..add(DiagnosticsProperty('sessions', sessions));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MilestoneProgress &&
            (identical(other.completedDaysCount, completedDaysCount) ||
                other.completedDaysCount == completedDaysCount) &&
            (identical(other.targetDaysCount, targetDaysCount) ||
                other.targetDaysCount == targetDaysCount) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, completedDaysCount,
      targetDaysCount, const DeepCollectionEquality().hash(_sessions));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MilestoneProgress(completedDaysCount: $completedDaysCount, targetDaysCount: $targetDaysCount, sessions: $sessions)';
  }
}

/// @nodoc
abstract mixin class _$MilestoneProgressCopyWith<$Res>
    implements $MilestoneProgressCopyWith<$Res> {
  factory _$MilestoneProgressCopyWith(
          _MilestoneProgress value, $Res Function(_MilestoneProgress) _then) =
      __$MilestoneProgressCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int completedDaysCount, int targetDaysCount, List<Session> sessions});
}

/// @nodoc
class __$MilestoneProgressCopyWithImpl<$Res>
    implements _$MilestoneProgressCopyWith<$Res> {
  __$MilestoneProgressCopyWithImpl(this._self, this._then);

  final _MilestoneProgress _self;
  final $Res Function(_MilestoneProgress) _then;

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? completedDaysCount = null,
    Object? targetDaysCount = null,
    Object? sessions = null,
  }) {
    return _then(_MilestoneProgress(
      completedDaysCount: null == completedDaysCount
          ? _self.completedDaysCount
          : completedDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      targetDaysCount: null == targetDaysCount
          ? _self.targetDaysCount
          : targetDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      sessions: null == sessions
          ? _self._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

// dart format on
