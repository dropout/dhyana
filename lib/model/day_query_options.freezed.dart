// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DayQueryOptions implements DiagnosticableTreeMixin {

 DateTime get from; DateTime get to; int get limit;
/// Create a copy of DayQueryOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DayQueryOptionsCopyWith<DayQueryOptions> get copyWith => _$DayQueryOptionsCopyWithImpl<DayQueryOptions>(this as DayQueryOptions, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DayQueryOptions'))
    ..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DayQueryOptions&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DayQueryOptions(from: $from, to: $to, limit: $limit)';
}


}

/// @nodoc
abstract mixin class $DayQueryOptionsCopyWith<$Res>  {
  factory $DayQueryOptionsCopyWith(DayQueryOptions value, $Res Function(DayQueryOptions) _then) = _$DayQueryOptionsCopyWithImpl;
@useResult
$Res call({
 DateTime from, DateTime to, int limit
});




}
/// @nodoc
class _$DayQueryOptionsCopyWithImpl<$Res>
    implements $DayQueryOptionsCopyWith<$Res> {
  _$DayQueryOptionsCopyWithImpl(this._self, this._then);

  final DayQueryOptions _self;
  final $Res Function(DayQueryOptions) _then;

/// Create a copy of DayQueryOptions
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


/// Adds pattern-matching-related methods to [DayQueryOptions].
extension DayQueryOptionsPatterns on DayQueryOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DayQueryOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DayQueryOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DayQueryOptions value)  $default,){
final _that = this;
switch (_that) {
case _DayQueryOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DayQueryOptions value)?  $default,){
final _that = this;
switch (_that) {
case _DayQueryOptions() when $default != null:
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
case _DayQueryOptions() when $default != null:
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
case _DayQueryOptions():
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
case _DayQueryOptions() when $default != null:
return $default(_that.from,_that.to,_that.limit);case _:
  return null;

}
}

}

/// @nodoc


class _DayQueryOptions extends DayQueryOptions with DiagnosticableTreeMixin {
  const _DayQueryOptions({required this.from, required this.to, this.limit = 20}): super._();
  

@override final  DateTime from;
@override final  DateTime to;
@override@JsonKey() final  int limit;

/// Create a copy of DayQueryOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DayQueryOptionsCopyWith<_DayQueryOptions> get copyWith => __$DayQueryOptionsCopyWithImpl<_DayQueryOptions>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'DayQueryOptions'))
    ..add(DiagnosticsProperty('from', from))..add(DiagnosticsProperty('to', to))..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DayQueryOptions&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.limit, limit) || other.limit == limit));
}


@override
int get hashCode => Object.hash(runtimeType,from,to,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'DayQueryOptions(from: $from, to: $to, limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$DayQueryOptionsCopyWith<$Res> implements $DayQueryOptionsCopyWith<$Res> {
  factory _$DayQueryOptionsCopyWith(_DayQueryOptions value, $Res Function(_DayQueryOptions) _then) = __$DayQueryOptionsCopyWithImpl;
@override @useResult
$Res call({
 DateTime from, DateTime to, int limit
});




}
/// @nodoc
class __$DayQueryOptionsCopyWithImpl<$Res>
    implements _$DayQueryOptionsCopyWith<$Res> {
  __$DayQueryOptionsCopyWithImpl(this._self, this._then);

  final _DayQueryOptions _self;
  final $Res Function(_DayQueryOptions) _then;

/// Create a copy of DayQueryOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? from = null,Object? to = null,Object? limit = null,}) {
  return _then(_DayQueryOptions(
from: null == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime,to: null == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime,limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
