// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionQueryOptions implements DiagnosticableTreeMixin {

 int get limit;
/// Create a copy of SessionQueryOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionQueryOptionsCopyWith<SessionQueryOptions> get copyWith => _$SessionQueryOptionsCopyWithImpl<SessionQueryOptions>(this as SessionQueryOptions, _$identity);

  /// Serializes this SessionQueryOptions to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionQueryOptions'))
    ..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionQueryOptions&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionQueryOptions(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $SessionQueryOptionsCopyWith<$Res>  {
  factory $SessionQueryOptionsCopyWith(SessionQueryOptions value, $Res Function(SessionQueryOptions) _then) = _$SessionQueryOptionsCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$SessionQueryOptionsCopyWithImpl<$Res>
    implements $SessionQueryOptionsCopyWith<$Res> {
  _$SessionQueryOptionsCopyWithImpl(this._self, this._then);

  final SessionQueryOptions _self;
  final $Res Function(SessionQueryOptions) _then;

/// Create a copy of SessionQueryOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SessionQueryOptions].
extension SessionQueryOptionsPatterns on SessionQueryOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SessionQueryOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SessionQueryOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SessionQueryOptions value)  $default,){
final _that = this;
switch (_that) {
case _SessionQueryOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SessionQueryOptions value)?  $default,){
final _that = this;
switch (_that) {
case _SessionQueryOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SessionQueryOptions() when $default != null:
return $default(_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int limit)  $default,) {final _that = this;
switch (_that) {
case _SessionQueryOptions():
return $default(_that.limit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int limit)?  $default,) {final _that = this;
switch (_that) {
case _SessionQueryOptions() when $default != null:
return $default(_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SessionQueryOptions extends SessionQueryOptions with DiagnosticableTreeMixin {
  const _SessionQueryOptions({this.limit = 20}): super._();
  factory _SessionQueryOptions.fromJson(Map<String, dynamic> json) => _$SessionQueryOptionsFromJson(json);

@override@JsonKey() final  int limit;

/// Create a copy of SessionQueryOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SessionQueryOptionsCopyWith<_SessionQueryOptions> get copyWith => __$SessionQueryOptionsCopyWithImpl<_SessionQueryOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SessionQueryOptionsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'SessionQueryOptions'))
    ..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SessionQueryOptions&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'SessionQueryOptions(limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$SessionQueryOptionsCopyWith<$Res> implements $SessionQueryOptionsCopyWith<$Res> {
  factory _$SessionQueryOptionsCopyWith(_SessionQueryOptions value, $Res Function(_SessionQueryOptions) _then) = __$SessionQueryOptionsCopyWithImpl;
@override @useResult
$Res call({
 int limit
});




}
/// @nodoc
class __$SessionQueryOptionsCopyWithImpl<$Res>
    implements _$SessionQueryOptionsCopyWith<$Res> {
  __$SessionQueryOptionsCopyWithImpl(this._self, this._then);

  final _SessionQueryOptions _self;
  final $Res Function(_SessionQueryOptions) _then;

/// Create a copy of SessionQueryOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(_SessionQueryOptions(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
