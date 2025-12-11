// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'years_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$YearsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YearsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'YearsState()';
}


}

/// @nodoc
class $YearsStateCopyWith<$Res>  {
$YearsStateCopyWith(YearsState _, $Res Function(YearsState) __);
}


/// Adds pattern-matching-related methods to [YearsState].
extension YearsStatePatterns on YearsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( YearsLoadingState value)?  loading,TResult Function( YearsLoadedState value)?  loaded,TResult Function( YearsLoadingErrorState value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case YearsLoadingState() when loading != null:
return loading(_that);case YearsLoadedState() when loaded != null:
return loaded(_that);case YearsLoadingErrorState() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( YearsLoadingState value)  loading,required TResult Function( YearsLoadedState value)  loaded,required TResult Function( YearsLoadingErrorState value)  error,}){
final _that = this;
switch (_that) {
case YearsLoadingState():
return loading(_that);case YearsLoadedState():
return loaded(_that);case YearsLoadingErrorState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( YearsLoadingState value)?  loading,TResult? Function( YearsLoadedState value)?  loaded,TResult? Function( YearsLoadingErrorState value)?  error,}){
final _that = this;
switch (_that) {
case YearsLoadingState() when loading != null:
return loading(_that);case YearsLoadedState() when loaded != null:
return loaded(_that);case YearsLoadingErrorState() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( List<Year> years)?  loaded,TResult Function()?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case YearsLoadingState() when loading != null:
return loading();case YearsLoadedState() when loaded != null:
return loaded(_that.years);case YearsLoadingErrorState() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( List<Year> years)  loaded,required TResult Function()  error,}) {final _that = this;
switch (_that) {
case YearsLoadingState():
return loading();case YearsLoadedState():
return loaded(_that.years);case YearsLoadingErrorState():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( List<Year> years)?  loaded,TResult? Function()?  error,}) {final _that = this;
switch (_that) {
case YearsLoadingState() when loading != null:
return loading();case YearsLoadedState() when loaded != null:
return loaded(_that.years);case YearsLoadingErrorState() when error != null:
return error();case _:
  return null;

}
}

}

/// @nodoc


class YearsLoadingState implements YearsState {
  const YearsLoadingState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YearsLoadingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'YearsState.loading()';
}


}




/// @nodoc


class YearsLoadedState implements YearsState {
  const YearsLoadedState({required final  List<Year> years}): _years = years;
  

 final  List<Year> _years;
 List<Year> get years {
  if (_years is EqualUnmodifiableListView) return _years;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_years);
}


/// Create a copy of YearsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$YearsLoadedStateCopyWith<YearsLoadedState> get copyWith => _$YearsLoadedStateCopyWithImpl<YearsLoadedState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YearsLoadedState&&const DeepCollectionEquality().equals(other._years, _years));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_years));

@override
String toString() {
  return 'YearsState.loaded(years: $years)';
}


}

/// @nodoc
abstract mixin class $YearsLoadedStateCopyWith<$Res> implements $YearsStateCopyWith<$Res> {
  factory $YearsLoadedStateCopyWith(YearsLoadedState value, $Res Function(YearsLoadedState) _then) = _$YearsLoadedStateCopyWithImpl;
@useResult
$Res call({
 List<Year> years
});




}
/// @nodoc
class _$YearsLoadedStateCopyWithImpl<$Res>
    implements $YearsLoadedStateCopyWith<$Res> {
  _$YearsLoadedStateCopyWithImpl(this._self, this._then);

  final YearsLoadedState _self;
  final $Res Function(YearsLoadedState) _then;

/// Create a copy of YearsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? years = null,}) {
  return _then(YearsLoadedState(
years: null == years ? _self._years : years // ignore: cast_nullable_to_non_nullable
as List<Year>,
  ));
}


}

/// @nodoc


class YearsLoadingErrorState implements YearsState {
  const YearsLoadingErrorState();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is YearsLoadingErrorState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'YearsState.error()';
}


}




// dart format on
