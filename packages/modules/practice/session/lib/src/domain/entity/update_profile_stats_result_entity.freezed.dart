// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_stats_result_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$UpdateProfileStatsResultEntity implements DiagnosticableTreeMixin {

 Profile get oldProfile; Profile get updatedProfile; SessionEntity get session;
/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileStatsResultEntityCopyWith<UpdateProfileStatsResultEntity> get copyWith => _$UpdateProfileStatsResultEntityCopyWithImpl<UpdateProfileStatsResultEntity>(this as UpdateProfileStatsResultEntity, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UpdateProfileStatsResultEntity'))
    ..add(DiagnosticsProperty('oldProfile', oldProfile))..add(DiagnosticsProperty('updatedProfile', updatedProfile))..add(DiagnosticsProperty('session', session));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileStatsResultEntity&&(identical(other.oldProfile, oldProfile) || other.oldProfile == oldProfile)&&(identical(other.updatedProfile, updatedProfile) || other.updatedProfile == updatedProfile)&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,oldProfile,updatedProfile,session);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UpdateProfileStatsResultEntity(oldProfile: $oldProfile, updatedProfile: $updatedProfile, session: $session)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileStatsResultEntityCopyWith<$Res>  {
  factory $UpdateProfileStatsResultEntityCopyWith(UpdateProfileStatsResultEntity value, $Res Function(UpdateProfileStatsResultEntity) _then) = _$UpdateProfileStatsResultEntityCopyWithImpl;
@useResult
$Res call({
 Profile oldProfile, Profile updatedProfile, SessionEntity session
});


$ProfileCopyWith<$Res> get oldProfile;$ProfileCopyWith<$Res> get updatedProfile;$SessionEntityCopyWith<$Res> get session;

}
/// @nodoc
class _$UpdateProfileStatsResultEntityCopyWithImpl<$Res>
    implements $UpdateProfileStatsResultEntityCopyWith<$Res> {
  _$UpdateProfileStatsResultEntityCopyWithImpl(this._self, this._then);

  final UpdateProfileStatsResultEntity _self;
  final $Res Function(UpdateProfileStatsResultEntity) _then;

/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? oldProfile = null,Object? updatedProfile = null,Object? session = null,}) {
  return _then(_self.copyWith(
oldProfile: null == oldProfile ? _self.oldProfile : oldProfile // ignore: cast_nullable_to_non_nullable
as Profile,updatedProfile: null == updatedProfile ? _self.updatedProfile : updatedProfile // ignore: cast_nullable_to_non_nullable
as Profile,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionEntity,
  ));
}
/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get oldProfile {
  
  return $ProfileCopyWith<$Res>(_self.oldProfile, (value) {
    return _then(_self.copyWith(oldProfile: value));
  });
}/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get updatedProfile {
  
  return $ProfileCopyWith<$Res>(_self.updatedProfile, (value) {
    return _then(_self.copyWith(updatedProfile: value));
  });
}/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionEntityCopyWith<$Res> get session {
  
  return $SessionEntityCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateProfileStatsResultEntity].
extension UpdateProfileStatsResultEntityPatterns on UpdateProfileStatsResultEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileStatsResultEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileStatsResultEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileStatsResultEntity value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileStatsResultEntity():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileStatsResultEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileStatsResultEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Profile oldProfile,  Profile updatedProfile,  SessionEntity session)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileStatsResultEntity() when $default != null:
return $default(_that.oldProfile,_that.updatedProfile,_that.session);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Profile oldProfile,  Profile updatedProfile,  SessionEntity session)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileStatsResultEntity():
return $default(_that.oldProfile,_that.updatedProfile,_that.session);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Profile oldProfile,  Profile updatedProfile,  SessionEntity session)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileStatsResultEntity() when $default != null:
return $default(_that.oldProfile,_that.updatedProfile,_that.session);case _:
  return null;

}
}

}

/// @nodoc


class _UpdateProfileStatsResultEntity extends UpdateProfileStatsResultEntity with DiagnosticableTreeMixin {
  const _UpdateProfileStatsResultEntity({required this.oldProfile, required this.updatedProfile, required this.session}): super._();
  

@override final  Profile oldProfile;
@override final  Profile updatedProfile;
@override final  SessionEntity session;

/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileStatsResultEntityCopyWith<_UpdateProfileStatsResultEntity> get copyWith => __$UpdateProfileStatsResultEntityCopyWithImpl<_UpdateProfileStatsResultEntity>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UpdateProfileStatsResultEntity'))
    ..add(DiagnosticsProperty('oldProfile', oldProfile))..add(DiagnosticsProperty('updatedProfile', updatedProfile))..add(DiagnosticsProperty('session', session));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileStatsResultEntity&&(identical(other.oldProfile, oldProfile) || other.oldProfile == oldProfile)&&(identical(other.updatedProfile, updatedProfile) || other.updatedProfile == updatedProfile)&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,oldProfile,updatedProfile,session);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UpdateProfileStatsResultEntity(oldProfile: $oldProfile, updatedProfile: $updatedProfile, session: $session)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileStatsResultEntityCopyWith<$Res> implements $UpdateProfileStatsResultEntityCopyWith<$Res> {
  factory _$UpdateProfileStatsResultEntityCopyWith(_UpdateProfileStatsResultEntity value, $Res Function(_UpdateProfileStatsResultEntity) _then) = __$UpdateProfileStatsResultEntityCopyWithImpl;
@override @useResult
$Res call({
 Profile oldProfile, Profile updatedProfile, SessionEntity session
});


@override $ProfileCopyWith<$Res> get oldProfile;@override $ProfileCopyWith<$Res> get updatedProfile;@override $SessionEntityCopyWith<$Res> get session;

}
/// @nodoc
class __$UpdateProfileStatsResultEntityCopyWithImpl<$Res>
    implements _$UpdateProfileStatsResultEntityCopyWith<$Res> {
  __$UpdateProfileStatsResultEntityCopyWithImpl(this._self, this._then);

  final _UpdateProfileStatsResultEntity _self;
  final $Res Function(_UpdateProfileStatsResultEntity) _then;

/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldProfile = null,Object? updatedProfile = null,Object? session = null,}) {
  return _then(_UpdateProfileStatsResultEntity(
oldProfile: null == oldProfile ? _self.oldProfile : oldProfile // ignore: cast_nullable_to_non_nullable
as Profile,updatedProfile: null == updatedProfile ? _self.updatedProfile : updatedProfile // ignore: cast_nullable_to_non_nullable
as Profile,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as SessionEntity,
  ));
}

/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get oldProfile {
  
  return $ProfileCopyWith<$Res>(_self.oldProfile, (value) {
    return _then(_self.copyWith(oldProfile: value));
  });
}/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get updatedProfile {
  
  return $ProfileCopyWith<$Res>(_self.updatedProfile, (value) {
    return _then(_self.copyWith(updatedProfile: value));
  });
}/// Create a copy of UpdateProfileStatsResultEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionEntityCopyWith<$Res> get session {
  
  return $SessionEntityCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
