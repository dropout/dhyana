// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'month_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MonthQueryOptions implements DiagnosticableTreeMixin {

 DateTime get from; DateTime get to; int get limit;
/// Create a copy of MonthQueryOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MonthQueryOptionsCopyWith<MonthQueryOptions> get copyWith => _$MonthQueryOptionsCopyWithImpl<MonthQueryOptions>(this as MonthQueryOptions, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MonthQueryOptions'))
    ..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MonthQueryOptions&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MonthQueryOptions(from: $from, to: $to, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $MonthQueryOptionsCopyWith<$Res>  {
  factory $MonthQueryOptionsCopyWith(MonthQueryOptions value, $Res Function(MonthQueryOptions) _then) = _$MonthQueryOptionsCopyWithImpl;
@useResult
$Res call({
 DateTime from, DateTime to, int limit
});




}
/// @nodoc
class _$MonthQueryOptionsCopyWithImpl<$Res>
    implements $MonthQueryOptionsCopyWith<$Res> {
  _$MonthQueryOptionsCopyWithImpl(this._self, this._then);

  final MonthQueryOptions _self;
  final $Res Function(MonthQueryOptions) _then;

/// Create a copy of MonthQueryOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? from = null,Object? to = null,Object? limit = null,}) {
  return _then(_self.copyWith(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [MonthQueryOptions].
extension MonthQueryOptionsPatterns on MonthQueryOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MonthQueryOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MonthQueryOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MonthQueryOptions value)  $default,){
final _that = this;
switch (_that) {
case _MonthQueryOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MonthQueryOptions value)?  $default,){
final _that = this;
switch (_that) {
case _MonthQueryOptions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime from,  DateTime to,  int limit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MonthQueryOptions() when $default != null:
return $default(_that.from,_that.to,_that.limit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime from,  DateTime to,  int limit)  $default,) {final _that = this;
switch (_that) {
case _MonthQueryOptions():
return $default(_that.from,_that.to,_that.limit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime from,  DateTime to,  int limit)?  $default,) {final _that = this;
switch (_that) {
case _MonthQueryOptions() when $default != null:
return $default(_that.from,_that.to,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _MonthQueryOptions extends MonthQueryOptions with DiagnosticableTreeMixin {
  const _MonthQueryOptions({required this.from, required this.to, this.limit = 20}): super._();
  

@override final  DateTime from;
@override final  DateTime to;
@override@JsonKey() final  int limit;

/// Create a copy of MonthQueryOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MonthQueryOptionsCopyWith<_MonthQueryOptions> get copyWith => __$MonthQueryOptionsCopyWithImpl<_MonthQueryOptions>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MonthQueryOptions'))
    ..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MonthQueryOptions&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MonthQueryOptions(from: $from, to: $to, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$MonthQueryOptionsCopyWith<$Res> implements $MonthQueryOptionsCopyWith<$Res> {
  factory _$MonthQueryOptionsCopyWith(_MonthQueryOptions value, $Res Function(_MonthQueryOptions) _then) = __$MonthQueryOptionsCopyWithImpl;
@override @useResult
$Res call({
 DateTime from, DateTime to, int limit
});




}
/// @nodoc
class __$MonthQueryOptionsCopyWithImpl<$Res>
    implements _$MonthQueryOptionsCopyWith<$Res> {
  __$MonthQueryOptionsCopyWithImpl(this._self, this._then);

  final _MonthQueryOptions _self;
  final $Res Function(_MonthQueryOptions) _then;

/// Create a copy of MonthQueryOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? limit = null,}) {
  return _then(_MonthQueryOptions(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
