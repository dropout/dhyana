// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'remote_settings_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RemoteSettingsState {

 RemoteSettings get settings;
/// Create a copy of RemoteSettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RemoteSettingsStateCopyWith<RemoteSettingsState> get copyWith => _$RemoteSettingsStateCopyWithImpl<RemoteSettingsState>(this as RemoteSettingsState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RemoteSettingsState&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'RemoteSettingsState(settings: $settings)';
}


}

/// @nodoc
abstract mixin class $RemoteSettingsStateCopyWith<$Res>  {
  factory $RemoteSettingsStateCopyWith(RemoteSettingsState value, $Res Function(RemoteSettingsState) _then) = _$RemoteSettingsStateCopyWithImpl;
@useResult
$Res call({
 RemoteSettings settings
});


$RemoteSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class _$RemoteSettingsStateCopyWithImpl<$Res>
    implements $RemoteSettingsStateCopyWith<$Res> {
  _$RemoteSettingsStateCopyWithImpl(this._self, this._then);

  final RemoteSettingsState _self;
  final $Res Function(RemoteSettingsState) _then;

/// Create a copy of RemoteSettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? settings = null,}) {
  return _then(_self.copyWith(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as RemoteSettings,
  ));
}
/// Create a copy of RemoteSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteSettingsCopyWith<$Res> get settings {
  
  return $RemoteSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}


/// Adds pattern-matching-related methods to [RemoteSettingsState].
extension RemoteSettingsStatePatterns on RemoteSettingsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Loaded value)?  loaded,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Loaded value)  loaded,}){
final _that = this;
switch (_that) {
case _Loaded():
return loaded(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Loaded value)?  loaded,}){
final _that = this;
switch (_that) {
case _Loaded() when loaded != null:
return loaded(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( RemoteSettings settings)?  loaded,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Loaded() when loaded != null:
return loaded(_that.settings);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( RemoteSettings settings)  loaded,}) {final _that = this;
switch (_that) {
case _Loaded():
return loaded(_that.settings);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( RemoteSettings settings)?  loaded,}) {final _that = this;
switch (_that) {
case _Loaded() when loaded != null:
return loaded(_that.settings);case _:
  return null;

}
}

}

/// @nodoc


class _Loaded implements RemoteSettingsState {
  const _Loaded({required this.settings});
  

@override final  RemoteSettings settings;

/// Create a copy of RemoteSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<_Loaded> get copyWith => __$LoadedCopyWithImpl<_Loaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded&&(identical(other.settings, settings) || other.settings == settings));
}


@override
int get hashCode => Object.hash(runtimeType,settings);

@override
String toString() {
  return 'RemoteSettingsState.loaded(settings: $settings)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res> implements $RemoteSettingsStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) = __$LoadedCopyWithImpl;
@override @useResult
$Res call({
 RemoteSettings settings
});


@override $RemoteSettingsCopyWith<$Res> get settings;

}
/// @nodoc
class __$LoadedCopyWithImpl<$Res>
    implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

/// Create a copy of RemoteSettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? settings = null,}) {
  return _then(_Loaded(
settings: null == settings ? _self.settings : settings // ignore: cast_nullable_to_non_nullable
as RemoteSettings,
  ));
}

/// Create a copy of RemoteSettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RemoteSettingsCopyWith<$Res> get settings {
  
  return $RemoteSettingsCopyWith<$Res>(_self.settings, (value) {
    return _then(_self.copyWith(settings: value));
  });
}
}

// dart format on
