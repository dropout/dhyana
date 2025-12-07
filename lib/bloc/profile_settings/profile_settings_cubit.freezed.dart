// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileSettingsState {

 ProfileSettings? get settings;
/// Create a copy of ProfileSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileSettingsStateCopyWith<ProfileSettingsState> get copyWith => _$ProfileSettingsStateCopyWithImpl<ProfileSettingsState>(this as ProfileSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileSettingsState&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'ProfileSettingsState(settings: $settings)';
}


}

/// @nodoc
abstract mixin class $ProfileSettingsStateCopyWith<$Res>  {
  factory $ProfileSettingsStateCopyWith(ProfileSettingsState value, $Res Function(ProfileSettingsState) _then) = _$ProfileSettingsStateCopyWithImpl;
@useResult
$Res call({
 ProfileSettings? settings
});


$ProfileSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class _$ProfileSettingsStateCopyWithImpl<$Res>
    implements $ProfileSettingsStateCopyWith<$Res> {
  _$ProfileSettingsStateCopyWithImpl(this._self, this._then);

  final ProfileSettingsState _self;
  final $Res Function(ProfileSettingsState) _then;

/// Create a copy of ProfileSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? settings = freezed,}) {
  return _then(_self.copyWith(
settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as ProfileSettings?,
  ));
}
/// Create a copy of ProfileSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $ProfileSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [ProfileSettingsState].
extension ProfileSettingsStatePatterns on ProfileSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _ProfileSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ProfileSettings? settings)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileSettingsState() when $default != null:
return $default(_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ProfileSettings? settings)  $default,) {final _that = this;
switch (_that) {
case _ProfileSettingsState():
return $default(_that.settings);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ProfileSettings? settings)?  $default,) {final _that = this;
switch (_that) {
case _ProfileSettingsState() when $default != null:
return $default(_that.settings);case _:
  return null;

}
}

}

/// @nodoc


class _ProfileSettingsState extends ProfileSettingsState {
  const _ProfileSettingsState({this.settings}): super._();
  

@override final  ProfileSettings? settings;

/// Create a copy of ProfileSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileSettingsStateCopyWith<_ProfileSettingsState> get copyWith => __$ProfileSettingsStateCopyWithImpl<_ProfileSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileSettingsState&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'ProfileSettingsState(settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$ProfileSettingsStateCopyWith<$Res> implements $ProfileSettingsStateCopyWith<$Res> {
  factory _$ProfileSettingsStateCopyWith(_ProfileSettingsState value, $Res Function(_ProfileSettingsState) _then) = __$ProfileSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 ProfileSettings? settings
});


@override $ProfileSettingsCopyWith<$Res>? get settings;

}
/// @nodoc
class __$ProfileSettingsStateCopyWithImpl<$Res>
    implements _$ProfileSettingsStateCopyWith<$Res> {
  __$ProfileSettingsStateCopyWithImpl(this._self, this._then);

  final _ProfileSettingsState _self;
  final $Res Function(_ProfileSettingsState) _then;

/// Create a copy of ProfileSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? settings = freezed,}) {
  return _then(_ProfileSettingsState(
settings: freezed == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as ProfileSettings?,
  ));
}

/// Create a copy of ProfileSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileSettingsCopyWith<$Res>? get settings {
    if (_self.settings == null) {
    return null;
  }

  return $ProfileSettingsCopyWith<$Res>(_self.settings!, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

// dart format on
