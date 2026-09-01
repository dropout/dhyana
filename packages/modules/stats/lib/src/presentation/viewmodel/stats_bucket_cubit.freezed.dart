// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stats_bucket_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$StatsBucketState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsBucketState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsBucketState()';
}


}

/// @nodoc
class $StatsBucketStateCopyWith<$Res>  {
$StatsBucketStateCopyWith(StatsBucketState _, $Res Function(StatsBucketState) __);
}


/// Adds pattern-matching-related methods to [StatsBucketState].
extension StatsBucketStatePatterns on StatsBucketState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( StatsBucketLoadingState value)?  loading,TResult Function( StatsBucketLoadedState value)?  loaded,TResult Function( StatsBucketLoadingErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case StatsBucketLoadingState() when loading != null:
return loading(_that);case StatsBucketLoadedState() when loaded != null:
return loaded(_that);case StatsBucketLoadingErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( StatsBucketLoadingState value)  loading,required TResult Function( StatsBucketLoadedState value)  loaded,required TResult Function( StatsBucketLoadingErrorState value)  error,}){
final _that = this;
switch (_that) {
case StatsBucketLoadingState():
return loading(_that);case StatsBucketLoadedState():
return loaded(_that);case StatsBucketLoadingErrorState():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( StatsBucketLoadingState value)?  loading,TResult? Function( StatsBucketLoadedState value)?  loaded,TResult? Function( StatsBucketLoadingErrorState value)?  error,}){
final _that = this;
switch (_that) {
case StatsBucketLoadingState() when loading != null:
return loading(_that);case StatsBucketLoadedState() when loaded != null:
return loaded(_that);case StatsBucketLoadingErrorState() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<StatsBucket> buckets)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case StatsBucketLoadingState() when loading != null:
return loading();case StatsBucketLoadedState() when loaded != null:
return loaded(_that.buckets);case StatsBucketLoadingErrorState() when error != null:
return error();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<StatsBucket> buckets)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case StatsBucketLoadingState():
return loading();case StatsBucketLoadedState():
return loaded(_that.buckets);case StatsBucketLoadingErrorState():
return error();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<StatsBucket> buckets)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case StatsBucketLoadingState() when loading != null:
return loading();case StatsBucketLoadedState() when loaded != null:
return loaded(_that.buckets);case StatsBucketLoadingErrorState() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class StatsBucketLoadingState implements StatsBucketState {
  const StatsBucketLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsBucketLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsBucketState.loading()';
}


}




/// @nodoc


class StatsBucketLoadedState implements StatsBucketState {
  const StatsBucketLoadedState({required final  List<StatsBucket> buckets}): _buckets = buckets;
  

 final  List<StatsBucket> _buckets;
 List<StatsBucket> get buckets {
  if (_buckets is EqualUnmodifiableListView) return _buckets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_buckets);
}


/// Create a copy of StatsBucketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StatsBucketLoadedStateCopyWith<StatsBucketLoadedState> get copyWith => _$StatsBucketLoadedStateCopyWithImpl<StatsBucketLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsBucketLoadedState&&const DeepCollectionEquality().equals(other._buckets, _buckets));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_buckets));

@override
String toString() {
  return 'StatsBucketState.loaded(buckets: $buckets)';
}


}

/// @nodoc
abstract mixin class $StatsBucketLoadedStateCopyWith<$Res> implements $StatsBucketStateCopyWith<$Res> {
  factory $StatsBucketLoadedStateCopyWith(StatsBucketLoadedState value, $Res Function(StatsBucketLoadedState) _then) = _$StatsBucketLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<StatsBucket> buckets
});




}
/// @nodoc
class _$StatsBucketLoadedStateCopyWithImpl<$Res>
    implements $StatsBucketLoadedStateCopyWith<$Res> {
  _$StatsBucketLoadedStateCopyWithImpl(this._self, this._then);

  final StatsBucketLoadedState _self;
  final $Res Function(StatsBucketLoadedState) _then;

/// Create a copy of StatsBucketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? buckets = null,}) {
  return _then(StatsBucketLoadedState(
buckets: null == buckets ? _self._buckets : buckets // ignore: cast_nullable_to_non_nullable
as List<StatsBucket>,
  ));
}


}

/// @nodoc


class StatsBucketLoadingErrorState implements StatsBucketState {
  const StatsBucketLoadingErrorState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StatsBucketLoadingErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'StatsBucketState.error()';
}


}




// dart format on
