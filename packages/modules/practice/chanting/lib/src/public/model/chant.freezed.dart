// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chant implements DiagnosticableTreeMixin {

 String get id; String get name; ChantMetaData get metaData; String get blurHash; int get order;@DurationConverter() Duration get length;
/// Create a copy of Chant
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantCopyWith<Chant> get copyWith => _$ChantCopyWithImpl<Chant>(this as Chant, _$identity);

  /// Serializes this Chant to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Chant'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('metaData', metaData))..add(DiagnosticsProperty('blurHash', blurHash))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('length', length));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.metaData, metaData) || other.metaData == metaData)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.order, order) || other.order == order)&&(identical(other.length, length) || other.length == length));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,metaData,blurHash,order,length);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Chant(id: $id, name: $name, metaData: $metaData, blurHash: $blurHash, order: $order, length: $length)';
}


}

/// @nodoc
abstract mixin class $ChantCopyWith<$Res>  {
  factory $ChantCopyWith(Chant value, $Res Function(Chant) _then) = _$ChantCopyWithImpl;
@useResult
$Res call({
 String id, String name, ChantMetaData metaData, String blurHash, int order,@DurationConverter() Duration length
});


$ChantMetaDataCopyWith<$Res> get metaData;

}
/// @nodoc
class _$ChantCopyWithImpl<$Res>
    implements $ChantCopyWith<$Res> {
  _$ChantCopyWithImpl(this._self, this._then);

  final Chant _self;
  final $Res Function(Chant) _then;

/// Create a copy of Chant
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? metaData = null,Object? blurHash = null,Object? order = null,Object? length = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,metaData: null == metaData ? _self.metaData : metaData // ignore: cast_nullable_to_non_nullable
as ChantMetaData,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}
/// Create a copy of Chant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantMetaDataCopyWith<$Res> get metaData {
  
  return $ChantMetaDataCopyWith<$Res>(_self.metaData, (value) {
    return _then(_self.copyWith(metaData: value));
  });
}
}


/// Adds pattern-matching-related methods to [Chant].
extension ChantPatterns on Chant {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chant value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chant() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chant value)  $default,){
final _that = this;
switch (_that) {
case _Chant():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chant value)?  $default,){
final _that = this;
switch (_that) {
case _Chant() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ChantMetaData metaData,  String blurHash,  int order, @DurationConverter()  Duration length)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chant() when $default != null:
return $default(_that.id,_that.name,_that.metaData,_that.blurHash,_that.order,_that.length);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ChantMetaData metaData,  String blurHash,  int order, @DurationConverter()  Duration length)  $default,) {final _that = this;
switch (_that) {
case _Chant():
return $default(_that.id,_that.name,_that.metaData,_that.blurHash,_that.order,_that.length);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ChantMetaData metaData,  String blurHash,  int order, @DurationConverter()  Duration length)?  $default,) {final _that = this;
switch (_that) {
case _Chant() when $default != null:
return $default(_that.id,_that.name,_that.metaData,_that.blurHash,_that.order,_that.length);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chant extends Chant with DiagnosticableTreeMixin {
  const _Chant({required this.id, required this.name, required this.metaData, required this.blurHash, this.order = 0, @DurationConverter() required this.length}): super._();
  factory _Chant.fromJson(Map<String, dynamic> json) => _$ChantFromJson(json);

@override final  String id;
@override final  String name;
@override final  ChantMetaData metaData;
@override final  String blurHash;
@override@JsonKey() final  int order;
@override@DurationConverter() final  Duration length;

/// Create a copy of Chant
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantCopyWith<_Chant> get copyWith => __$ChantCopyWithImpl<_Chant>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'Chant'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('metaData', metaData))..add(DiagnosticsProperty('blurHash', blurHash))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('length', length));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chant&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.metaData, metaData) || other.metaData == metaData)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.order, order) || other.order == order)&&(identical(other.length, length) || other.length == length));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,metaData,blurHash,order,length);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'Chant(id: $id, name: $name, metaData: $metaData, blurHash: $blurHash, order: $order, length: $length)';
}


}

/// @nodoc
abstract mixin class _$ChantCopyWith<$Res> implements $ChantCopyWith<$Res> {
  factory _$ChantCopyWith(_Chant value, $Res Function(_Chant) _then) = __$ChantCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ChantMetaData metaData, String blurHash, int order,@DurationConverter() Duration length
});


@override $ChantMetaDataCopyWith<$Res> get metaData;

}
/// @nodoc
class __$ChantCopyWithImpl<$Res>
    implements _$ChantCopyWith<$Res> {
  __$ChantCopyWithImpl(this._self, this._then);

  final _Chant _self;
  final $Res Function(_Chant) _then;

/// Create a copy of Chant
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? metaData = null,Object? blurHash = null,Object? order = null,Object? length = null,}) {
  return _then(_Chant(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,metaData: null == metaData ? _self.metaData : metaData // ignore: cast_nullable_to_non_nullable
as ChantMetaData,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

/// Create a copy of Chant
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantMetaDataCopyWith<$Res> get metaData {
  
  return $ChantMetaDataCopyWith<$Res>(_self.metaData, (value) {
    return _then(_self.copyWith(metaData: value));
  });
}
}

// dart format on
