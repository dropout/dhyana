// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chanting_settings_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChantingSettingsEntity implements DiagnosticableTreeMixin {

 String get id; List<String> get selectedChants;@DateTimeOrNullConverter() DateTime? get lastUsed;
/// Create a copy of ChantingSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantingSettingsEntityCopyWith<ChantingSettingsEntity> get copyWith => _$ChantingSettingsEntityCopyWithImpl<ChantingSettingsEntity>(this as ChantingSettingsEntity, _$identity);

  /// Serializes this ChantingSettingsEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as ChantingSettingsEntity;
  properties
    ..add(DiagnosticsProperty('type', 'ChantingSettingsEntity'))
    ..add(DiagnosticsProperty('id', _this.id))..add(DiagnosticsProperty('selectedChants', _this.selectedChants))..add(DiagnosticsProperty('lastUsed', _this.lastUsed));
}

@override
bool operator ==(Object other) {
  final _this = this as ChantingSettingsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantingSettingsEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&const DeepCollectionEquality().equals(other.selectedChants, _this.selectedChants)&&(identical(other.lastUsed, _this.lastUsed) || other.lastUsed == _this.lastUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChantingSettingsEntity;
  return Object.hash(runtimeType,_this.id,const DeepCollectionEquality().hash(_this.selectedChants),_this.lastUsed);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as ChantingSettingsEntity;
  return 'ChantingSettingsEntity(id: ${_this.id}, selectedChants: ${_this.selectedChants}, lastUsed: ${_this.lastUsed})';
}


}

/// @nodoc
abstract mixin class $ChantingSettingsEntityCopyWith<$Res>  {
  factory $ChantingSettingsEntityCopyWith(ChantingSettingsEntity value, $Res Function(ChantingSettingsEntity) _then) = _$ChantingSettingsEntityCopyWithImpl;
@useResult
$Res call({
 String id, List<String> selectedChants,@DateTimeOrNullConverter() DateTime? lastUsed
});




}
/// @nodoc
class _$ChantingSettingsEntityCopyWithImpl<$Res>
    implements $ChantingSettingsEntityCopyWith<$Res> {
  _$ChantingSettingsEntityCopyWithImpl(this._self, this._then);

  final ChantingSettingsEntity _self;
  final $Res Function(ChantingSettingsEntity) _then;

/// Create a copy of ChantingSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? selectedChants = null,Object? lastUsed = freezed,}) {
  return _then(ChantingSettingsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,selectedChants: null == selectedChants ? _self.selectedChants : selectedChants // ignore: cast_nullable_to_non_nullable
as List<String>,lastUsed: freezed == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChantingSettingsEntity].
extension ChantingSettingsEntityPatterns on ChantingSettingsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantingSettingsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantingSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantingSettingsEntity value)  $default,){
final _that = this;
switch (_that) {
case _ChantingSettingsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantingSettingsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ChantingSettingsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  List<String> selectedChants, @DateTimeOrNullConverter()  DateTime? lastUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantingSettingsEntity() when $default != null:
return $default(_that.id,_that.selectedChants,_that.lastUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  List<String> selectedChants, @DateTimeOrNullConverter()  DateTime? lastUsed)  $default,) {final _that = this;
switch (_that) {
case _ChantingSettingsEntity():
return $default(_that.id,_that.selectedChants,_that.lastUsed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  List<String> selectedChants, @DateTimeOrNullConverter()  DateTime? lastUsed)?  $default,) {final _that = this;
switch (_that) {
case _ChantingSettingsEntity() when $default != null:
return $default(_that.id,_that.selectedChants,_that.lastUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChantingSettingsEntity extends ChantingSettingsEntity with DiagnosticableTreeMixin {
  const _ChantingSettingsEntity({required this.id,  List<String> selectedChants = const <String>[], @DateTimeOrNullConverter() this.lastUsed}): _selectedChants = selectedChants,super._();
  factory _ChantingSettingsEntity.fromJson(Map<String, dynamic> json) => _$ChantingSettingsEntityFromJson(json);

@override final  String id;
 final  List<String> _selectedChants;
@override@JsonKey() List<String> get selectedChants {
  if (_selectedChants is EqualUnmodifiableListView) return _selectedChants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedChants);
}

@override@DateTimeOrNullConverter() final  DateTime? lastUsed;

/// Create a copy of ChantingSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantingSettingsEntityCopyWith<_ChantingSettingsEntity> get copyWith => __$ChantingSettingsEntityCopyWithImpl<_ChantingSettingsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantingSettingsEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ChantingSettingsEntity'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('selectedChants', selectedChants))..add(DiagnosticsProperty('lastUsed', lastUsed));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantingSettingsEntity&&(identical(other.id, id) || other.id == id)&&const DeepCollectionEquality().equals(other.selectedChants, _selectedChants)&&(identical(other.lastUsed, lastUsed) || other.lastUsed == lastUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,const DeepCollectionEquality().hash(_selectedChants),lastUsed);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ChantingSettingsEntity(id: $id, selectedChants: $selectedChants, lastUsed: $lastUsed)';
}


}

/// @nodoc
abstract mixin class _$ChantingSettingsEntityCopyWith<$Res> implements $ChantingSettingsEntityCopyWith<$Res> {
  factory _$ChantingSettingsEntityCopyWith(_ChantingSettingsEntity value, $Res Function(_ChantingSettingsEntity) _then) = __$ChantingSettingsEntityCopyWithImpl;
@override @useResult
$Res call({
 String id, List<String> selectedChants,@DateTimeOrNullConverter() DateTime? lastUsed
});




}
/// @nodoc
class __$ChantingSettingsEntityCopyWithImpl<$Res>
    implements _$ChantingSettingsEntityCopyWith<$Res> {
  __$ChantingSettingsEntityCopyWithImpl(this._self, this._then);

  final _ChantingSettingsEntity _self;
  final $Res Function(_ChantingSettingsEntity) _then;

/// Create a copy of ChantingSettingsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? selectedChants = null,Object? lastUsed = freezed,}) {
  return _then(_ChantingSettingsEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,selectedChants: null == selectedChants ? _self._selectedChants : selectedChants // ignore: cast_nullable_to_non_nullable
as List<String>,lastUsed: freezed == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
