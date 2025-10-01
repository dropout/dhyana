// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
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
  int get completedDaysCount; // Update default targetDaysCount in firebase function onbeforeCreateUser too
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

/// Adds pattern-matching-related methods to [MilestoneProgress].
extension MilestoneProgressPatterns on MilestoneProgress {
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
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_MilestoneProgress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MilestoneProgress() when $default != null:
        return $default(_that);
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
  TResult map<TResult extends Object?>(
    TResult Function(_MilestoneProgress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MilestoneProgress():
        return $default(_that);
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
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_MilestoneProgress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MilestoneProgress() when $default != null:
        return $default(_that);
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
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(int completedDaysCount, int targetDaysCount,
            List<Session> sessions)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _MilestoneProgress() when $default != null:
        return $default(
            _that.completedDaysCount, _that.targetDaysCount, _that.sessions);
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
  TResult when<TResult extends Object?>(
    TResult Function(
            int completedDaysCount, int targetDaysCount, List<Session> sessions)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MilestoneProgress():
        return $default(
            _that.completedDaysCount, _that.targetDaysCount, _that.sessions);
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
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(int completedDaysCount, int targetDaysCount,
            List<Session> sessions)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _MilestoneProgress() when $default != null:
        return $default(
            _that.completedDaysCount, _that.targetDaysCount, _that.sessions);
      case _:
        return null;
    }
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
// Update default targetDaysCount in firebase function onbeforeCreateUser too
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
