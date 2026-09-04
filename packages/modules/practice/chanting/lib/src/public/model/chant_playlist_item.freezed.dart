// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chant_playlist_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChantPlaylistItem {

 String get id;/// The identifier of the chant. This is used to look up the chant in the database.
 String get chantId;/// The name of the chant.
 String get name;/// The blur hash of the chant's cover image.
 String get blurHash;/// The order to display the chant in a list.
 int get order;/// The length of the chant.
 Duration get duration;
/// Create a copy of ChantPlaylistItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantPlaylistItemCopyWith<ChantPlaylistItem> get copyWith => _$ChantPlaylistItemCopyWithImpl<ChantPlaylistItem>(this as ChantPlaylistItem, _$identity);

  /// Serializes this ChantPlaylistItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChantPlaylistItem;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantPlaylistItem&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.chantId, _this.chantId) || other.chantId == _this.chantId)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.blurHash, _this.blurHash) || other.blurHash == _this.blurHash)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.duration, _this.duration) || other.duration == _this.duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChantPlaylistItem;
  return Object.hash(runtimeType,_this.id,_this.chantId,_this.name,_this.blurHash,_this.order,_this.duration);
}

@override
String toString() {
  final _this = this as ChantPlaylistItem;
  return 'ChantPlaylistItem(id: ${_this.id}, chantId: ${_this.chantId}, name: ${_this.name}, blurHash: ${_this.blurHash}, order: ${_this.order}, duration: ${_this.duration})';
}


}

/// @nodoc
abstract mixin class $ChantPlaylistItemCopyWith<$Res>  {
  factory $ChantPlaylistItemCopyWith(ChantPlaylistItem value, $Res Function(ChantPlaylistItem) _then) = _$ChantPlaylistItemCopyWithImpl;
@useResult
$Res call({
 String id, String chantId, String name, String blurHash, int order, Duration duration
});




}
/// @nodoc
class _$ChantPlaylistItemCopyWithImpl<$Res>
    implements $ChantPlaylistItemCopyWith<$Res> {
  _$ChantPlaylistItemCopyWithImpl(this._self, this._then);

  final ChantPlaylistItem _self;
  final $Res Function(ChantPlaylistItem) _then;

/// Create a copy of ChantPlaylistItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chantId = null,Object? name = null,Object? blurHash = null,Object? order = null,Object? duration = null,}) {
  return _then(ChantPlaylistItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chantId: null == chantId ? _self.chantId : chantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [ChantPlaylistItem].
extension ChantPlaylistItemPatterns on ChantPlaylistItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantPlaylistItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantPlaylistItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantPlaylistItem value)  $default,){
final _that = this;
switch (_that) {
case _ChantPlaylistItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantPlaylistItem value)?  $default,){
final _that = this;
switch (_that) {
case _ChantPlaylistItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String chantId,  String name,  String blurHash,  int order,  Duration duration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantPlaylistItem() when $default != null:
return $default(_that.id,_that.chantId,_that.name,_that.blurHash,_that.order,_that.duration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String chantId,  String name,  String blurHash,  int order,  Duration duration)  $default,) {final _that = this;
switch (_that) {
case _ChantPlaylistItem():
return $default(_that.id,_that.chantId,_that.name,_that.blurHash,_that.order,_that.duration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String chantId,  String name,  String blurHash,  int order,  Duration duration)?  $default,) {final _that = this;
switch (_that) {
case _ChantPlaylistItem() when $default != null:
return $default(_that.id,_that.chantId,_that.name,_that.blurHash,_that.order,_that.duration);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChantPlaylistItem extends ChantPlaylistItem {
  const _ChantPlaylistItem({required this.id, required this.chantId, required this.name, required this.blurHash, required this.order, required this.duration}): super._();
  factory _ChantPlaylistItem.fromJson(Map<String, dynamic> json) => _$ChantPlaylistItemFromJson(json);

@override final  String id;
/// The identifier of the chant. This is used to look up the chant in the database.
@override final  String chantId;
/// The name of the chant.
@override final  String name;
/// The blur hash of the chant's cover image.
@override final  String blurHash;
/// The order to display the chant in a list.
@override final  int order;
/// The length of the chant.
@override final  Duration duration;

/// Create a copy of ChantPlaylistItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantPlaylistItemCopyWith<_ChantPlaylistItem> get copyWith => __$ChantPlaylistItemCopyWithImpl<_ChantPlaylistItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantPlaylistItemToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantPlaylistItem&&(identical(other.id, id) || other.id == id)&&(identical(other.chantId, chantId) || other.chantId == chantId)&&(identical(other.name, name) || other.name == name)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.order, order) || other.order == order)&&(identical(other.duration, duration) || other.duration == duration));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,chantId,name,blurHash,order,duration);
}

@override
String toString() {
    return 'ChantPlaylistItem(id: $id, chantId: $chantId, name: $name, blurHash: $blurHash, order: $order, duration: $duration)';
}


}

/// @nodoc
abstract mixin class _$ChantPlaylistItemCopyWith<$Res> implements $ChantPlaylistItemCopyWith<$Res> {
  factory _$ChantPlaylistItemCopyWith(_ChantPlaylistItem value, $Res Function(_ChantPlaylistItem) _then) = __$ChantPlaylistItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String chantId, String name, String blurHash, int order, Duration duration
});




}
/// @nodoc
class __$ChantPlaylistItemCopyWithImpl<$Res>
    implements _$ChantPlaylistItemCopyWith<$Res> {
  __$ChantPlaylistItemCopyWithImpl(this._self, this._then);

  final _ChantPlaylistItem _self;
  final $Res Function(_ChantPlaylistItem) _then;

/// Create a copy of ChantPlaylistItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chantId = null,Object? name = null,Object? blurHash = null,Object? order = null,Object? duration = null,}) {
  return _then(_ChantPlaylistItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,chantId: null == chantId ? _self.chantId : chantId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
