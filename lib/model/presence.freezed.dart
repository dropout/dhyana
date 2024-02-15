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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Presence _$PresenceFromJson(Map<String, dynamic> json) {
  return _Presence.fromJson(json);
}

/// @nodoc
mixin _$Presence {
  String get id => throw _privateConstructorUsedError;
  PublicProfile get profile => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime get startedAt => throw _privateConstructorUsedError;

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
      {String id,
      PublicProfile profile,
      @DateTimeConverter() DateTime startedAt});

  $PublicProfileCopyWith<$Res> get profile;
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
    Object? profile = null,
    Object? startedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as PublicProfile,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PublicProfileCopyWith<$Res> get profile {
    return $PublicProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PresenceImplCopyWith<$Res>
    implements $PresenceCopyWith<$Res> {
  factory _$$PresenceImplCopyWith(
          _$PresenceImpl value, $Res Function(_$PresenceImpl) then) =
      __$$PresenceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      PublicProfile profile,
      @DateTimeConverter() DateTime startedAt});

  @override
  $PublicProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$PresenceImplCopyWithImpl<$Res>
    extends _$PresenceCopyWithImpl<$Res, _$PresenceImpl>
    implements _$$PresenceImplCopyWith<$Res> {
  __$$PresenceImplCopyWithImpl(
      _$PresenceImpl _value, $Res Function(_$PresenceImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profile = null,
    Object? startedAt = null,
  }) {
    return _then(_$PresenceImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as PublicProfile,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PresenceImpl extends _Presence with DiagnosticableTreeMixin {
  const _$PresenceImpl(
      {required this.id,
      required this.profile,
      @DateTimeConverter() required this.startedAt})
      : super._();

  factory _$PresenceImpl.fromJson(Map<String, dynamic> json) =>
      _$$PresenceImplFromJson(json);

  @override
  final String id;
  @override
  final PublicProfile profile;
  @override
  @DateTimeConverter()
  final DateTime startedAt;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Presence(id: $id, profile: $profile, startedAt: $startedAt)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Presence'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('profile', profile))
      ..add(DiagnosticsProperty('startedAt', startedAt));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, profile, startedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      __$$PresenceImplCopyWithImpl<_$PresenceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PresenceImplToJson(
      this,
    );
  }
}

abstract class _Presence extends Presence {
  const factory _Presence(
      {required final String id,
      required final PublicProfile profile,
      @DateTimeConverter() required final DateTime startedAt}) = _$PresenceImpl;
  const _Presence._() : super._();

  factory _Presence.fromJson(Map<String, dynamic> json) =
      _$PresenceImpl.fromJson;

  @override
  String get id;
  @override
  PublicProfile get profile;
  @override
  @DateTimeConverter()
  DateTime get startedAt;
  @override
  @JsonKey(ignore: true)
  _$$PresenceImplCopyWith<_$PresenceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
