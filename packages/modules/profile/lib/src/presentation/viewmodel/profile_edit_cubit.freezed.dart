// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_edit_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ProfileEditState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditState()';
}


}

/// @nodoc
class $ProfileEditStateCopyWith<$Res>  {
$ProfileEditStateCopyWith(ProfileEditState _, $Res Function(ProfileEditState) __);
}


/// Adds pattern-matching-related methods to [ProfileEditState].
extension ProfileEditStatePatterns on ProfileEditState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ProfileEditStateInitial value)?  initial,TResult Function( ProfileEditLoadingState value)?  loading,TResult Function( ProfileEditLoadedState value)?  loaded,TResult Function( ProfileEditErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ProfileEditStateInitial() when initial != null:
return initial(_that);case ProfileEditLoadingState() when loading != null:
return loading(_that);case ProfileEditLoadedState() when loaded != null:
return loaded(_that);case ProfileEditErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ProfileEditStateInitial value)  initial,required TResult Function( ProfileEditLoadingState value)  loading,required TResult Function( ProfileEditLoadedState value)  loaded,required TResult Function( ProfileEditErrorState value)  error,}){
final _that = this;
switch (_that) {
case ProfileEditStateInitial():
return initial(_that);case ProfileEditLoadingState():
return loading(_that);case ProfileEditLoadedState():
return loaded(_that);case ProfileEditErrorState():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ProfileEditStateInitial value)?  initial,TResult? Function( ProfileEditLoadingState value)?  loading,TResult? Function( ProfileEditLoadedState value)?  loaded,TResult? Function( ProfileEditErrorState value)?  error,}){
final _that = this;
switch (_that) {
case ProfileEditStateInitial() when initial != null:
return initial(_that);case ProfileEditLoadingState() when loading != null:
return loading(_that);case ProfileEditLoadedState() when loaded != null:
return loaded(_that);case ProfileEditErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Profile profile)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ProfileEditStateInitial() when initial != null:
return initial();case ProfileEditLoadingState() when loading != null:
return loading();case ProfileEditLoadedState() when loaded != null:
return loaded(_that.profile);case ProfileEditErrorState() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Profile profile)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case ProfileEditStateInitial():
return initial();case ProfileEditLoadingState():
return loading();case ProfileEditLoadedState():
return loaded(_that.profile);case ProfileEditErrorState():
return error();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Profile profile)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case ProfileEditStateInitial() when initial != null:
return initial();case ProfileEditLoadingState() when loading != null:
return loading();case ProfileEditLoadedState() when loaded != null:
return loaded(_that.profile);case ProfileEditErrorState() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class ProfileEditStateInitial extends ProfileEditState {
  const ProfileEditStateInitial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditStateInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditState.initial()';
}


}




/// @nodoc


class ProfileEditLoadingState extends ProfileEditState {
  const ProfileEditLoadingState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditState.loading()';
}


}




/// @nodoc


class ProfileEditLoadedState extends ProfileEditState {
  const ProfileEditLoadedState({required this.profile}): super._();
  

 final  Profile profile;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileEditLoadedStateCopyWith<ProfileEditLoadedState> get copyWith => _$ProfileEditLoadedStateCopyWithImpl<ProfileEditLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditLoadedState&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'ProfileEditState.loaded(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $ProfileEditLoadedStateCopyWith<$Res> implements $ProfileEditStateCopyWith<$Res> {
  factory $ProfileEditLoadedStateCopyWith(ProfileEditLoadedState value, $Res Function(ProfileEditLoadedState) _then) = _$ProfileEditLoadedStateCopyWithImpl;
@useResult
$Res call({
 Profile profile
});


$ProfileCopyWith<$Res> get profile;

}
/// @nodoc
class _$ProfileEditLoadedStateCopyWithImpl<$Res>
    implements $ProfileEditLoadedStateCopyWith<$Res> {
  _$ProfileEditLoadedStateCopyWithImpl(this._self, this._then);

  final ProfileEditLoadedState _self;
  final $Res Function(ProfileEditLoadedState) _then;

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(ProfileEditLoadedState(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as Profile,
  ));
}

/// Create a copy of ProfileEditState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCopyWith<$Res> get profile {
  
  return $ProfileCopyWith<$Res>(_self.profile, (value) {
    return _then(_self.copyWith(profile: value));
  });
}
}

/// @nodoc


class ProfileEditErrorState extends ProfileEditState {
  const ProfileEditErrorState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileEditErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ProfileEditState.error()';
}


}




// dart format on
