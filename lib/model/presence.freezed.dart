// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Presence _$PresenceFromJson(Map<String, dynamic> json) {
  return _Presence.fromJson(json);
}

/// @nodoc
mixin _$Presence {
  String get id => throw _privateConstructorUsedError;
  PublicProfile get who => throw _privateConstructorUsedError;
  DateTime get startedAt => throw _privateConstructorUsedError;
  DateTime? get finishedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PresenceCopyWith<Presence> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceCopyWith<$Res> {
  factory $PresenceCopyWith(Presence value, $Res Function(Presence) then) =
      _$PresenceCopyWithImpl<$Res, Presence>;
  @useResult
  $Res call(
      {String id, PublicProfile who, DateTime startedAt, DateTime? finishedAt});

  $PublicProfileCopyWith<$Res> get who;
}

/// @nodoc
class _$PresenceCopyWithImpl<$Res, $Val extends Presence>
    implements $PresenceCopyWith<$Res> {
  _$PresenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? who = null,
    Object? startedAt = null,
    Object? finishedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      who: null == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as PublicProfile,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PublicProfileCopyWith<$Res> get who {
    return $PublicProfileCopyWith<$Res>(_value.who, (value) {
      return _then(_value.copyWith(who: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PresenceCopyWith<$Res> implements $PresenceCopyWith<$Res> {
  factory _$$_PresenceCopyWith(
          _$_Presence value, $Res Function(_$_Presence) then) =
      __$$_PresenceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, PublicProfile who, DateTime startedAt, DateTime? finishedAt});

  @override
  $PublicProfileCopyWith<$Res> get who;
}

/// @nodoc
class __$$_PresenceCopyWithImpl<$Res>
    extends _$PresenceCopyWithImpl<$Res, _$_Presence>
    implements _$$_PresenceCopyWith<$Res> {
  __$$_PresenceCopyWithImpl(
      _$_Presence _value, $Res Function(_$_Presence) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? who = null,
    Object? startedAt = null,
    Object? finishedAt = freezed,
  }) {
    return _then(_$_Presence(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      who: null == who
          ? _value.who
          : who // ignore: cast_nullable_to_non_nullable
              as PublicProfile,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      finishedAt: freezed == finishedAt
          ? _value.finishedAt
          : finishedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Presence extends _Presence with DiagnosticableTreeMixin {
  const _$_Presence(
      {required this.id,
      required this.who,
      required this.startedAt,
      this.finishedAt})
      : super._();

  factory _$_Presence.fromJson(Map<String, dynamic> json) =>
      _$$_PresenceFromJson(json);

  @override
  final String id;
  @override
  final PublicProfile who;
  @override
  final DateTime startedAt;
  @override
  final DateTime? finishedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Presence(id: $id, who: $who, startedAt: $startedAt, finishedAt: $finishedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Presence'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('who', who))
      ..add(DiagnosticsProperty('startedAt', startedAt))
      ..add(DiagnosticsProperty('finishedAt', finishedAt));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Presence &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.who, who) || other.who == who) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.finishedAt, finishedAt) ||
                other.finishedAt == finishedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, who, startedAt, finishedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PresenceCopyWith<_$_Presence> get copyWith =>
      __$$_PresenceCopyWithImpl<_$_Presence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PresenceToJson(
      this,
    );
  }
}

abstract class _Presence extends Presence {
  const factory _Presence(
      {required final String id,
      required final PublicProfile who,
      required final DateTime startedAt,
      final DateTime? finishedAt}) = _$_Presence;
  const _Presence._() : super._();

  factory _Presence.fromJson(Map<String, dynamic> json) = _$_Presence.fromJson;

  @override
  String get id;
  @override
  PublicProfile get who;
  @override
  DateTime get startedAt;
  @override
  DateTime? get finishedAt;
  @override
  @JsonKey(ignore: true)
  _$$_PresenceCopyWith<_$_Presence> get copyWith =>
      throw _privateConstructorUsedError;
}
