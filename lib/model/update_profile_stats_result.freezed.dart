// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_profile_stats_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UpdateProfileStatsResult implements DiagnosticableTreeMixin {

 Profile get oldProfile; Profile get updatedProfile; Session get session;
/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateProfileStatsResultCopyWith<UpdateProfileStatsResult> get copyWith => _$UpdateProfileStatsResultCopyWithImpl<UpdateProfileStatsResult>(this as UpdateProfileStatsResult, _$identity);

  /// Serializes this UpdateProfileStatsResult to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UpdateProfileStatsResult'))
    ..add(DiagnosticsProperty('oldProfile', oldProfile))..add(DiagnosticsProperty('updatedProfile', updatedProfile))..add(DiagnosticsProperty('session', session));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateProfileStatsResult&&(identical(other.oldProfile, oldProfile) || other.oldProfile == oldProfile)&&(identical(other.updatedProfile, updatedProfile) || other.updatedProfile == updatedProfile)&&(identical(other.session, session) || other.session == session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,oldProfile,updatedProfile,session);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UpdateProfileStatsResult(oldProfile: $oldProfile, updatedProfile: $updatedProfile, session: $session)';
}


}

/// @nodoc
abstract mixin class $UpdateProfileStatsResultCopyWith<$Res>  {
  factory $UpdateProfileStatsResultCopyWith(UpdateProfileStatsResult value, $Res Function(UpdateProfileStatsResult) _then) = _$UpdateProfileStatsResultCopyWithImpl;
@useResult
$Res call({
 Profile oldProfile, Profile updatedProfile, Session session
});


$ProfileCopyWith<$Res> get oldProfile;$ProfileCopyWith<$Res> get updatedProfile;$SessionCopyWith<$Res> get session;

}
/// @nodoc
class _$UpdateProfileStatsResultCopyWithImpl<$Res>
    implements $UpdateProfileStatsResultCopyWith<$Res> {
  _$UpdateProfileStatsResultCopyWithImpl(this._self, this._then);

  final UpdateProfileStatsResult _self;
  final $Res Function(UpdateProfileStatsResult) _then;

/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? oldProfile = null,Object? updatedProfile = null,Object? session = null,}) {
  return _then(_self.copyWith(
oldProfile: null == oldProfile ? _self.oldProfile : oldProfile // ignore: cast_nullable_to_non_nullable
as Profile,updatedProfile: null == updatedProfile ? _self.updatedProfile : updatedProfile // ignore: cast_nullable_to_non_nullable
as Profile,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,
  ));
}
/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get oldProfile {
  
  return $ProfileCopyWith<$Res>(_self.oldProfile, (value) {
    return _then(_self.copyWith(oldProfile: value));
  });
}/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get updatedProfile {
  
  return $ProfileCopyWith<$Res>(_self.updatedProfile, (value) {
    return _then(_self.copyWith(updatedProfile: value));
  });
}/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res> get session {
  
  return $SessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateProfileStatsResult].
extension UpdateProfileStatsResultPatterns on UpdateProfileStatsResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateProfileStatsResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateProfileStatsResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateProfileStatsResult value)  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileStatsResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateProfileStatsResult value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateProfileStatsResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Profile oldProfile,  Profile updatedProfile,  Session session)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateProfileStatsResult() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Profile oldProfile,  Profile updatedProfile,  Session session)  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileStatsResult():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Profile oldProfile,  Profile updatedProfile,  Session session)?  $default,) {final _that = this;
switch (_that) {
case _UpdateProfileStatsResult() when $default != null:
return $default(_that.oldProfile,_that.updatedProfile,_that.session);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateProfileStatsResult extends UpdateProfileStatsResult with DiagnosticableTreeMixin {
  const _UpdateProfileStatsResult({required this.oldProfile, required this.updatedProfile, required this.session}): super._();
  factory _UpdateProfileStatsResult.fromJson(Map<String, dynamic> json) => _$UpdateProfileStatsResultFromJson(json);

@override final  Profile oldProfile;
@override final  Profile updatedProfile;
@override final  Session session;

/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateProfileStatsResultCopyWith<_UpdateProfileStatsResult> get copyWith => __$UpdateProfileStatsResultCopyWithImpl<_UpdateProfileStatsResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateProfileStatsResultToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UpdateProfileStatsResult'))
    ..add(DiagnosticsProperty('oldProfile', oldProfile))..add(DiagnosticsProperty('updatedProfile', updatedProfile))..add(DiagnosticsProperty('session', session));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateProfileStatsResult&&(identical(other.oldProfile, oldProfile) || other.oldProfile == oldProfile)&&(identical(other.updatedProfile, updatedProfile) || other.updatedProfile == updatedProfile)&&(identical(other.session, session) || other.session == session));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,oldProfile,updatedProfile,session);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UpdateProfileStatsResult(oldProfile: $oldProfile, updatedProfile: $updatedProfile, session: $session)';
}


}

/// @nodoc
abstract mixin class _$UpdateProfileStatsResultCopyWith<$Res> implements $UpdateProfileStatsResultCopyWith<$Res> {
  factory _$UpdateProfileStatsResultCopyWith(_UpdateProfileStatsResult value, $Res Function(_UpdateProfileStatsResult) _then) = __$UpdateProfileStatsResultCopyWithImpl;
@override @useResult
$Res call({
 Profile oldProfile, Profile updatedProfile, Session session
});


@override $ProfileCopyWith<$Res> get oldProfile;@override $ProfileCopyWith<$Res> get updatedProfile;@override $SessionCopyWith<$Res> get session;

}
/// @nodoc
class __$UpdateProfileStatsResultCopyWithImpl<$Res>
    implements _$UpdateProfileStatsResultCopyWith<$Res> {
  __$UpdateProfileStatsResultCopyWithImpl(this._self, this._then);

  final _UpdateProfileStatsResult _self;
  final $Res Function(_UpdateProfileStatsResult) _then;

/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? oldProfile = null,Object? updatedProfile = null,Object? session = null,}) {
  return _then(_UpdateProfileStatsResult(
oldProfile: null == oldProfile ? _self.oldProfile : oldProfile // ignore: cast_nullable_to_non_nullable
as Profile,updatedProfile: null == updatedProfile ? _self.updatedProfile : updatedProfile // ignore: cast_nullable_to_non_nullable
as Profile,session: null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as Session,
  ));
}

/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get oldProfile {
  
  return $ProfileCopyWith<$Res>(_self.oldProfile, (value) {
    return _then(_self.copyWith(oldProfile: value));
  });
}/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get updatedProfile {
  
  return $ProfileCopyWith<$Res>(_self.updatedProfile, (value) {
    return _then(_self.copyWith(updatedProfile: value));
  });
}/// Create a copy of UpdateProfileStatsResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SessionCopyWith<$Res> get session {
  
  return $SessionCopyWith<$Res>(_self.session, (value) {
    return _then(_self.copyWith(session: value));
  });
}
}

// dart format on
