// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Day _$DayFromJson(Map<String, dynamic> json) {
  return _Day.fromJson(json);
}

/// @nodoc
mixin _$Day {
  String get id => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get date => throw _privateConstructorUsedError;
  List<Session> get sessions => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayCopyWith<Day> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayCopyWith<$Res> {
  factory $DayCopyWith(Day value, $Res Function(Day) then) =
      _$DayCopyWithImpl<$Res, Day>;
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime date,
      List<Session> sessions,
      int minutes});
}

/// @nodoc
class _$DayCopyWithImpl<$Res, $Val extends Day> implements $DayCopyWith<$Res> {
  _$DayCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? sessions = null,
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
      sessions: null == sessions
          ? _value.sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DayCopyWith<$Res> implements $DayCopyWith<$Res> {
  factory _$$_DayCopyWith(_$_Day value, $Res Function(_$_Day) then) =
      __$$_DayCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @DateTimeConverter() DateTime date,
      List<Session> sessions,
      int minutes});
}

/// @nodoc
class __$$_DayCopyWithImpl<$Res> extends _$DayCopyWithImpl<$Res, _$_Day>
    implements _$$_DayCopyWith<$Res> {
  __$$_DayCopyWithImpl(_$_Day _value, $Res Function(_$_Day) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? sessions = null,
    Object? minutes = null,
  }) {
    return _then(_$_Day(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      sessions: null == sessions
          ? _value._sessions
          : sessions // ignore: cast_nullable_to_non_nullable
              as List<Session>,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Day extends _Day with DiagnosticableTreeMixin {
  const _$_Day(
      {required this.id,
      @DateTimeConverter() required this.date,
      required final List<Session> sessions,
      required this.minutes})
      : _sessions = sessions,
        super._();

  factory _$_Day.fromJson(Map<String, dynamic> json) => _$$_DayFromJson(json);

  @override
  final String id;
  @override
  @DateTimeConverter()
  final DateTime date;
  final List<Session> _sessions;
  @override
  List<Session> get sessions {
    if (_sessions is EqualUnmodifiableListView) return _sessions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sessions);
  }

  @override
  final int minutes;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Day(id: $id, date: $date, sessions: $sessions, minutes: $minutes)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Day'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('date', date))
      ..add(DiagnosticsProperty('sessions', sessions))
      ..add(DiagnosticsProperty('minutes', minutes));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Day &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._sessions, _sessions) &&
            (identical(other.minutes, minutes) || other.minutes == minutes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, date,
      const DeepCollectionEquality().hash(_sessions), minutes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DayCopyWith<_$_Day> get copyWith =>
      __$$_DayCopyWithImpl<_$_Day>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayToJson(
      this,
    );
  }
}

abstract class _Day extends Day {
  const factory _Day(
      {required final String id,
      @DateTimeConverter() required final DateTime date,
      required final List<Session> sessions,
      required final int minutes}) = _$_Day;
  const _Day._() : super._();

  factory _Day.fromJson(Map<String, dynamic> json) = _$_Day.fromJson;

  @override
  String get id;
  @override
  @DateTimeConverter()
  DateTime get date;
  @override
  List<Session> get sessions;
  @override
  int get minutes;
  @override
  @JsonKey(ignore: true)
  _$$_DayCopyWith<_$_Day> get copyWith => throw _privateConstructorUsedError;
}
