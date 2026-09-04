// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_query_options_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PresenceQueryOptionsEntity implements DiagnosticableTreeMixin {

 Duration get windowSize; int get limit; String? get ownProfileId; String? get lastDocumentId; Location? get location; double get rangeInKm;
/// Create a copy of PresenceQueryOptionsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PresenceQueryOptionsEntityCopyWith<PresenceQueryOptionsEntity> get copyWith => _$PresenceQueryOptionsEntityCopyWithImpl<PresenceQueryOptionsEntity>(this as PresenceQueryOptionsEntity, _$identity);

  /// Serializes this PresenceQueryOptionsEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as PresenceQueryOptionsEntity;
  properties
    ..add(DiagnosticsProperty('type', 'PresenceQueryOptionsEntity'))
    ..add(DiagnosticsProperty('windowSize', _this.windowSize))..add(DiagnosticsProperty('limit', _this.limit))..add(DiagnosticsProperty('ownProfileId', _this.ownProfileId))..add(DiagnosticsProperty('lastDocumentId', _this.lastDocumentId))..add(DiagnosticsProperty('location', _this.location))..add(DiagnosticsProperty('rangeInKm', _this.rangeInKm));
}

@override
bool operator ==(Object other) {
  final _this = this as PresenceQueryOptionsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PresenceQueryOptionsEntity&&(identical(other.windowSize, _this.windowSize) || other.windowSize == _this.windowSize)&&(identical(other.limit, _this.limit) || other.limit == _this.limit)&&(identical(other.ownProfileId, _this.ownProfileId) || other.ownProfileId == _this.ownProfileId)&&(identical(other.lastDocumentId, _this.lastDocumentId) || other.lastDocumentId == _this.lastDocumentId)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.rangeInKm, _this.rangeInKm) || other.rangeInKm == _this.rangeInKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PresenceQueryOptionsEntity;
  return Object.hash(runtimeType,_this.windowSize,_this.limit,_this.ownProfileId,_this.lastDocumentId,_this.location,_this.rangeInKm);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as PresenceQueryOptionsEntity;
  return 'PresenceQueryOptionsEntity(windowSize: ${_this.windowSize}, limit: ${_this.limit}, ownProfileId: ${_this.ownProfileId}, lastDocumentId: ${_this.lastDocumentId}, location: ${_this.location}, rangeInKm: ${_this.rangeInKm})';
}


}

