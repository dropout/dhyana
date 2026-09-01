// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'city_search_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CitySearchResult {

 String get placeId; String get name; List<String> get types; LatLng? get location;
/// Create a copy of CitySearchResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CitySearchResultCopyWith<CitySearchResult> get copyWith => _$CitySearchResultCopyWithImpl<CitySearchResult>(this as CitySearchResult, _$identity);

  /// Serializes this CitySearchResult to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CitySearchResult&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.types, types)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,name,const DeepCollectionEquality().hash(types),location);

@override
String toString() {
  return 'CitySearchResult(placeId: $placeId, name: $name, types: $types, location: $location)';
}


}

/// @nodoc
abstract mixin class $CitySearchResultCopyWith<$Res>  {
  factory $CitySearchResultCopyWith(CitySearchResult value, $Res Function(CitySearchResult) _then) = _$CitySearchResultCopyWithImpl;
@useResult
$Res call({
 String placeId, String name, List<String> types, LatLng? location
});


$LatLngCopyWith<$Res>? get location;

}
/// @nodoc
class _$CitySearchResultCopyWithImpl<$Res>
    implements $CitySearchResultCopyWith<$Res> {
  _$CitySearchResultCopyWithImpl(this._self, this._then);

  final CitySearchResult _self;
  final $Res Function(CitySearchResult) _then;

/// Create a copy of CitySearchResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? placeId = null,Object? name = null,Object? types = null,Object? location = freezed,}) {
  return _then(_self.copyWith(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self.types : types // ignore: cast_nullable_to_non_nullable
as List<String>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng?,
  ));
}
/// Create a copy of CitySearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LatLngCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [CitySearchResult].
extension CitySearchResultPatterns on CitySearchResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CitySearchResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CitySearchResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CitySearchResult value)  $default,){
final _that = this;
switch (_that) {
case _CitySearchResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CitySearchResult value)?  $default,){
final _that = this;
switch (_that) {
case _CitySearchResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String placeId,  String name,  List<String> types,  LatLng? location)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CitySearchResult() when $default != null:
return $default(_that.placeId,_that.name,_that.types,_that.location);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String placeId,  String name,  List<String> types,  LatLng? location)  $default,) {final _that = this;
switch (_that) {
case _CitySearchResult():
return $default(_that.placeId,_that.name,_that.types,_that.location);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String placeId,  String name,  List<String> types,  LatLng? location)?  $default,) {final _that = this;
switch (_that) {
case _CitySearchResult() when $default != null:
return $default(_that.placeId,_that.name,_that.types,_that.location);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CitySearchResult implements CitySearchResult {
  const _CitySearchResult({required this.placeId, required this.name, required final  List<String> types, this.location}): _types = types;
  factory _CitySearchResult.fromJson(Map<String, dynamic> json) => _$CitySearchResultFromJson(json);

@override final  String placeId;
@override final  String name;
 final  List<String> _types;
@override List<String> get types {
  if (_types is EqualUnmodifiableListView) return _types;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_types);
}

@override final  LatLng? location;

/// Create a copy of CitySearchResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CitySearchResultCopyWith<_CitySearchResult> get copyWith => __$CitySearchResultCopyWithImpl<_CitySearchResult>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CitySearchResultToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CitySearchResult&&(identical(other.placeId, placeId) || other.placeId == placeId)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._types, _types)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,placeId,name,const DeepCollectionEquality().hash(_types),location);

@override
String toString() {
  return 'CitySearchResult(placeId: $placeId, name: $name, types: $types, location: $location)';
}


}

/// @nodoc
abstract mixin class _$CitySearchResultCopyWith<$Res> implements $CitySearchResultCopyWith<$Res> {
  factory _$CitySearchResultCopyWith(_CitySearchResult value, $Res Function(_CitySearchResult) _then) = __$CitySearchResultCopyWithImpl;
@override @useResult
$Res call({
 String placeId, String name, List<String> types, LatLng? location
});


@override $LatLngCopyWith<$Res>? get location;

}
/// @nodoc
class __$CitySearchResultCopyWithImpl<$Res>
    implements _$CitySearchResultCopyWith<$Res> {
  __$CitySearchResultCopyWithImpl(this._self, this._then);

  final _CitySearchResult _self;
  final $Res Function(_CitySearchResult) _then;

/// Create a copy of CitySearchResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? placeId = null,Object? name = null,Object? types = null,Object? location = freezed,}) {
  return _then(_CitySearchResult(
placeId: null == placeId ? _self.placeId : placeId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,types: null == types ? _self._types : types // ignore: cast_nullable_to_non_nullable
as List<String>,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as LatLng?,
  ));
}

/// Create a copy of CitySearchResult
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LatLngCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LatLngCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
