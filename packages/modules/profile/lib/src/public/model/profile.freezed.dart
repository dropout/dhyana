// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Profile implements DiagnosticableTreeMixin {

 String get id; String get firstName; String get lastName; String get email; String? get photoUrl; String? get photoBlurhash; ProfileSettings get settings;@DateTimeConverter() DateTime get signupDate; ProfileStatsReport get statsReport; bool get completed; Location? get location;
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCopyWith<Profile> get copyWith => _$ProfileCopyWithImpl<Profile>(this as Profile, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as Profile;
  properties
    ..add(DiagnosticsProperty('type', 'Profile'))
    ..add(DiagnosticsProperty('id', _this.id))..add(DiagnosticsProperty('firstName', _this.firstName))..add(DiagnosticsProperty('lastName', _this.lastName))..add(DiagnosticsProperty('email', _this.email))..add(DiagnosticsProperty('photoUrl', _this.photoUrl))..add(DiagnosticsProperty('photoBlurhash', _this.photoBlurhash))..add(DiagnosticsProperty('settings', _this.settings))..add(DiagnosticsProperty('signupDate', _this.signupDate))..add(DiagnosticsProperty('statsReport', _this.statsReport))..add(DiagnosticsProperty('completed', _this.completed))..add(DiagnosticsProperty('location', _this.location));
}

@override
bool operator ==(Object other) {
  final _this = this as Profile;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Profile&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.firstName, _this.firstName) || other.firstName == _this.firstName)&&(identical(other.lastName, _this.lastName) || other.lastName == _this.lastName)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.photoBlurhash, _this.photoBlurhash) || other.photoBlurhash == _this.photoBlurhash)&&(identical(other.settings, _this.settings) || other.settings == _this.settings)&&(identical(other.signupDate, _this.signupDate) || other.signupDate == _this.signupDate)&&(identical(other.statsReport, _this.statsReport) || other.statsReport == _this.statsReport)&&(identical(other.completed, _this.completed) || other.completed == _this.completed)&&(identical(other.location, _this.location) || other.location == _this.location));
}


@override
int get hashCode {
  final _this = this as Profile;
  return Object.hash(runtimeType,_this.id,_this.firstName,_this.lastName,_this.email,_this.photoUrl,_this.photoBlurhash,_this.settings,_this.signupDate,_this.statsReport,_this.completed,_this.location);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as Profile;
  return 'Profile(id: ${_this.id}, firstName: ${_this.firstName}, lastName: ${_this.lastName}, email: ${_this.email}, photoUrl: ${_this.photoUrl}, photoBlurhash: ${_this.photoBlurhash}, settings: ${_this.settings}, signupDate: ${_this.signupDate}, statsReport: ${_this.statsReport}, completed: ${_this.completed}, location: ${_this.location})';
}


}

/// @nodoc
abstract mixin class $ProfileCopyWith<$Res>  {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) _then) = _$ProfileCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String email, String? photoUrl, String? photoBlurhash, ProfileSettings settings,@DateTimeConverter() DateTime signupDate, ProfileStatsReport statsReport, bool completed, Location? location
});


$ProfileSettingsCopyWith<$Res> get settings;$ProfileStatsReportCopyWith<$Res> get statsReport;$LocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$ProfileCopyWithImpl<$Res>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._self, this._then);

  final Profile _self;
  final $Res Function(Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? photoUrl = freezed,Object? photoBlurhash = freezed,Object? settings = null,Object? signupDate = null,Object? statsReport = null,Object? completed = null,Object? location = freezed,}) {
  return _then(Profile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoBlurhash: freezed == photoBlurhash ? _self.photoBlurhash : photoBlurhash // ignore: cast_nullable_to_non_nullable
as String?,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as ProfileSettings,signupDate: null == signupDate ? _self.signupDate : signupDate // ignore: cast_nullable_to_non_nullable
as DateTime,statsReport: null == statsReport ? _self.statsReport : statsReport // ignore: cast_nullable_to_non_nullable
as ProfileStatsReport,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}
/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingsCopyWith<$Res> get settings {
  
  return $ProfileSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileStatsReportCopyWith<$Res> get statsReport {
  
  return $ProfileStatsReportCopyWith<$Res>(_self.statsReport, (value) {
    return _then(_self.copyWith(statsReport: value));
  });
}/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [Profile].
extension ProfilePatterns on Profile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Profile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Profile value)  $default,){
final _that = this;
switch (_that) {
case _Profile():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Profile value)?  $default,){
final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String email,  String? photoUrl,  String? photoBlurhash,  ProfileSettings settings, @DateTimeConverter()  DateTime signupDate,  ProfileStatsReport statsReport,  bool completed,  Location? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.photoUrl,_that.photoBlurhash,_that.settings,_that.signupDate,_that.statsReport,_that.completed,_that.location);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String email,  String? photoUrl,  String? photoBlurhash,  ProfileSettings settings, @DateTimeConverter()  DateTime signupDate,  ProfileStatsReport statsReport,  bool completed,  Location? location)  $default,) {final _that = this;
switch (_that) {
case _Profile():
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.photoUrl,_that.photoBlurhash,_that.settings,_that.signupDate,_that.statsReport,_that.completed,_that.location);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String email,  String? photoUrl,  String? photoBlurhash,  ProfileSettings settings, @DateTimeConverter()  DateTime signupDate,  ProfileStatsReport statsReport,  bool completed,  Location? location)?  $default,) {final _that = this;
switch (_that) {
case _Profile() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.photoUrl,_that.photoBlurhash,_that.settings,_that.signupDate,_that.statsReport,_that.completed,_that.location);case _:
  return null;

}
}

}

