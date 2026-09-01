// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyrics_word_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LyricsWordEntity implements DiagnosticableTreeMixin {

 String get text; Duration get start; Duration get end;
/// Create a copy of LyricsWordEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsWordEntityCopyWith<LyricsWordEntity> get copyWith => _$LyricsWordEntityCopyWithImpl<LyricsWordEntity>(this as LyricsWordEntity, _$identity);

  /// Serializes this LyricsWordEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LyricsWordEntity'))
    ..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricsWordEntity&&(identical(other.text, text) || other.text == text)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LyricsWordEntity(text: $text, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class $LyricsWordEntityCopyWith<$Res>  {
  factory $LyricsWordEntityCopyWith(LyricsWordEntity value, $Res Function(LyricsWordEntity) _then) = _$LyricsWordEntityCopyWithImpl;
@useResult
$Res call({
 String text, Duration start, Duration end
});




}
/// @nodoc
class _$LyricsWordEntityCopyWithImpl<$Res>
    implements $LyricsWordEntityCopyWith<$Res> {
  _$LyricsWordEntityCopyWithImpl(this._self, this._then);

  final LyricsWordEntity _self;
  final $Res Function(LyricsWordEntity) _then;

/// Create a copy of LyricsWordEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? start = null,Object? end = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Duration,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [LyricsWordEntity].
extension LyricsWordEntityPatterns on LyricsWordEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricsWordEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricsWordEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricsWordEntity value)  $default,){
final _that = this;
switch (_that) {
case _LyricsWordEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricsWordEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LyricsWordEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  Duration start,  Duration end)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricsWordEntity() when $default != null:
return $default(_that.text,_that.start,_that.end);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  Duration start,  Duration end)  $default,) {final _that = this;
switch (_that) {
case _LyricsWordEntity():
return $default(_that.text,_that.start,_that.end);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  Duration start,  Duration end)?  $default,) {final _that = this;
switch (_that) {
case _LyricsWordEntity() when $default != null:
return $default(_that.text,_that.start,_that.end);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricsWordEntity extends LyricsWordEntity with DiagnosticableTreeMixin {
  const _LyricsWordEntity({required this.text, required this.start, required this.end}): super._();
  factory _LyricsWordEntity.fromJson(Map<String, dynamic> json) => _$LyricsWordEntityFromJson(json);

@override final  String text;
@override final  Duration start;
@override final  Duration end;

/// Create a copy of LyricsWordEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsWordEntityCopyWith<_LyricsWordEntity> get copyWith => __$LyricsWordEntityCopyWithImpl<_LyricsWordEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsWordEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LyricsWordEntity'))
    ..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricsWordEntity&&(identical(other.text, text) || other.text == text)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,start,end);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LyricsWordEntity(text: $text, start: $start, end: $end)';
}


}

/// @nodoc
abstract mixin class _$LyricsWordEntityCopyWith<$Res> implements $LyricsWordEntityCopyWith<$Res> {
  factory _$LyricsWordEntityCopyWith(_LyricsWordEntity value, $Res Function(_LyricsWordEntity) _then) = __$LyricsWordEntityCopyWithImpl;
@override @useResult
$Res call({
 String text, Duration start, Duration end
});




}
/// @nodoc
class __$LyricsWordEntityCopyWithImpl<$Res>
    implements _$LyricsWordEntityCopyWith<$Res> {
  __$LyricsWordEntityCopyWithImpl(this._self, this._then);

  final _LyricsWordEntity _self;
  final $Res Function(_LyricsWordEntity) _then;

/// Create a copy of LyricsWordEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? start = null,Object? end = null,}) {
  return _then(_LyricsWordEntity(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Duration,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
