// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chant_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChantEntity implements DiagnosticableTreeMixin {

 String get id; String get name; ChantMetaDataEntity get metaData; String get blurHash; int get order;@DurationConverter() Duration get length;
/// Create a copy of ChantEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantEntityCopyWith<ChantEntity> get copyWith => _$ChantEntityCopyWithImpl<ChantEntity>(this as ChantEntity, _$identity);

  /// Serializes this ChantEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as ChantEntity;
  properties
    ..add(DiagnosticsProperty('type', 'ChantEntity'))
    ..add(DiagnosticsProperty('id', _this.id))..add(DiagnosticsProperty('name', _this.name))..add(DiagnosticsProperty('metaData', _this.metaData))..add(DiagnosticsProperty('blurHash', _this.blurHash))..add(DiagnosticsProperty('order', _this.order))..add(DiagnosticsProperty('length', _this.length));
}

@override
bool operator ==(Object other) {
  final _this = this as ChantEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.metaData, _this.metaData) || other.metaData == _this.metaData)&&(identical(other.blurHash, _this.blurHash) || other.blurHash == _this.blurHash)&&(identical(other.order, _this.order) || other.order == _this.order)&&(identical(other.length, _this.length) || other.length == _this.length));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChantEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.metaData,_this.blurHash,_this.order,_this.length);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as ChantEntity;
  return 'ChantEntity(id: ${_this.id}, name: ${_this.name}, metaData: ${_this.metaData}, blurHash: ${_this.blurHash}, order: ${_this.order}, length: ${_this.length})';
}


}

/// @nodoc
abstract mixin class $ChantEntityCopyWith<$Res>  {
  factory $ChantEntityCopyWith(ChantEntity value, $Res Function(ChantEntity) _then) = _$ChantEntityCopyWithImpl;
@useResult
$Res call({
 String id, String name, ChantMetaDataEntity metaData, String blurHash, int order,@DurationConverter() Duration length
});


$ChantMetaDataEntityCopyWith<$Res> get metaData;

}
/// @nodoc
class _$ChantEntityCopyWithImpl<$Res>
    implements $ChantEntityCopyWith<$Res> {
  _$ChantEntityCopyWithImpl(this._self, this._then);

  final ChantEntity _self;
  final $Res Function(ChantEntity) _then;

/// Create a copy of ChantEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? metaData = null,Object? blurHash = null,Object? order = null,Object? length = null,}) {
  return _then(ChantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,metaData: null == metaData ? _self.metaData : metaData // ignore: cast_nullable_to_non_nullable
as ChantMetaDataEntity,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}
/// Create a copy of ChantEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantMetaDataEntityCopyWith<$Res> get metaData {
  
  return $ChantMetaDataEntityCopyWith<$Res>(_self.metaData, (value) {
    return _then(_self.copyWith(metaData: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChantEntity].
extension ChantEntityPatterns on ChantEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChantEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChantEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  ChantMetaDataEntity metaData,  String blurHash,  int order, @DurationConverter()  Duration length)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  ChantMetaDataEntity metaData,  String blurHash,  int order, @DurationConverter()  Duration length)  $default,) {final _that = this;
switch (_that) {
case _ChantEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  ChantMetaDataEntity metaData,  String blurHash,  int order, @DurationConverter()  Duration length)?  $default,) {final _that = this;
switch (_that) {
case _ChantEntity() when $default != null:
return $default(_that.id,_that.name,_that.metaData,_that.blurHash,_that.order,_that.length);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChantEntity extends ChantEntity with DiagnosticableTreeMixin {
  const _ChantEntity({required this.id, required this.name, required this.metaData, required this.blurHash, this.order = 0, @DurationConverter() required this.length}): super._();
  factory _ChantEntity.fromJson(Map<String, dynamic> json) => _$ChantEntityFromJson(json);

@override final  String id;
@override final  String name;
@override final  ChantMetaDataEntity metaData;
@override final  String blurHash;
@override@JsonKey() final  int order;
@override@DurationConverter() final  Duration length;

/// Create a copy of ChantEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantEntityCopyWith<_ChantEntity> get copyWith => __$ChantEntityCopyWithImpl<_ChantEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ChantEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('metaData', metaData))..add(DiagnosticsProperty('blurHash', blurHash))..add(DiagnosticsProperty('order', order))..add(DiagnosticsProperty('length', length));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.metaData, metaData) || other.metaData == metaData)&&(identical(other.blurHash, blurHash) || other.blurHash == blurHash)&&(identical(other.order, order) || other.order == order)&&(identical(other.length, length) || other.length == length));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,metaData,blurHash,order,length);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ChantEntity(id: $id, name: $name, metaData: $metaData, blurHash: $blurHash, order: $order, length: $length)';
}


}

/// @nodoc
abstract mixin class _$ChantEntityCopyWith<$Res> implements $ChantEntityCopyWith<$Res> {
  factory _$ChantEntityCopyWith(_ChantEntity value, $Res Function(_ChantEntity) _then) = __$ChantEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, ChantMetaDataEntity metaData, String blurHash, int order,@DurationConverter() Duration length
});


@override $ChantMetaDataEntityCopyWith<$Res> get metaData;

}
/// @nodoc
class __$ChantEntityCopyWithImpl<$Res>
    implements _$ChantEntityCopyWith<$Res> {
  __$ChantEntityCopyWithImpl(this._self, this._then);

  final _ChantEntity _self;
  final $Res Function(_ChantEntity) _then;

/// Create a copy of ChantEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? metaData = null,Object? blurHash = null,Object? order = null,Object? length = null,}) {
  return _then(_ChantEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,metaData: null == metaData ? _self.metaData : metaData // ignore: cast_nullable_to_non_nullable
as ChantMetaDataEntity,blurHash: null == blurHash ? _self.blurHash : blurHash // ignore: cast_nullable_to_non_nullable
as String,order: null == order ? _self.order : order // ignore: cast_nullable_to_non_nullable
as int,length: null == length ? _self.length : length // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

/// Create a copy of ChantEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChantMetaDataEntityCopyWith<$Res> get metaData {
  
  return $ChantMetaDataEntityCopyWith<$Res>(_self.metaData, (value) {
    return _then(_self.copyWith(metaData: value));
  });
}
}

// dart format on
