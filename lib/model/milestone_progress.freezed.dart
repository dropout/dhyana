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
  int get daysCompleted => throw _privateConstructorUsedError;
  List<Day> get completedDays => throw _privateConstructorUsedError;

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
  $Res call({int daysCompleted, List<Day> completedDays});
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
    Object? daysCompleted = null,
    Object? completedDays = null,
  }) {
    return _then(_value.copyWith(
      daysCompleted: null == daysCompleted
          ? _value.daysCompleted
          : daysCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      completedDays: null == completedDays
          ? _value.completedDays
          : completedDays // ignore: cast_nullable_to_non_nullable
              as List<Day>,
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
  $Res call({int daysCompleted, List<Day> completedDays});
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
    Object? daysCompleted = null,
    Object? completedDays = null,
  }) {
    return _then(_$MilestoneProgressImpl(
      daysCompleted: null == daysCompleted
          ? _value.daysCompleted
          : daysCompleted // ignore: cast_nullable_to_non_nullable
              as int,
      completedDays: null == completedDays
          ? _value._completedDays
          : completedDays // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MilestoneProgressImpl extends _MilestoneProgress
    with DiagnosticableTreeMixin {
  const _$MilestoneProgressImpl(
      {this.daysCompleted = 0, final List<Day> completedDays = const []})
      : _completedDays = completedDays,
        super._();

  factory _$MilestoneProgressImpl.fromJson(Map<String, dynamic> json) =>
      _$$MilestoneProgressImplFromJson(json);

  @override
  @JsonKey()
  final int daysCompleted;
  final List<Day> _completedDays;
  @override
  @JsonKey()
  List<Day> get completedDays {
    if (_completedDays is EqualUnmodifiableListView) return _completedDays;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_completedDays);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'MilestoneProgress(daysCompleted: $daysCompleted, completedDays: $completedDays)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'MilestoneProgress'))
      ..add(DiagnosticsProperty('daysCompleted', daysCompleted))
      ..add(DiagnosticsProperty('completedDays', completedDays));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MilestoneProgressImpl &&
            (identical(other.daysCompleted, daysCompleted) ||
                other.daysCompleted == daysCompleted) &&
            const DeepCollectionEquality()
                .equals(other._completedDays, _completedDays));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, daysCompleted,
      const DeepCollectionEquality().hash(_completedDays));

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
      {final int daysCompleted,
      final List<Day> completedDays}) = _$MilestoneProgressImpl;
  const _MilestoneProgress._() : super._();

  factory _MilestoneProgress.fromJson(Map<String, dynamic> json) =
      _$MilestoneProgressImpl.fromJson;

  @override
  int get daysCompleted;
  @override
  List<Day> get completedDays;

  /// Create a copy of MilestoneProgress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MilestoneProgressImplCopyWith<_$MilestoneProgressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
