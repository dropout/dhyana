// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileEntity implements DiagnosticableTreeMixin {

 String get id; String get firstName; String get lastName; String get email; String? get photoUrl; String? get photoBlurhash; ProfileSettingsEntity get settings;@DateTimeConverter() DateTime get signupDate; ProfileStatsReportEntity get statsReport; bool get completed; Location? get location;
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEntityCopyWith<ProfileEntity> get copyWith => _$ProfileEntityCopyWithImpl<ProfileEntity>(this as ProfileEntity, _$identity);

  /// Serializes this ProfileEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProfileEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('firstName', firstName))..add(DiagnosticsProperty('lastName', lastName))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('photoUrl', photoUrl))..add(DiagnosticsProperty('photoBlurhash', photoBlurhash))..add(DiagnosticsProperty('settings', settings))..add(DiagnosticsProperty('signupDate', signupDate))..add(DiagnosticsProperty('statsReport', statsReport))..add(DiagnosticsProperty('completed', completed))..add(DiagnosticsProperty('location', location));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoBlurhash, photoBlurhash) || other.photoBlurhash == photoBlurhash)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.signupDate, signupDate) || other.signupDate == signupDate)&&(identical(other.statsReport, statsReport) || other.statsReport == statsReport)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,photoUrl,photoBlurhash,settings,signupDate,statsReport,completed,location);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProfileEntity(id: $id, firstName: $firstName, lastName: $lastName, email: $email, photoUrl: $photoUrl, photoBlurhash: $photoBlurhash, settings: $settings, signupDate: $signupDate, statsReport: $statsReport, completed: $completed, location: $location)';
}


}

