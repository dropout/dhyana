// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'year.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Year _$YearFromJson(Map<String, dynamic> json) {
  return _Year.fromJson(json);
}

/// @nodoc
mixin _$Year {
  String get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get startDate => throw _privateConstructorUsedError;
  int get minutesCount => throw _privateConstructorUsedError;
  int get sessionCount => throw _privateConstructorUsedError;

  /// Serializes this Year to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Year
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $YearCopyWith<Year> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $YearCopyWith<$Res> {
  factory $YearCopyWith(Year value, $Res Function(Year) then) =
      _$YearCopyWithImpl<$Res, Year>;
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime startDate,
      int minutesCount,
      int sessionCount});
}

/// @nodoc
class _$YearCopyWithImpl<$Res, $Val extends Year>
    implements $YearCopyWith<$Res> {
  _$YearCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Year
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? minutesCount = null,
    Object? sessionCount = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutesCount: null == minutesCount
          ? _value.minutesCount
          : minutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      sessionCount: null == sessionCount
          ? _value.sessionCount
          : sessionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$YearImplCopyWith<$Res> implements $YearCopyWith<$Res> {
  factory _$$YearImplCopyWith(
          _$YearImpl value, $Res Function(_$YearImpl) then) =
      __$$YearImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime startDate,
      int minutesCount,
      int sessionCount});
}

/// @nodoc
class __$$YearImplCopyWithImpl<$Res>
    extends _$YearCopyWithImpl<$Res, _$YearImpl>
    implements _$$YearImplCopyWith<$Res> {
  __$$YearImplCopyWithImpl(_$YearImpl _value, $Res Function(_$YearImpl) _then)
      : super(_value, _then);

  /// Create a copy of Year
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = null,
    Object? minutesCount = null,
    Object? sessionCount = null,
  }) {
    return _then(_$YearImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: null == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutesCount: null == minutesCount
          ? _value.minutesCount
          : minutesCount // ignore: cast_nullable_to_non_nullable
              as int,
      sessionCount: null == sessionCount
          ? _value.sessionCount
          : sessionCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$YearImpl extends _Year with DiagnosticableTreeMixin {
  const _$YearImpl(
      {required this.id,
      @DateTimeConverter() required this.startDate,
      this.minutesCount = 0,
      this.sessionCount = 0})
      : super._();

  factory _$YearImpl.fromJson(Map<String, dynamic> json) =>
      _$$YearImplFromJson(json);

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

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Year(id: $id, startDate: $startDate, minutesCount: $minutesCount, sessionCount: $sessionCount)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Year'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('startDate', startDate))
      ..add(DiagnosticsProperty('minutesCount', minutesCount))
      ..add(DiagnosticsProperty('sessionCount', sessionCount));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$YearImpl &&
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

  /// Create a copy of Year
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$YearImplCopyWith<_$YearImpl> get copyWith =>
      __$$YearImplCopyWithImpl<_$YearImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$YearImplToJson(
      this,
    );
  }
}

abstract class _Year extends Year {
  const factory _Year(
      {required final String id,
      @DateTimeConverter() required final DateTime startDate,
      final int minutesCount,
      final int sessionCount}) = _$YearImpl;
  const _Year._() : super._();

  factory _Year.fromJson(Map<String, dynamic> json) = _$YearImpl.fromJson;

  @override
  String get id;
  @override
  @DateTimeConverter()
  DateTime get startDate;
  @override
  int get minutesCount;
  @override
  int get sessionCount;

  /// Create a copy of Year
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$YearImplCopyWith<_$YearImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
