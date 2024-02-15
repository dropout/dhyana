// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'public_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicProfile _$PublicProfileFromJson(Map<String, dynamic> json) {
  return _PublicProfile.fromJson(json);
}

/// @nodoc
mixin _$PublicProfile {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get photoUrl => throw _privateConstructorUsedError;
  String get photoBlurhash => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PublicProfileCopyWith<PublicProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicProfileCopyWith<$Res> {
  factory $PublicProfileCopyWith(
          PublicProfile value, $Res Function(PublicProfile) then) =
      _$PublicProfileCopyWithImpl<$Res, PublicProfile>;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String photoUrl,
      String photoBlurhash});
}

/// @nodoc
class _$PublicProfileCopyWithImpl<$Res, $Val extends PublicProfile>
    implements $PublicProfileCopyWith<$Res> {
  _$PublicProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? photoUrl = null,
    Object? photoBlurhash = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      photoBlurhash: null == photoBlurhash
          ? _value.photoBlurhash
          : photoBlurhash // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicProfileImplCopyWith<$Res>
    implements $PublicProfileCopyWith<$Res> {
  factory _$$PublicProfileImplCopyWith(
          _$PublicProfileImpl value, $Res Function(_$PublicProfileImpl) then) =
      __$$PublicProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String photoUrl,
      String photoBlurhash});
}

/// @nodoc
class __$$PublicProfileImplCopyWithImpl<$Res>
    extends _$PublicProfileCopyWithImpl<$Res, _$PublicProfileImpl>
    implements _$$PublicProfileImplCopyWith<$Res> {
  __$$PublicProfileImplCopyWithImpl(
      _$PublicProfileImpl _value, $Res Function(_$PublicProfileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? photoUrl = null,
    Object? photoBlurhash = null,
  }) {
    return _then(_$PublicProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      photoBlurhash: null == photoBlurhash
          ? _value.photoBlurhash
          : photoBlurhash // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicProfileImpl
    with DiagnosticableTreeMixin
    implements _PublicProfile {
  const _$PublicProfileImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.photoUrl,
      required this.photoBlurhash});

  factory _$PublicProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String photoUrl;
  @override
  final String photoBlurhash;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PublicProfile(id: $id, firstName: $firstName, lastName: $lastName, photoUrl: $photoUrl, photoBlurhash: $photoBlurhash)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PublicProfile'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('photoBlurhash', photoBlurhash));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.photoBlurhash, photoBlurhash) ||
                other.photoBlurhash == photoBlurhash));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, firstName, lastName, photoUrl, photoBlurhash);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicProfileImplCopyWith<_$PublicProfileImpl> get copyWith =>
      __$$PublicProfileImplCopyWithImpl<_$PublicProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicProfileImplToJson(
      this,
    );
  }
}

abstract class _PublicProfile implements PublicProfile {
  const factory _PublicProfile(
      {required final String id,
      required final String firstName,
      required final String lastName,
      required final String photoUrl,
      required final String photoBlurhash}) = _$PublicProfileImpl;

  factory _PublicProfile.fromJson(Map<String, dynamic> json) =
      _$PublicProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get photoUrl;
  @override
  String get photoBlurhash;
  @override
  @JsonKey(ignore: true)
  _$$PublicProfileImplCopyWith<_$PublicProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