/// @nodoc
abstract mixin class $ProfileEntityCopyWith<$Res>  {
  factory $ProfileEntityCopyWith(ProfileEntity value, $Res Function(ProfileEntity) _then) = _$ProfileEntityCopyWithImpl;
@useResult
$Res call({
 String id, String firstName, String lastName, String email, String? photoUrl, String? photoBlurhash, ProfileSettingsEntity settings,@DateTimeConverter() DateTime signupDate, ProfileStatsReportEntity statsReport, bool completed, Location? location
});


$ProfileSettingsEntityCopyWith<$Res> get settings;$ProfileStatsReportEntityCopyWith<$Res> get statsReport;$LocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$ProfileEntityCopyWithImpl<$Res>
    implements $ProfileEntityCopyWith<$Res> {
  _$ProfileEntityCopyWithImpl(this._self, this._then);

  final ProfileEntity _self;
  final $Res Function(ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? photoUrl = freezed,Object? photoBlurhash = freezed,Object? settings = null,Object? signupDate = null,Object? statsReport = null,Object? completed = null,Object? location = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoBlurhash: freezed == photoBlurhash ? _self.photoBlurhash : photoBlurhash // ignore: cast_nullable_to_non_nullable
as String?,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as ProfileSettingsEntity,signupDate: null == signupDate ? _self.signupDate : signupDate // ignore: cast_nullable_to_non_nullable
as DateTime,statsReport: null == statsReport ? _self.statsReport : statsReport // ignore: cast_nullable_to_non_nullable
as ProfileStatsReportEntity,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}
/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingsEntityCopyWith<$Res> get settings {
  
  return $ProfileSettingsEntityCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileStatsReportEntityCopyWith<$Res> get statsReport {
  
  return $ProfileStatsReportEntityCopyWith<$Res>(_self.statsReport, (value) {
    return _then(_self.copyWith(statsReport: value));
  });
}/// Create a copy of ProfileEntity
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


/// Adds pattern-matching-related methods to [ProfileEntity].
extension ProfileEntityPatterns on ProfileEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileEntity value)  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String email,  String? photoUrl,  String? photoBlurhash,  ProfileSettingsEntity settings, @DateTimeConverter()  DateTime signupDate,  ProfileStatsReportEntity statsReport,  bool completed,  Location? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String firstName,  String lastName,  String email,  String? photoUrl,  String? photoBlurhash,  ProfileSettingsEntity settings, @DateTimeConverter()  DateTime signupDate,  ProfileStatsReportEntity statsReport,  bool completed,  Location? location)  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String firstName,  String lastName,  String email,  String? photoUrl,  String? photoBlurhash,  ProfileSettingsEntity settings, @DateTimeConverter()  DateTime signupDate,  ProfileStatsReportEntity statsReport,  bool completed,  Location? location)?  $default,) {final _that = this;
switch (_that) {
case _ProfileEntity() when $default != null:
return $default(_that.id,_that.firstName,_that.lastName,_that.email,_that.photoUrl,_that.photoBlurhash,_that.settings,_that.signupDate,_that.statsReport,_that.completed,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileEntity extends ProfileEntity with DiagnosticableTreeMixin {
  const _ProfileEntity({required this.id, required this.firstName, required this.lastName, required this.email, required this.photoUrl, required this.photoBlurhash, this.settings = const ProfileSettingsEntity(), @DateTimeConverter() required this.signupDate, required this.statsReport, required this.completed, this.location}): super._();
  factory _ProfileEntity.fromJson(Map<String, dynamic> json) => _$ProfileEntityFromJson(json);

@override final  String id;
@override final  String firstName;
@override final  String lastName;
@override final  String email;
@override final  String? photoUrl;
@override final  String? photoBlurhash;
@override@JsonKey() final  ProfileSettingsEntity settings;
@override@DateTimeConverter() final  DateTime signupDate;
@override final  ProfileStatsReportEntity statsReport;
@override final  bool completed;
@override final  Location? location;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileEntityCopyWith<_ProfileEntity> get copyWith => __$ProfileEntityCopyWithImpl<_ProfileEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'ProfileEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('firstName', firstName))..add(DiagnosticsProperty('lastName', lastName))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('photoUrl', photoUrl))..add(DiagnosticsProperty('photoBlurhash', photoBlurhash))..add(DiagnosticsProperty('settings', settings))..add(DiagnosticsProperty('signupDate', signupDate))..add(DiagnosticsProperty('statsReport', statsReport))..add(DiagnosticsProperty('completed', completed))..add(DiagnosticsProperty('location', location));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.firstName, firstName) || other.firstName == firstName)&&(identical(other.lastName, lastName) || other.lastName == lastName)&&(identical(other.email, email) || other.email == email)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.photoBlurhash, photoBlurhash) || other.photoBlurhash == photoBlurhash)&&(identical(other.settings, settings) || other.settings == settings)&&(identical(other.signupDate, signupDate) || other.signupDate == signupDate)&&(identical(other.statsReport, statsReport) || other.statsReport == statsReport)&&(identical(other.completed, completed) || other.completed == completed)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstName,lastName,email,photoUrl,photoBlurhash,settings,signupDate,statsReport,completed,location);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ProfileEntity(id: $id, firstName: $firstName, lastName: $lastName, email: $email, photoUrl: $photoUrl, photoBlurhash: $photoBlurhash, settings: $settings, signupDate: $signupDate, statsReport: $statsReport, completed: $completed, location: $location)';
}


}

/// @nodoc
abstract mixin class _$ProfileEntityCopyWith<$Res> implements $ProfileEntityCopyWith<$Res> {
  factory _$ProfileEntityCopyWith(_ProfileEntity value, $Res Function(_ProfileEntity) _then) = __$ProfileEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String firstName, String lastName, String email, String? photoUrl, String? photoBlurhash, ProfileSettingsEntity settings,@DateTimeConverter() DateTime signupDate, ProfileStatsReportEntity statsReport, bool completed, Location? location
});


@override $ProfileSettingsEntityCopyWith<$Res> get settings;@override $ProfileStatsReportEntityCopyWith<$Res> get statsReport;@override $LocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$ProfileEntityCopyWithImpl<$Res>
    implements _$ProfileEntityCopyWith<$Res> {
  __$ProfileEntityCopyWithImpl(this._self, this._then);

  final _ProfileEntity _self;
  final $Res Function(_ProfileEntity) _then;

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstName = null,Object? lastName = null,Object? email = null,Object? photoUrl = freezed,Object? photoBlurhash = freezed,Object? settings = null,Object? signupDate = null,Object? statsReport = null,Object? completed = null,Object? location = freezed,}) {
  return _then(_ProfileEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,firstName: null == firstName ? _self.firstName : firstName // ignore: cast_nullable_to_non_nullable
as String,lastName: null == lastName ? _self.lastName : lastName // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,photoBlurhash: freezed == photoBlurhash ? _self.photoBlurhash : photoBlurhash // ignore: cast_nullable_to_non_nullable
as String?,settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as ProfileSettingsEntity,signupDate: null == signupDate ? _self.signupDate : signupDate // ignore: cast_nullable_to_non_nullable
as DateTime,statsReport: null == statsReport ? _self.statsReport : statsReport // ignore: cast_nullable_to_non_nullable
as ProfileStatsReportEntity,completed: null == completed ? _self.completed : completed // ignore: cast_nullable_to_non_nullable
as bool,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}

/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingsEntityCopyWith<$Res> get settings {
  
  return $ProfileSettingsEntityCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}/// Create a copy of ProfileEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileStatsReportEntityCopyWith<$Res> get statsReport {
  
  return $ProfileStatsReportEntityCopyWith<$Res>(_self.statsReport, (value) {
    return _then(_self.copyWith(statsReport: value));
  });
}/// Create a copy of ProfileEntity
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
