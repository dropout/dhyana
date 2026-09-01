// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chanting_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChantingSettingsState {

 List<Chant> get availableChants; List<ChantPlaylistItem> get playlist; bool get isLoading; String? get error;
/// Create a copy of ChantingSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantingSettingsStateCopyWith<ChantingSettingsState> get copyWith => _$ChantingSettingsStateCopyWithImpl<ChantingSettingsState>(this as ChantingSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantingSettingsState&&const DeepCollectionEquality().equals(other.availableChants, availableChants)&&const DeepCollectionEquality().equals(other.playlist, playlist)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(availableChants),const DeepCollectionEquality().hash(playlist),isLoading,error);

@override
String toString() {
  return 'ChantingSettingsState(availableChants: $availableChants, playlist: $playlist, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $ChantingSettingsStateCopyWith<$Res>  {
  factory $ChantingSettingsStateCopyWith(ChantingSettingsState value, $Res Function(ChantingSettingsState) _then) = _$ChantingSettingsStateCopyWithImpl;
@useResult
$Res call({
 List<Chant> availableChants, List<ChantPlaylistItem> playlist, bool isLoading, String? error
});




}
/// @nodoc
class _$ChantingSettingsStateCopyWithImpl<$Res>
    implements $ChantingSettingsStateCopyWith<$Res> {
  _$ChantingSettingsStateCopyWithImpl(this._self, this._then);

  final ChantingSettingsState _self;
  final $Res Function(ChantingSettingsState) _then;

/// Create a copy of ChantingSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? availableChants = null,Object? playlist = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
availableChants: null == availableChants ? _self.availableChants : availableChants // ignore: cast_nullable_to_non_nullable
as List<Chant>,playlist: null == playlist ? _self.playlist : playlist // ignore: cast_nullable_to_non_nullable
as List<ChantPlaylistItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChantingSettingsState].
extension ChantingSettingsStatePatterns on ChantingSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantingSettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantingSettingsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantingSettingsState value)  $default,){
final _that = this;
switch (_that) {
case _ChantingSettingsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantingSettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _ChantingSettingsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Chant> availableChants,  List<ChantPlaylistItem> playlist,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantingSettingsState() when $default != null:
return $default(_that.availableChants,_that.playlist,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Chant> availableChants,  List<ChantPlaylistItem> playlist,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _ChantingSettingsState():
return $default(_that.availableChants,_that.playlist,_that.isLoading,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Chant> availableChants,  List<ChantPlaylistItem> playlist,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _ChantingSettingsState() when $default != null:
return $default(_that.availableChants,_that.playlist,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _ChantingSettingsState extends ChantingSettingsState {
  const _ChantingSettingsState({required final  List<Chant> availableChants, required final  List<ChantPlaylistItem> playlist, required this.isLoading, this.error}): _availableChants = availableChants,_playlist = playlist,super._();
  

 final  List<Chant> _availableChants;
@override List<Chant> get availableChants {
  if (_availableChants is EqualUnmodifiableListView) return _availableChants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableChants);
}

 final  List<ChantPlaylistItem> _playlist;
@override List<ChantPlaylistItem> get playlist {
  if (_playlist is EqualUnmodifiableListView) return _playlist;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playlist);
}

@override final  bool isLoading;
@override final  String? error;

/// Create a copy of ChantingSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantingSettingsStateCopyWith<_ChantingSettingsState> get copyWith => __$ChantingSettingsStateCopyWithImpl<_ChantingSettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantingSettingsState&&const DeepCollectionEquality().equals(other._availableChants, _availableChants)&&const DeepCollectionEquality().equals(other._playlist, _playlist)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_availableChants),const DeepCollectionEquality().hash(_playlist),isLoading,error);

@override
String toString() {
  return 'ChantingSettingsState(availableChants: $availableChants, playlist: $playlist, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$ChantingSettingsStateCopyWith<$Res> implements $ChantingSettingsStateCopyWith<$Res> {
  factory _$ChantingSettingsStateCopyWith(_ChantingSettingsState value, $Res Function(_ChantingSettingsState) _then) = __$ChantingSettingsStateCopyWithImpl;
@override @useResult
$Res call({
 List<Chant> availableChants, List<ChantPlaylistItem> playlist, bool isLoading, String? error
});




}
/// @nodoc
class __$ChantingSettingsStateCopyWithImpl<$Res>
    implements _$ChantingSettingsStateCopyWith<$Res> {
  __$ChantingSettingsStateCopyWithImpl(this._self, this._then);

  final _ChantingSettingsState _self;
  final $Res Function(_ChantingSettingsState) _then;

/// Create a copy of ChantingSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? availableChants = null,Object? playlist = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_ChantingSettingsState(
availableChants: null == availableChants ? _self._availableChants : availableChants // ignore: cast_nullable_to_non_nullable
as List<Chant>,playlist: null == playlist ? _self._playlist : playlist // ignore: cast_nullable_to_non_nullable
as List<ChantPlaylistItem>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