/// @nodoc


class _Profile extends Profile with DiagnosticableTreeMixin {
  const _Profile({required this.id, required this.firstName, required this.lastName, required this.email, required this.photoUrl, required this.photoBlurhash, this.settings = const ProfileSettings(), @DateTimeConverter() required this.signupDate, required this.statsReport, required this.completed, this.location}): super._();
  

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String email;
@override final  String? photoUrl;
@override final  String? photoBlurhash;
@override@JsonKey() final  ProfileSettings settings;
@override@DateTimeConverter() final  DateTime signupDate;
@override final  ProfileStatsReport statsReport;
@override final  bool completed;
@override final  Location? location;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCopyWith<_Profile> get copyWith => __$ProfileCopyWithImpl<_Profile>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'Profile'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('firstName', firstName))..add(DiagnosticsProperty('lastName', lastName))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('photoUrl', photoUrl))..add(DiagnosticsProperty('photoBlurhash', photoBlurhash))..add(DiagnosticsProperty('settings', settings))..add(DiagnosticsProperty('signupDate', signupDate))..add(DiagnosticsProperty('statsReport', statsReport))..add(DiagnosticsProperty('completed', completed))..add(DiagnosticsProperty('location', location));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Profile&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoBlurhash, photoBlurhash) || other.photoBlurhash == photoBlurhash)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.signupDate, signupDate) || other.signupDate == signupDate)&&(identical(other.statsReport, statsReport) || other.statsReport == statsReport)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.location, location) || other.location == location));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,firstName,lastName,email,photoUrl,photoBlurhash,settings,signupDate,statsReport,completed,location);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'Profile(id: $id, firstName: $firstName, lastName: $lastName, email: $email, photoUrl: $photoUrl, photoBlurhash: $photoBlurhash, settings: $settings, signupDate: $signupDate, statsReport: $statsReport, completed: $completed, location: $location)';
}


}

/// @nodoc
abstract mixin class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) _then) = __$ProfileCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String email, String? photoUrl, String? photoBlurhash, ProfileSettings settings,@DateTimeConverter() DateTime signupDate, ProfileStatsReport statsReport, bool completed, Location? location
});


@override $ProfileSettingsCopyWith<$Res> get settings;@override $ProfileStatsReportCopyWith<$Res> get statsReport;@override $LocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(this._self, this._then);

  final _Profile _self;
  final $Res Function(_Profile) _then;

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? photoUrl = freezed,Object? photoBlurhash = freezed,Object? settings = null,Object? signupDate = null,Object? statsReport = null,Object? completed = null,Object? location = freezed,}) {
  return _then(_Profile(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoBlurhash: freezed == photoBlurhash ? _self.photoBlurhash : photoBlurhash // ignore: cast_nullable_to_non_nullable
as String?,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as ProfileSettings,signupDate: null == signupDate ? _self.signupDate : signupDate // ignore: cast_nullable_to_non_nullable
as DateTime,statsReport: null == statsReport ? _self.statsReport : statsReport // ignore: cast_nullable_to_non_nullable
as ProfileStatsReport,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}

/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingsCopyWith<$Res> get settings {
  
  return $ProfileSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileStatsReportCopyWith<$Res> get statsReport {
  
  return $ProfileStatsReportCopyWith<$Res>(_self.statsReport, (value) {
    return _then(_self.copyWith(statsReport: value));
  });
}/// Create a copy of Profile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
