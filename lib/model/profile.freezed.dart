// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Profile implements DiagnosticableTreeMixin {
  String get id;
  String get firstName;
  String get lastName;
  String get email;
  String get photoUrl;
  String get photoBlurhash;
  @DateTimeConverter()
  DateTime get signupDate;
  ProfileStatisticsReport get statsReport;
  bool get completed;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<Profile> get copyWith =>
      _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Profile'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('photoBlurhash', photoBlurhash))
      ..add(DiagnosticsProperty('signupDate', signupDate))
      ..add(DiagnosticsProperty('statsReport', statsReport))
      ..add(DiagnosticsProperty('completed', completed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.photoBlurhash, photoBlurhash) ||
                other.photoBlurhash == photoBlurhash) &&
            (identical(other.signupDate, signupDate) ||
                other.signupDate == signupDate) &&
            (identical(other.statsReport, statsReport) ||
                other.statsReport == statsReport) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      photoUrl, photoBlurhash, signupDate, statsReport, completed);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Profile(id: $id, firstName: $firstName, lastName: $lastName, email: $email, photoUrl: $photoUrl, photoBlurhash: $photoBlurhash, signupDate: $signupDate, statsReport: $statsReport, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) =
      _$ProfileCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String email,
      String photoUrl,
      String photoBlurhash,
      @DateTimeConverter() DateTime signupDate,
      ProfileStatisticsReport statsReport,
      bool completed});

  $ProfileStatisticsReportCopyWith<$Res> get statsReport;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? photoUrl = null,
    Object? photoBlurhash = null,
    Object? signupDate = null,
    Object? statsReport = null,
    Object? completed = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      photoBlurhash: null == photoBlurhash
          ? _self.photoBlurhash
          : photoBlurhash // ignore: cast_nullable_to_non_nullable
              as String,
      signupDate: null == signupDate
          ? _self.signupDate
          : signupDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statsReport: null == statsReport
          ? _self.statsReport
          : statsReport // ignore: cast_nullable_to_non_nullable
              as ProfileStatisticsReport,
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileStatisticsReportCopyWith<$Res> get statsReport {
    return $ProfileStatisticsReportCopyWith<$Res>(_self.statsReport, (value) {
      return _then(_self.copyWith(statsReport: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Profile extends Profile with DiagnosticableTreeMixin {
  const _Profile(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.photoUrl,
      required this.photoBlurhash,
      @DateTimeConverter() required this.signupDate,
      required this.statsReport,
      required this.completed})
      : super._();
  factory _Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String photoUrl;
  @override
  final String photoBlurhash;
  @override
  @DateTimeConverter()
  final DateTime signupDate;
  @override
  final ProfileStatisticsReport statsReport;
  @override
  final bool completed;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileToJson(
      this,
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
      ..add(DiagnosticsProperty('type', 'Profile'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('firstName', firstName))
      ..add(DiagnosticsProperty('lastName', lastName))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('photoUrl', photoUrl))
      ..add(DiagnosticsProperty('photoBlurhash', photoBlurhash))
      ..add(DiagnosticsProperty('signupDate', signupDate))
      ..add(DiagnosticsProperty('statsReport', statsReport))
      ..add(DiagnosticsProperty('completed', completed));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Profile &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.photoBlurhash, photoBlurhash) ||
                other.photoBlurhash == photoBlurhash) &&
            (identical(other.signupDate, signupDate) ||
                other.signupDate == signupDate) &&
            (identical(other.statsReport, statsReport) ||
                other.statsReport == statsReport) &&
            (identical(other.completed, completed) ||
                other.completed == completed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName, email,
      photoUrl, photoBlurhash, signupDate, statsReport, completed);

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Profile(id: $id, firstName: $firstName, lastName: $lastName, email: $email, photoUrl: $photoUrl, photoBlurhash: $photoBlurhash, signupDate: $signupDate, statsReport: $statsReport, completed: $completed)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) =
      __$ProfileCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String email,
      String photoUrl,
      String photoBlurhash,
      @DateTimeConverter() DateTime signupDate,
      ProfileStatisticsReport statsReport,
      bool completed});

  @override
  $ProfileStatisticsReportCopyWith<$Res> get statsReport;
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? photoUrl = null,
    Object? photoBlurhash = null,
    Object? signupDate = null,
    Object? statsReport = null,
    Object? completed = null,
  }) {
    return _then(_Profile(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrl: null == photoUrl
          ? _self.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as String,
      photoBlurhash: null == photoBlurhash
          ? _self.photoBlurhash
          : photoBlurhash // ignore: cast_nullable_to_non_nullable
              as String,
      signupDate: null == signupDate
          ? _self.signupDate
          : signupDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      statsReport: null == statsReport
          ? _self.statsReport
          : statsReport // ignore: cast_nullable_to_non_nullable
              as ProfileStatisticsReport,
      completed: null == completed
          ? _self.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileStatisticsReportCopyWith<$Res> get statsReport {
    return $ProfileStatisticsReportCopyWith<$Res>(_self.statsReport, (value) {
      return _then(_self.copyWith(statsReport: value));
    });
  }
}

// dart format on
