// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MilestoneProgress _$MilestoneProgressFromJson(Map<String, dynamic> json) {
  return _MilestoneProgress.fromJson(json);
}

/// @nodoc
mixin _$MilestoneProgress {
  int get completedDaysCount => throw _privateConstructorUsedError;
  int get targetDaysCount => throw _privateConstructorUsedError;
  List<Session> get sessions => throw _privateConstructorUsedError;

  /// Serializes this MilestoneProgress to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MilestoneProgressCopyWith<MilestoneProgress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MilestoneProgressCopyWith<$Res> {
  factory $MilestoneProgressCopyWith(
          MilestoneProgress value, $Res Function(MilestoneProgress) then) =
      _$MilestoneProgressCopyWithImpl<$Res, MilestoneProgress>;
  @useResult
  $Res call(
      {int completedDaysCount, int targetDaysCount, List<Session> sessions});
}

/// @nodoc
class _$MilestoneProgressCopyWithImpl<$Res, $Val extends MilestoneProgress>
    implements $MilestoneProgressCopyWith<$Res> {
  _$MilestoneProgressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedDaysCount = null,
    Object? targetDaysCount = null,
    Object? sessions = null,
  }) {
    return _then(_value.copyWith(
      completedDaysCount: null == completedDaysCount
          ? _value.completedDaysCount
          : completedDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      targetDaysCount: null == targetDaysCount
          ? _value.targetDaysCount
          : targetDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      sessions: null == sessions
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MilestoneProgressImplCopyWith<$Res>
    implements $MilestoneProgressCopyWith<$Res> {
  factory _$$MilestoneProgressImplCopyWith(_$MilestoneProgressImpl value,
          $Res Function(_$MilestoneProgressImpl) then) =
      __$$MilestoneProgressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int completedDaysCount, int targetDaysCount, List<Session> sessions});
}

/// @nodoc
class __$$MilestoneProgressImplCopyWithImpl<$Res>
    extends _$MilestoneProgressCopyWithImpl<$Res, _$MilestoneProgressImpl>
    implements _$$MilestoneProgressImplCopyWith<$Res> {
  __$$MilestoneProgressImplCopyWithImpl(_$MilestoneProgressImpl _value,
      $Res Function(_$MilestoneProgressImpl) _then)
      : super(_value, _then);

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? completedDaysCount = null,
    Object? targetDaysCount = null,
    Object? sessions = null,
  }) {
    return _then(_$MilestoneProgressImpl(
      completedDaysCount: null == completedDaysCount
          ? _value.completedDaysCount
          : completedDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      targetDaysCount: null == targetDaysCount
          ? _value.targetDaysCount
          : targetDaysCount // ignore: cast_nullable_to_non_nullable
              as int,
      sessions: null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MilestoneProgressImpl extends _MilestoneProgress
    with DiagnosticableTreeMixin {
  const _$MilestoneProgressImpl(
      {this.completedDaysCount = 0,
      this.targetDaysCount = 7,
      final List<Session> sessions = const []})
      : _sessions = sessions,
        super._();

  factory _$MilestoneProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$MilestoneProgressImplFromJson(json);

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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MilestoneProgress(completedDaysCount: $completedDaysCount, targetDaysCount: $targetDaysCount, sessions: $sessions)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
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
            other is _$MilestoneProgressImpl &&
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

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MilestoneProgressImplCopyWith<_$MilestoneProgressImpl> get copyWith =>
      __$$MilestoneProgressImplCopyWithImpl<_$MilestoneProgressImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MilestoneProgressImplToJson(
      this,
    );
  }
}

abstract class _MilestoneProgress extends MilestoneProgress {
  const factory _MilestoneProgress(
      {final int completedDaysCount,
      final int targetDaysCount,
      final List<Session> sessions}) = _$MilestoneProgressImpl;
  const _MilestoneProgress._() : super._();

  factory _MilestoneProgress.fromJson(Map<String, dynamic> json) =
      _$MilestoneProgressImpl.fromJson;

  @override
  int get completedDaysCount;
  @override
  int get targetDaysCount;
  @override
  List<Session> get sessions;

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MilestoneProgressImplCopyWith<_$MilestoneProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
