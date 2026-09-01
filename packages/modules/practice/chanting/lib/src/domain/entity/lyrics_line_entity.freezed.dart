// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'lyrics_line_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LyricsLineEntity implements DiagnosticableTreeMixin {

 String get text; Duration get start; Duration get end; List<LyricsWordEntity> get words;
/// Create a copy of LyricsLineEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LyricsLineEntityCopyWith<LyricsLineEntity> get copyWith => _$LyricsLineEntityCopyWithImpl<LyricsLineEntity>(this as LyricsLineEntity, _$identity);

  /// Serializes this LyricsLineEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LyricsLineEntity'))
    ..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('words', words));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LyricsLineEntity&&(identical(other.text, text) || other.text == text)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&const DeepCollectionEquality().equals(other.words, words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,start,end,const DeepCollectionEquality().hash(words));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LyricsLineEntity(text: $text, start: $start, end: $end, words: $words)';
}


}

/// @nodoc
abstract mixin class $LyricsLineEntityCopyWith<$Res>  {
  factory $LyricsLineEntityCopyWith(LyricsLineEntity value, $Res Function(LyricsLineEntity) _then) = _$LyricsLineEntityCopyWithImpl;
@useResult
$Res call({
 String text, Duration start, Duration end, List<LyricsWordEntity> words
});




}
/// @nodoc
class _$LyricsLineEntityCopyWithImpl<$Res>
    implements $LyricsLineEntityCopyWith<$Res> {
  _$LyricsLineEntityCopyWithImpl(this._self, this._then);

  final LyricsLineEntity _self;
  final $Res Function(LyricsLineEntity) _then;

/// Create a copy of LyricsLineEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? text = null,Object? start = null,Object? end = null,Object? words = null,}) {
  return _then(_self.copyWith(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Duration,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Duration,words: null == words ? _self.words : words // ignore: cast_nullable_to_non_nullable
as List<LyricsWordEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [LyricsLineEntity].
extension LyricsLineEntityPatterns on LyricsLineEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LyricsLineEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LyricsLineEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LyricsLineEntity value)  $default,){
final _that = this;
switch (_that) {
case _LyricsLineEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LyricsLineEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LyricsLineEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String text,  Duration start,  Duration end,  List<LyricsWordEntity> words)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LyricsLineEntity() when $default != null:
return $default(_that.text,_that.start,_that.end,_that.words);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String text,  Duration start,  Duration end,  List<LyricsWordEntity> words)  $default,) {final _that = this;
switch (_that) {
case _LyricsLineEntity():
return $default(_that.text,_that.start,_that.end,_that.words);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String text,  Duration start,  Duration end,  List<LyricsWordEntity> words)?  $default,) {final _that = this;
switch (_that) {
case _LyricsLineEntity() when $default != null:
return $default(_that.text,_that.start,_that.end,_that.words);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LyricsLineEntity with DiagnosticableTreeMixin implements LyricsLineEntity {
  const _LyricsLineEntity({required this.text, required this.start, required this.end, required final  List<LyricsWordEntity> words}): _words = words;
  factory _LyricsLineEntity.fromJson(Map<String, dynamic> json) => _$LyricsLineEntityFromJson(json);

@override final  String text;
@override final  Duration start;
@override final  Duration end;
 final  List<LyricsWordEntity> _words;
@override List<LyricsWordEntity> get words {
  if (_words is EqualUnmodifiableListView) return _words;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_words);
}


/// Create a copy of LyricsLineEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LyricsLineEntityCopyWith<_LyricsLineEntity> get copyWith => __$LyricsLineEntityCopyWithImpl<_LyricsLineEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LyricsLineEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LyricsLineEntity'))
    ..add(DiagnosticsProperty('text', text))..add(DiagnosticsProperty('start', start))..add(DiagnosticsProperty('end', end))..add(DiagnosticsProperty('words', words));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LyricsLineEntity&&(identical(other.text, text) || other.text == text)&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&const DeepCollectionEquality().equals(other._words, _words));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,text,start,end,const DeepCollectionEquality().hash(_words));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LyricsLineEntity(text: $text, start: $start, end: $end, words: $words)';
}


}

/// @nodoc
abstract mixin class _$LyricsLineEntityCopyWith<$Res> implements $LyricsLineEntityCopyWith<$Res> {
  factory _$LyricsLineEntityCopyWith(_LyricsLineEntity value, $Res Function(_LyricsLineEntity) _then) = __$LyricsLineEntityCopyWithImpl;
@override @useResult
$Res call({
 String text, Duration start, Duration end, List<LyricsWordEntity> words
});




}
/// @nodoc
class __$LyricsLineEntityCopyWithImpl<$Res>
    implements _$LyricsLineEntityCopyWith<$Res> {
  __$LyricsLineEntityCopyWithImpl(this._self, this._then);

  final _LyricsLineEntity _self;
  final $Res Function(_LyricsLineEntity) _then;

/// Create a copy of LyricsLineEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? text = null,Object? start = null,Object? end = null,Object? words = null,}) {
  return _then(_LyricsLineEntity(
text: null == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String,start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as Duration,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as Duration,words: null == words ? _self._words : words // ignore: cast_nullable_to_non_nullable
as List<LyricsWordEntity>,
  ));
}


}

// dart format on
