// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_settings_history_record_query_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TimerSettingsHistoryRecordQueryOptions implements DiagnosticableTreeMixin {

 int get limit;
/// Create a copy of TimerSettingsHistoryRecordQueryOptions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerSettingsHistoryRecordQueryOptionsCopyWith<TimerSettingsHistoryRecordQueryOptions> get copyWith => _$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl<TimerSettingsHistoryRecordQueryOptions>(this as TimerSettingsHistoryRecordQueryOptions, _$identity);

  /// Serializes this TimerSettingsHistoryRecordQueryOptions to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsHistoryRecordQueryOptions'))
    ..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerSettingsHistoryRecordQueryOptions&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimerSettingsHistoryRecordQueryOptions(limit: $limit)';
}


}

/// @nodoc
abstract mixin class $TimerSettingsHistoryRecordQueryOptionsCopyWith<$Res>  {
  factory $TimerSettingsHistoryRecordQueryOptionsCopyWith(TimerSettingsHistoryRecordQueryOptions value, $Res Function(TimerSettingsHistoryRecordQueryOptions) _then) = _$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl;
@useResult
$Res call({
 int limit
});




}
/// @nodoc
class _$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl<$Res>
    implements $TimerSettingsHistoryRecordQueryOptionsCopyWith<$Res> {
  _$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl(this._self, this._then);

  final TimerSettingsHistoryRecordQueryOptions _self;
  final $Res Function(TimerSettingsHistoryRecordQueryOptions) _then;

/// Create a copy of TimerSettingsHistoryRecordQueryOptions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? limit = null,}) {
  return _then(_self.copyWith(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TimerSettingsHistoryRecordQueryOptions].
extension TimerSettingsHistoryRecordQueryOptionsPatterns on TimerSettingsHistoryRecordQueryOptions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerSettingsHistoryRecordQueryOptions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerSettingsHistoryRecordQueryOptions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerSettingsHistoryRecordQueryOptions value)  $default,){
final _that = this;
switch (_that) {
case _TimerSettingsHistoryRecordQueryOptions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerSettingsHistoryRecordQueryOptions value)?  $default,){
final _that = this;
switch (_that) {
case _TimerSettingsHistoryRecordQueryOptions() when $default != null:
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
case _TimerSettingsHistoryRecordQueryOptions() when $default != null:
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
case _TimerSettingsHistoryRecordQueryOptions():
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
case _TimerSettingsHistoryRecordQueryOptions() when $default != null:
return $default(_that.limit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TimerSettingsHistoryRecordQueryOptions extends TimerSettingsHistoryRecordQueryOptions with DiagnosticableTreeMixin {
  const _TimerSettingsHistoryRecordQueryOptions({this.limit = 20}): super._();
  factory _TimerSettingsHistoryRecordQueryOptions.fromJson(Map<String, dynamic> json) => _$TimerSettingsHistoryRecordQueryOptionsFromJson(json);

@override@JsonKey() final  int limit;

/// Create a copy of TimerSettingsHistoryRecordQueryOptions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerSettingsHistoryRecordQueryOptionsCopyWith<_TimerSettingsHistoryRecordQueryOptions> get copyWith => __$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl<_TimerSettingsHistoryRecordQueryOptions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TimerSettingsHistoryRecordQueryOptionsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TimerSettingsHistoryRecordQueryOptions'))
    ..add(DiagnosticsProperty('limit', limit));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerSettingsHistoryRecordQueryOptions&&(identical(other.limit, limit) || other.limit == limit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,limit);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TimerSettingsHistoryRecordQueryOptions(limit: $limit)';
}


}

/// @nodoc
abstract mixin class _$TimerSettingsHistoryRecordQueryOptionsCopyWith<$Res> implements $TimerSettingsHistoryRecordQueryOptionsCopyWith<$Res> {
  factory _$TimerSettingsHistoryRecordQueryOptionsCopyWith(_TimerSettingsHistoryRecordQueryOptions value, $Res Function(_TimerSettingsHistoryRecordQueryOptions) _then) = __$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl;
@override @useResult
$Res call({
 int limit
});




}
/// @nodoc
class __$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl<$Res>
    implements _$TimerSettingsHistoryRecordQueryOptionsCopyWith<$Res> {
  __$TimerSettingsHistoryRecordQueryOptionsCopyWithImpl(this._self, this._then);

  final _TimerSettingsHistoryRecordQueryOptions _self;
  final $Res Function(_TimerSettingsHistoryRecordQueryOptions) _then;

/// Create a copy of TimerSettingsHistoryRecordQueryOptions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? limit = null,}) {
  return _then(_TimerSettingsHistoryRecordQueryOptions(
limit: null == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
