// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'month.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Month _$MonthFromJson(Map<String, dynamic> json) {
  return _Month.fromJson(json);
}

/// @nodoc
mixin _$Month {
  String get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get date => throw _privateConstructorUsedError;
  int get sessionCount => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;

  /// Serializes this Month to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Month
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthCopyWith<Month> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthCopyWith<$Res> {
  factory $MonthCopyWith(Month value, $Res Function(Month) then) =
      _$MonthCopyWithImpl<$Res, Month>;
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime date,
      int sessionCount,
      int minutes});
}

/// @nodoc
class _$MonthCopyWithImpl<$Res, $Val extends Month>
    implements $MonthCopyWith<$Res> {
  _$MonthCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Month
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? sessionCount = null,
    Object? minutes = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionCount: null == sessionCount
          ? _value.sessionCount
          : sessionCount // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthImplCopyWith<$Res> implements $MonthCopyWith<$Res> {
  factory _$$MonthImplCopyWith(
          _$MonthImpl value, $Res Function(_$MonthImpl) then) =
      __$$MonthImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime date,
      int sessionCount,
      int minutes});
}

/// @nodoc
class __$$MonthImplCopyWithImpl<$Res>
    extends _$MonthCopyWithImpl<$Res, _$MonthImpl>
    implements _$$MonthImplCopyWith<$Res> {
  __$$MonthImplCopyWithImpl(
      _$MonthImpl _value, $Res Function(_$MonthImpl) _then)
      : super(_value, _then);

  /// Create a copy of Month
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? sessionCount = null,
    Object? minutes = null,
  }) {
    return _then(_$MonthImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessionCount: null == sessionCount
          ? _value.sessionCount
          : sessionCount // ignore: cast_nullable_to_non_nullable
              as int,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthImpl extends _Month with DiagnosticableTreeMixin {
  const _$MonthImpl(
      {required this.id,
      @DateTimeConverter() required this.date,
      required this.sessionCount,
      required this.minutes})
      : super._();

  factory _$MonthImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthImplFromJson(json);

  @override
  final String id;
  @override
  @DateTimeConverter()
  final DateTime date;
  @override
  final int sessionCount;
  @override
  final int minutes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Month(id: $id, date: $date, sessionCount: $sessionCount, minutes: $minutes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Month'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('sessionCount', sessionCount))
      ..add(DiagnosticsProperty('minutes', minutes));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.sessionCount, sessionCount) ||
                other.sessionCount == sessionCount) &&
            (identical(other.minutes, minutes) || other.minutes == minutes));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, date, sessionCount, minutes);

  /// Create a copy of Month
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthImplCopyWith<_$MonthImpl> get copyWith =>
      __$$MonthImplCopyWithImpl<_$MonthImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthImplToJson(
      this,
    );
  }
}

abstract class _Month extends Month {
  const factory _Month(
      {required final String id,
      @DateTimeConverter() required final DateTime date,
      required final int sessionCount,
      required final int minutes}) = _$MonthImpl;
  const _Month._() : super._();

  factory _Month.fromJson(Map<String, dynamic> json) = _$MonthImpl.fromJson;

  @override
  String get id;
  @override
  @DateTimeConverter()
  DateTime get date;
  @override
  int get sessionCount;
  @override
  int get minutes;

  /// Create a copy of Month
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthImplCopyWith<_$MonthImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
