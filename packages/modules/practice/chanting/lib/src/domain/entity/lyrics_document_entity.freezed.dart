// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyrics_document_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LyricsDocumentEntity implements DiagnosticableTreeMixin {

 List<LyricsLineEntity> get lines;
/// Create a copy of LyricsDocumentEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsDocumentEntityCopyWith<LyricsDocumentEntity> get copyWith => _$LyricsDocumentEntityCopyWithImpl<LyricsDocumentEntity>(this as LyricsDocumentEntity, _$identity);

  /// Serializes this LyricsDocumentEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LyricsDocumentEntity'))
    ..add(DiagnosticsProperty('lines', lines));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricsDocumentEntity&&const DeepCollectionEquality().equals(other.lines, lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(lines));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LyricsDocumentEntity(lines: $lines)';
}


}

/// @nodoc
abstract mixin class $LyricsDocumentEntityCopyWith<$Res>  {
  factory $LyricsDocumentEntityCopyWith(LyricsDocumentEntity value, $Res Function(LyricsDocumentEntity) _then) = _$LyricsDocumentEntityCopyWithImpl;
@useResult
$Res call({
 List<LyricsLineEntity> lines
});




}
/// @nodoc
class _$LyricsDocumentEntityCopyWithImpl<$Res>
    implements $LyricsDocumentEntityCopyWith<$Res> {
  _$LyricsDocumentEntityCopyWithImpl(this._self, this._then);

  final LyricsDocumentEntity _self;
  final $Res Function(LyricsDocumentEntity) _then;

/// Create a copy of LyricsDocumentEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? lines = null,}) {
  return _then(_self.copyWith(
lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<LyricsLineEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [LyricsDocumentEntity].
extension LyricsDocumentEntityPatterns on LyricsDocumentEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricsDocumentEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricsDocumentEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricsDocumentEntity value)  $default,){
final _that = this;
switch (_that) {
case _LyricsDocumentEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricsDocumentEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LyricsDocumentEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<LyricsLineEntity> lines)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricsDocumentEntity() when $default != null:
return $default(_that.lines);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<LyricsLineEntity> lines)  $default,) {final _that = this;
switch (_that) {
case _LyricsDocumentEntity():
return $default(_that.lines);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<LyricsLineEntity> lines)?  $default,) {final _that = this;
switch (_that) {
case _LyricsDocumentEntity() when $default != null:
return $default(_that.lines);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricsDocumentEntity extends LyricsDocumentEntity with DiagnosticableTreeMixin {
  const _LyricsDocumentEntity({required final  List<LyricsLineEntity> lines}): _lines = lines,super._();
  factory _LyricsDocumentEntity.fromJson(Map<String, dynamic> json) => _$LyricsDocumentEntityFromJson(json);

 final  List<LyricsLineEntity> _lines;
@override List<LyricsLineEntity> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}


/// Create a copy of LyricsDocumentEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsDocumentEntityCopyWith<_LyricsDocumentEntity> get copyWith => __$LyricsDocumentEntityCopyWithImpl<_LyricsDocumentEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsDocumentEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LyricsDocumentEntity'))
    ..add(DiagnosticsProperty('lines', lines));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricsDocumentEntity&&const DeepCollectionEquality().equals(other._lines, _lines));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_lines));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LyricsDocumentEntity(lines: $lines)';
}


}

/// @nodoc
abstract mixin class _$LyricsDocumentEntityCopyWith<$Res> implements $LyricsDocumentEntityCopyWith<$Res> {
  factory _$LyricsDocumentEntityCopyWith(_LyricsDocumentEntity value, $Res Function(_LyricsDocumentEntity) _then) = __$LyricsDocumentEntityCopyWithImpl;
@override @useResult
$Res call({
 List<LyricsLineEntity> lines
});




}
/// @nodoc
class __$LyricsDocumentEntityCopyWithImpl<$Res>
    implements _$LyricsDocumentEntityCopyWith<$Res> {
  __$LyricsDocumentEntityCopyWithImpl(this._self, this._then);

  final _LyricsDocumentEntity _self;
  final $Res Function(_LyricsDocumentEntity) _then;

/// Create a copy of LyricsDocumentEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? lines = null,}) {
  return _then(_LyricsDocumentEntity(
lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<LyricsLineEntity>,
  ));
}


}

// dart format on
