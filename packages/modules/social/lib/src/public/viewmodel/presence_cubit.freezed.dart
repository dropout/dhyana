// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PresenceState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresenceState()';
}


}

/// @nodoc
class $PresenceStateCopyWith<$Res>  {
$PresenceStateCopyWith(PresenceState _, $Res Function(PresenceState) __);
}


/// Adds pattern-matching-related methods to [PresenceState].
extension PresenceStatePatterns on PresenceState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( PresenceLoadingState value)?  loading,TResult Function( PresenceLoadingMoreState value)?  loadingMore,TResult Function( PresenceLoadedState value)?  loaded,TResult Function( PresenceErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PresenceLoadingState() when loading != null:
return loading(_that);case PresenceLoadingMoreState() when loadingMore != null:
return loadingMore(_that);case PresenceLoadedState() when loaded != null:
return loaded(_that);case PresenceErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( PresenceLoadingState value)  loading,required TResult Function( PresenceLoadingMoreState value)  loadingMore,required TResult Function( PresenceLoadedState value)  loaded,required TResult Function( PresenceErrorState value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case PresenceLoadingState():
return loading(_that);case PresenceLoadingMoreState():
return loadingMore(_that);case PresenceLoadedState():
return loaded(_that);case PresenceErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( PresenceLoadingState value)?  loading,TResult? Function( PresenceLoadingMoreState value)?  loadingMore,TResult? Function( PresenceLoadedState value)?  loaded,TResult? Function( PresenceErrorState value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case PresenceLoadingState() when loading != null:
return loading(_that);case PresenceLoadingMoreState() when loadingMore != null:
return loadingMore(_that);case PresenceLoadedState() when loaded != null:
return loaded(_that);case PresenceErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<Presence> presenceList)?  loadingMore,TResult Function( List<Presence> presenceList)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PresenceLoadingState() when loading != null:
return loading();case PresenceLoadingMoreState() when loadingMore != null:
return loadingMore(_that.presenceList);case PresenceLoadedState() when loaded != null:
return loaded(_that.presenceList);case PresenceErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<Presence> presenceList)  loadingMore,required TResult Function( List<Presence> presenceList)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case PresenceLoadingState():
return loading();case PresenceLoadingMoreState():
return loadingMore(_that.presenceList);case PresenceLoadedState():
return loaded(_that.presenceList);case PresenceErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<Presence> presenceList)?  loadingMore,TResult? Function( List<Presence> presenceList)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case PresenceLoadingState() when loading != null:
return loading();case PresenceLoadingMoreState() when loadingMore != null:
return loadingMore(_that.presenceList);case PresenceLoadedState() when loaded != null:
return loaded(_that.presenceList);case PresenceErrorState() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class _Initial extends PresenceState {
  const _Initial(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresenceState.initial()';
}


}




/// @nodoc


class PresenceLoadingState extends PresenceState {
  const PresenceLoadingState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresenceState.loading()';
}


}




/// @nodoc


class PresenceLoadingMoreState extends PresenceState {
  const PresenceLoadingMoreState({required final  List<Presence> presenceList}): _presenceList = presenceList,super._();
  

 final  List<Presence> _presenceList;
 List<Presence> get presenceList {
  if (_presenceList is EqualUnmodifiableListView) return _presenceList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_presenceList);
}


/// Create a copy of PresenceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresenceLoadingMoreStateCopyWith<PresenceLoadingMoreState> get copyWith => _$PresenceLoadingMoreStateCopyWithImpl<PresenceLoadingMoreState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceLoadingMoreState&&const DeepCollectionEquality().equals(other._presenceList, _presenceList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_presenceList));

@override
String toString() {
  return 'PresenceState.loadingMore(presenceList: $presenceList)';
}


}

/// @nodoc
abstract mixin class $PresenceLoadingMoreStateCopyWith<$Res> implements $PresenceStateCopyWith<$Res> {
  factory $PresenceLoadingMoreStateCopyWith(PresenceLoadingMoreState value, $Res Function(PresenceLoadingMoreState) _then) = _$PresenceLoadingMoreStateCopyWithImpl;
@useResult
$Res call({
 List<Presence> presenceList
});




}
/// @nodoc
class _$PresenceLoadingMoreStateCopyWithImpl<$Res>
    implements $PresenceLoadingMoreStateCopyWith<$Res> {
  _$PresenceLoadingMoreStateCopyWithImpl(this._self, this._then);

  final PresenceLoadingMoreState _self;
  final $Res Function(PresenceLoadingMoreState) _then;

/// Create a copy of PresenceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? presenceList = null,}) {
  return _then(PresenceLoadingMoreState(
presenceList: null == presenceList ? _self._presenceList : presenceList // ignore: cast_nullable_to_non_nullable
as List<Presence>,
  ));
}


}

/// @nodoc


class PresenceLoadedState extends PresenceState {
  const PresenceLoadedState({required final  List<Presence> presenceList}): _presenceList = presenceList,super._();
  

 final  List<Presence> _presenceList;
 List<Presence> get presenceList {
  if (_presenceList is EqualUnmodifiableListView) return _presenceList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_presenceList);
}


/// Create a copy of PresenceState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresenceLoadedStateCopyWith<PresenceLoadedState> get copyWith => _$PresenceLoadedStateCopyWithImpl<PresenceLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceLoadedState&&const DeepCollectionEquality().equals(other._presenceList, _presenceList));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_presenceList));

@override
String toString() {
  return 'PresenceState.loaded(presenceList: $presenceList)';
}


}

/// @nodoc
abstract mixin class $PresenceLoadedStateCopyWith<$Res> implements $PresenceStateCopyWith<$Res> {
  factory $PresenceLoadedStateCopyWith(PresenceLoadedState value, $Res Function(PresenceLoadedState) _then) = _$PresenceLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<Presence> presenceList
});




}
/// @nodoc
class _$PresenceLoadedStateCopyWithImpl<$Res>
    implements $PresenceLoadedStateCopyWith<$Res> {
  _$PresenceLoadedStateCopyWithImpl(this._self, this._then);

  final PresenceLoadedState _self;
  final $Res Function(PresenceLoadedState) _then;

/// Create a copy of PresenceState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? presenceList = null,}) {
  return _then(PresenceLoadedState(
presenceList: null == presenceList ? _self._presenceList : presenceList // ignore: cast_nullable_to_non_nullable
as List<Presence>,
  ));
}


}

/// @nodoc


class PresenceErrorState extends PresenceState {
  const PresenceErrorState(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PresenceState.error()';
}


}




// dart format on
