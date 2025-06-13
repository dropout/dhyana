// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Presence implements DiagnosticableTreeMixin {
  String get id;
  PublicProfile get profile;
  @DateTimeConverter()
  DateTime get startedAt;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PresenceCopyWith<Presence> get copyWith =>
      _$PresenceCopyWithImpl<Presence>(this as Presence, _$identity);

  /// Serializes this Presence to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is Presence &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, profile, startedAt);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Presence(id: $id, profile: $profile, startedAt: $startedAt)';
  }
}

/// @nodoc
abstract mixin class $PresenceCopyWith<$Res> {
  factory $PresenceCopyWith(Presence value, $Res Function(Presence) _then) =
      _$PresenceCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      PublicProfile profile,
      @DateTimeConverter() DateTime startedAt});

  $PublicProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$PresenceCopyWithImpl<$Res> implements $PresenceCopyWith<$Res> {
  _$PresenceCopyWithImpl(this._self, this._then);

  final Presence _self;
  final $Res Function(Presence) _then;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? profile = null,
    Object? startedAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as PublicProfile,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PublicProfileCopyWith<$Res> get profile {
    return $PublicProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Presence extends Presence with DiagnosticableTreeMixin {
  const _Presence(
      {required this.id,
      required this.profile,
      @DateTimeConverter() required this.startedAt})
      : super._();
  factory _Presence.fromJson(Map<String, dynamic> json) =>
      _$PresenceFromJson(json);

  @override
  final String id;
  @override
  final PublicProfile profile;
  @override
  @DateTimeConverter()
  final DateTime startedAt;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PresenceCopyWith<_Presence> get copyWith =>
      __$PresenceCopyWithImpl<_Presence>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PresenceToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
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
            other is _Presence &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, profile, startedAt);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Presence(id: $id, profile: $profile, startedAt: $startedAt)';
  }
}

/// @nodoc
abstract mixin class _$PresenceCopyWith<$Res>
    implements $PresenceCopyWith<$Res> {
  factory _$PresenceCopyWith(_Presence value, $Res Function(_Presence) _then) =
      __$PresenceCopyWithImpl;
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
class __$PresenceCopyWithImpl<$Res> implements _$PresenceCopyWith<$Res> {
  __$PresenceCopyWithImpl(this._self, this._then);

  final _Presence _self;
  final $Res Function(_Presence) _then;

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? profile = null,
    Object? startedAt = null,
  }) {
    return _then(_Presence(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as PublicProfile,
      startedAt: null == startedAt
          ? _self.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }

  /// Create a copy of Presence
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PublicProfileCopyWith<$Res> get profile {
    return $PublicProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

// dart format on