/// @nodoc
abstract mixin class $PresenceQueryOptionsEntityCopyWith<$Res>  {
  factory $PresenceQueryOptionsEntityCopyWith(PresenceQueryOptionsEntity value, $Res Function(PresenceQueryOptionsEntity) _then) = _$PresenceQueryOptionsEntityCopyWithImpl;
@useResult
$Res call({
 Duration windowSize, int limit, String? ownProfileId, String? lastDocumentId, Location? location, double rangeInKm
});


$LocationCopyWith<$Res>? get location;

}
/// @nodoc
class _$PresenceQueryOptionsEntityCopyWithImpl<$Res>
    implements $PresenceQueryOptionsEntityCopyWith<$Res> {
  _$PresenceQueryOptionsEntityCopyWithImpl(this._self, this._then);

  final PresenceQueryOptionsEntity _self;
  final $Res Function(PresenceQueryOptionsEntity) _then;

/// Create a copy of PresenceQueryOptionsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? windowSize = null,Object? limit = null,Object? ownProfileId = freezed,Object? lastDocumentId = freezed,Object? location = freezed,Object? rangeInKm = null,}) {
  return _then(PresenceQueryOptionsEntity(
windowSize: null == windowSize ? _self.windowSize : windowSize // ignore: cast_nullable_to_non_nullable
as Duration,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,ownProfileId: freezed == ownProfileId ? _self.ownProfileId : ownProfileId // ignore: cast_nullable_to_non_nullable
as String?,lastDocumentId: freezed == lastDocumentId ? _self.lastDocumentId : lastDocumentId // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,rangeInKm: null == rangeInKm ? _self.rangeInKm : rangeInKm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}
/// Create a copy of PresenceQueryOptionsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}


/// Adds pattern-matching-related methods to [PresenceQueryOptionsEntity].
extension PresenceQueryOptionsEntityPatterns on PresenceQueryOptionsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PresenceQueryOptionsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PresenceQueryOptionsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PresenceQueryOptionsEntity value)  $default,){
final _that = this;
switch (_that) {
case _PresenceQueryOptionsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PresenceQueryOptionsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PresenceQueryOptionsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration windowSize,  int limit,  String? ownProfileId,  String? lastDocumentId,  Location? location,  double rangeInKm)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PresenceQueryOptionsEntity() when $default != null:
return $default(_that.windowSize,_that.limit,_that.ownProfileId,_that.lastDocumentId,_that.location,_that.rangeInKm);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration windowSize,  int limit,  String? ownProfileId,  String? lastDocumentId,  Location? location,  double rangeInKm)  $default,) {final _that = this;
switch (_that) {
case _PresenceQueryOptionsEntity():
return $default(_that.windowSize,_that.limit,_that.ownProfileId,_that.lastDocumentId,_that.location,_that.rangeInKm);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration windowSize,  int limit,  String? ownProfileId,  String? lastDocumentId,  Location? location,  double rangeInKm)?  $default,) {final _that = this;
switch (_that) {
case _PresenceQueryOptionsEntity() when $default != null:
return $default(_that.windowSize,_that.limit,_that.ownProfileId,_that.lastDocumentId,_that.location,_that.rangeInKm);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PresenceQueryOptionsEntity extends PresenceQueryOptionsEntity with DiagnosticableTreeMixin {
  const _PresenceQueryOptionsEntity({this.windowSize = const Duration(hours: 3), this.limit = 20, this.ownProfileId, this.lastDocumentId, this.location, this.rangeInKm = 100}): super._();
  factory _PresenceQueryOptionsEntity.fromJson(Map<String, dynamic> json) => _$PresenceQueryOptionsEntityFromJson(json);

@override@JsonKey() final  Duration windowSize;
@override@JsonKey() final  int limit;
@override final  String? ownProfileId;
@override final  String? lastDocumentId;
@override final  Location? location;
@override@JsonKey() final  double rangeInKm;

/// Create a copy of PresenceQueryOptionsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PresenceQueryOptionsEntityCopyWith<_PresenceQueryOptionsEntity> get copyWith => __$PresenceQueryOptionsEntityCopyWithImpl<_PresenceQueryOptionsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PresenceQueryOptionsEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'PresenceQueryOptionsEntity'))
    ..add(DiagnosticsProperty('windowSize', windowSize))..add(DiagnosticsProperty('limit', limit))..add(DiagnosticsProperty('ownProfileId', ownProfileId))..add(DiagnosticsProperty('lastDocumentId', lastDocumentId))..add(DiagnosticsProperty('location', location))..add(DiagnosticsProperty('rangeInKm', rangeInKm));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PresenceQueryOptionsEntity&&(identical(other.windowSize, windowSize) || other.windowSize == windowSize)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.ownProfileId, ownProfileId) || other.ownProfileId == ownProfileId)&&(identical(other.lastDocumentId, lastDocumentId) || other.lastDocumentId == lastDocumentId)&&(identical(other.location, location) || other.location == location)&&(identical(other.rangeInKm, rangeInKm) || other.rangeInKm == rangeInKm));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,windowSize,limit,ownProfileId,lastDocumentId,location,rangeInKm);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'PresenceQueryOptionsEntity(windowSize: $windowSize, limit: $limit, ownProfileId: $ownProfileId, lastDocumentId: $lastDocumentId, location: $location, rangeInKm: $rangeInKm)';
}


}

/// @nodoc
abstract mixin class _$PresenceQueryOptionsEntityCopyWith<$Res> implements $PresenceQueryOptionsEntityCopyWith<$Res> {
  factory _$PresenceQueryOptionsEntityCopyWith(_PresenceQueryOptionsEntity value, $Res Function(_PresenceQueryOptionsEntity) _then) = __$PresenceQueryOptionsEntityCopyWithImpl;
@override @useResult
$Res call({
 Duration windowSize, int limit, String? ownProfileId, String? lastDocumentId, Location? location, double rangeInKm
});


@override $LocationCopyWith<$Res>? get location;

}
/// @nodoc
class __$PresenceQueryOptionsEntityCopyWithImpl<$Res>
    implements _$PresenceQueryOptionsEntityCopyWith<$Res> {
  __$PresenceQueryOptionsEntityCopyWithImpl(this._self, this._then);

  final _PresenceQueryOptionsEntity _self;
  final $Res Function(_PresenceQueryOptionsEntity) _then;

/// Create a copy of PresenceQueryOptionsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? windowSize = null,Object? limit = null,Object? ownProfileId = freezed,Object? lastDocumentId = freezed,Object? location = freezed,Object? rangeInKm = null,}) {
  return _then(_PresenceQueryOptionsEntity(
windowSize: null == windowSize ? _self.windowSize : windowSize // ignore: cast_nullable_to_non_nullable
as Duration,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,ownProfileId: freezed == ownProfileId ? _self.ownProfileId : ownProfileId // ignore: cast_nullable_to_non_nullable
as String?,lastDocumentId: freezed == lastDocumentId ? _self.lastDocumentId : lastDocumentId // ignore: cast_nullable_to_non_nullable
as String?,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location?,rangeInKm: null == rangeInKm ? _self.rangeInKm : rangeInKm // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

/// Create a copy of PresenceQueryOptionsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get location {
    if (_self.location == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.location!, (value) {
    return _then(_self.copyWith(location: value));
  });
}
}

// dart format on
