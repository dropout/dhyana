// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Milestone implements DiagnosticableTreeMixin {
  String get id;
  List<Day> get days;

  /// Create a copy of Milestone
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MilestoneCopyWith<Milestone> get copyWith =>
      _$MilestoneCopyWithImpl<Milestone>(this as Milestone, _$identity);

  /// Serializes this Milestone to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Milestone'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('days', days));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Milestone &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other.days, days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(days));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Milestone(id: $id, days: $days)';
  }
}

/// @nodoc
abstract mixin class $MilestoneCopyWith<$Res> {
  factory $MilestoneCopyWith(Milestone value, $Res Function(Milestone) _then) =
      _$MilestoneCopyWithImpl;
  @useResult
  $Res call({String id, List<Day> days});
}

/// @nodoc
class _$MilestoneCopyWithImpl<$Res> implements $MilestoneCopyWith<$Res> {
  _$MilestoneCopyWithImpl(this._self, this._then);

  final Milestone _self;
  final $Res Function(Milestone) _then;

  /// Create a copy of Milestone
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? days = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _self.days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Milestone extends Milestone with DiagnosticableTreeMixin {
  const _Milestone({required this.id, final List<Day> days = const []})
      : _days = days,
        super._();
  factory _Milestone.fromJson(Map<String, dynamic> json) =>
      _$MilestoneFromJson(json);

  @override
  final String id;
  final List<Day> _days;
  @override
  @JsonKey()
  List<Day> get days {
    if (_days is EqualUnmodifiableListView) return _days;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_days);
  }

  /// Create a copy of Milestone
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MilestoneCopyWith<_Milestone> get copyWith =>
      __$MilestoneCopyWithImpl<_Milestone>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MilestoneToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Milestone'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('days', days));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Milestone &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._days, _days));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_days));

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Milestone(id: $id, days: $days)';
  }
}

/// @nodoc
abstract mixin class _$MilestoneCopyWith<$Res>
    implements $MilestoneCopyWith<$Res> {
  factory _$MilestoneCopyWith(
          _Milestone value, $Res Function(_Milestone) _then) =
      __$MilestoneCopyWithImpl;
  @override
  @useResult
  $Res call({String id, List<Day> days});
}

/// @nodoc
class __$MilestoneCopyWithImpl<$Res> implements _$MilestoneCopyWith<$Res> {
  __$MilestoneCopyWithImpl(this._self, this._then);

  final _Milestone _self;
  final $Res Function(_Milestone) _then;

  /// Create a copy of Milestone
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? days = null,
  }) {
    return _then(_Milestone(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      days: null == days
          ? _self._days
          : days // ignore: cast_nullable_to_non_nullable
              as List<Day>,
    ));
  }
}

// dart format on
