// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Week implements DiagnosticableTreeMixin {
  String get id;
  @DateTimeConverter()
  DateTime get startDate;
  int get minutesCount;
  int get sessionCount;

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WeekCopyWith<Week> get copyWith =>
      _$WeekCopyWithImpl<Week>(this as Week, _$identity);

  /// Serializes this Week to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Week'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('minutesCount', minutesCount))
      ..add(DiagnosticsProperty('sessionCount', sessionCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Week &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.minutesCount, minutesCount) ||
                other.minutesCount == minutesCount) &&
            (identical(other.sessionCount, sessionCount) ||
                other.sessionCount == sessionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startDate, minutesCount, sessionCount);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Week(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
  }
}

/// @nodoc
abstract mixin class $WeekCopyWith<$Res> {
  factory $WeekCopyWith(Week value, $Res Function(Week) _then) =
      _$WeekCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime startDate,
      int minutesCount,
      int sessionCount});
}

/// @nodoc
class _$WeekCopyWithImpl<$Res> implements $WeekCopyWith<$Res> {
  _$WeekCopyWithImpl(this._self, this._then);

  final Week _self;
  final $Res Function(Week) _then;

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? minutesCount = null,
    Object? sessionCount = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutesCount: null == minutesCount
          ? _self.minutesCount
          : minutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      sessionCount: null == sessionCount
          ? _self.sessionCount
          : sessionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Week extends Week with DiagnosticableTreeMixin {
  const _Week(
      {required this.id,
      @DateTimeConverter() required this.startDate,
      this.minutesCount = 0,
      this.sessionCount = 0})
      : super._();
  factory _Week.fromJson(Map<String, dynamic> json) => _$WeekFromJson(json);

  @override
  final String id;
  @override
  @DateTimeConverter()
  final DateTime startDate;
  @override
  @JsonKey()
  final int minutesCount;
  @override
  @JsonKey()
  final int sessionCount;

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WeekCopyWith<_Week> get copyWith =>
      __$WeekCopyWithImpl<_Week>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WeekToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Week'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('minutesCount', minutesCount))
      ..add(DiagnosticsProperty('sessionCount', sessionCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Week &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.minutesCount, minutesCount) ||
                other.minutesCount == minutesCount) &&
            (identical(other.sessionCount, sessionCount) ||
                other.sessionCount == sessionCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, startDate, minutesCount, sessionCount);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Week(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
  }
}

/// @nodoc
abstract mixin class _$WeekCopyWith<$Res> implements $WeekCopyWith<$Res> {
  factory _$WeekCopyWith(_Week value, $Res Function(_Week) _then) =
      __$WeekCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime startDate,
      int minutesCount,
      int sessionCount});
}

/// @nodoc
class __$WeekCopyWithImpl<$Res> implements _$WeekCopyWith<$Res> {
  __$WeekCopyWithImpl(this._self, this._then);

  final _Week _self;
  final $Res Function(_Week) _then;

  /// Create a copy of Week
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? minutesCount = null,
    Object? sessionCount = null,
  }) {
    return _then(_Week(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutesCount: null == minutesCount
          ? _self.minutesCount
          : minutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      sessionCount: null == sessionCount
          ? _self.sessionCount
          : sessionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
