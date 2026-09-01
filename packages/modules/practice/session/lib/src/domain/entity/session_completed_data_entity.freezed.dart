// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_completed_data_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SessionCompletedDataEntity {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedDataEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCompletedDataEntity()';
}


}

/// @nodoc
class $SessionCompletedDataEntityCopyWith<$Res>  {
$SessionCompletedDataEntityCopyWith(SessionCompletedDataEntity _, $Res Function(SessionCompletedDataEntity) __);
}


/// Adds pattern-matching-related methods to [SessionCompletedDataEntity].
extension SessionCompletedDataEntityPatterns on SessionCompletedDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SessionCompletedInitialDataEntity value)?  initial,TResult Function( SessionCompletedLoadingDataEntity value)?  loading,TResult Function( SessionCompletedErrorDataEntity value)?  error,TResult Function( SessionCompletedSavingDataEntity value)?  saving,TResult Function( SessionCompletedSavedDataEntity value)?  saved,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SessionCompletedInitialDataEntity() when initial != null:
return initial(_that);case SessionCompletedLoadingDataEntity() when loading != null:
return loading(_that);case SessionCompletedErrorDataEntity() when error != null:
return error(_that);case SessionCompletedSavingDataEntity() when saving != null:
return saving(_that);case SessionCompletedSavedDataEntity() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SessionCompletedInitialDataEntity value)  initial,required TResult Function( SessionCompletedLoadingDataEntity value)  loading,required TResult Function( SessionCompletedErrorDataEntity value)  error,required TResult Function( SessionCompletedSavingDataEntity value)  saving,required TResult Function( SessionCompletedSavedDataEntity value)  saved,}){
final _that = this;
switch (_that) {
case SessionCompletedInitialDataEntity():
return initial(_that);case SessionCompletedLoadingDataEntity():
return loading(_that);case SessionCompletedErrorDataEntity():
return error(_that);case SessionCompletedSavingDataEntity():
return saving(_that);case SessionCompletedSavedDataEntity():
return saved(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SessionCompletedInitialDataEntity value)?  initial,TResult? Function( SessionCompletedLoadingDataEntity value)?  loading,TResult? Function( SessionCompletedErrorDataEntity value)?  error,TResult? Function( SessionCompletedSavingDataEntity value)?  saving,TResult? Function( SessionCompletedSavedDataEntity value)?  saved,}){
final _that = this;
switch (_that) {
case SessionCompletedInitialDataEntity() when initial != null:
return initial(_that);case SessionCompletedLoadingDataEntity() when loading != null:
return loading(_that);case SessionCompletedErrorDataEntity() when error != null:
return error(_that);case SessionCompletedSavingDataEntity() when saving != null:
return saving(_that);case SessionCompletedSavedDataEntity() when saved != null:
return saved(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function()?  error,TResult Function( UpdateProfileStatsResultEntity updateResult)?  saving,TResult Function( UpdateProfileStatsResultEntity updateResult)?  saved,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SessionCompletedInitialDataEntity() when initial != null:
return initial();case SessionCompletedLoadingDataEntity() when loading != null:
return loading();case SessionCompletedErrorDataEntity() when error != null:
return error();case SessionCompletedSavingDataEntity() when saving != null:
return saving(_that.updateResult);case SessionCompletedSavedDataEntity() when saved != null:
return saved(_that.updateResult);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function()  error,required TResult Function( UpdateProfileStatsResultEntity updateResult)  saving,required TResult Function( UpdateProfileStatsResultEntity updateResult)  saved,}) {final _that = this;
switch (_that) {
case SessionCompletedInitialDataEntity():
return initial();case SessionCompletedLoadingDataEntity():
return loading();case SessionCompletedErrorDataEntity():
return error();case SessionCompletedSavingDataEntity():
return saving(_that.updateResult);case SessionCompletedSavedDataEntity():
return saved(_that.updateResult);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function()?  error,TResult? Function( UpdateProfileStatsResultEntity updateResult)?  saving,TResult? Function( UpdateProfileStatsResultEntity updateResult)?  saved,}) {final _that = this;
switch (_that) {
case SessionCompletedInitialDataEntity() when initial != null:
return initial();case SessionCompletedLoadingDataEntity() when loading != null:
return loading();case SessionCompletedErrorDataEntity() when error != null:
return error();case SessionCompletedSavingDataEntity() when saving != null:
return saving(_that.updateResult);case SessionCompletedSavedDataEntity() when saved != null:
return saved(_that.updateResult);case _:
  return null;

}
}

}

/// @nodoc


class SessionCompletedInitialDataEntity extends SessionCompletedDataEntity {
  const SessionCompletedInitialDataEntity(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedInitialDataEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCompletedDataEntity.initial()';
}


}




/// @nodoc


class SessionCompletedLoadingDataEntity extends SessionCompletedDataEntity {
  const SessionCompletedLoadingDataEntity(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedLoadingDataEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCompletedDataEntity.loading()';
}


}




/// @nodoc


class SessionCompletedErrorDataEntity extends SessionCompletedDataEntity {
  const SessionCompletedErrorDataEntity(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedErrorDataEntity);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SessionCompletedDataEntity.error()';
}


}




/// @nodoc


class SessionCompletedSavingDataEntity extends SessionCompletedDataEntity {
  const SessionCompletedSavingDataEntity({required this.updateResult}): super._();
  

 final  UpdateProfileStatsResultEntity updateResult;

/// Create a copy of SessionCompletedDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCompletedSavingDataEntityCopyWith<SessionCompletedSavingDataEntity> get copyWith => _$SessionCompletedSavingDataEntityCopyWithImpl<SessionCompletedSavingDataEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedSavingDataEntity&&(identical(other.updateResult, updateResult) || other.updateResult == updateResult));
}


@override
int get hashCode => Object.hash(runtimeType,updateResult);

@override
String toString() {
  return 'SessionCompletedDataEntity.saving(updateResult: $updateResult)';
}


}

/// @nodoc
abstract mixin class $SessionCompletedSavingDataEntityCopyWith<$Res> implements $SessionCompletedDataEntityCopyWith<$Res> {
  factory $SessionCompletedSavingDataEntityCopyWith(SessionCompletedSavingDataEntity value, $Res Function(SessionCompletedSavingDataEntity) _then) = _$SessionCompletedSavingDataEntityCopyWithImpl;
@useResult
$Res call({
 UpdateProfileStatsResultEntity updateResult
});


$UpdateProfileStatsResultEntityCopyWith<$Res> get updateResult;

}
/// @nodoc
class _$SessionCompletedSavingDataEntityCopyWithImpl<$Res>
    implements $SessionCompletedSavingDataEntityCopyWith<$Res> {
  _$SessionCompletedSavingDataEntityCopyWithImpl(this._self, this._then);

  final SessionCompletedSavingDataEntity _self;
  final $Res Function(SessionCompletedSavingDataEntity) _then;

/// Create a copy of SessionCompletedDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updateResult = null,}) {
  return _then(SessionCompletedSavingDataEntity(
updateResult: null == updateResult ? _self.updateResult : updateResult // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatsResultEntity,
  ));
}

/// Create a copy of SessionCompletedDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateProfileStatsResultEntityCopyWith<$Res> get updateResult {
  
  return $UpdateProfileStatsResultEntityCopyWith<$Res>(_self.updateResult, (value) {
    return _then(_self.copyWith(updateResult: value));
  });
}
}

/// @nodoc


class SessionCompletedSavedDataEntity extends SessionCompletedDataEntity {
  const SessionCompletedSavedDataEntity({required this.updateResult}): super._();
  

 final  UpdateProfileStatsResultEntity updateResult;

/// Create a copy of SessionCompletedDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SessionCompletedSavedDataEntityCopyWith<SessionCompletedSavedDataEntity> get copyWith => _$SessionCompletedSavedDataEntityCopyWithImpl<SessionCompletedSavedDataEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SessionCompletedSavedDataEntity&&(identical(other.updateResult, updateResult) || other.updateResult == updateResult));
}


@override
int get hashCode => Object.hash(runtimeType,updateResult);

@override
String toString() {
  return 'SessionCompletedDataEntity.saved(updateResult: $updateResult)';
}


}

/// @nodoc
abstract mixin class $SessionCompletedSavedDataEntityCopyWith<$Res> implements $SessionCompletedDataEntityCopyWith<$Res> {
  factory $SessionCompletedSavedDataEntityCopyWith(SessionCompletedSavedDataEntity value, $Res Function(SessionCompletedSavedDataEntity) _then) = _$SessionCompletedSavedDataEntityCopyWithImpl;
@useResult
$Res call({
 UpdateProfileStatsResultEntity updateResult
});


$UpdateProfileStatsResultEntityCopyWith<$Res> get updateResult;

}
/// @nodoc
class _$SessionCompletedSavedDataEntityCopyWithImpl<$Res>
    implements $SessionCompletedSavedDataEntityCopyWith<$Res> {
  _$SessionCompletedSavedDataEntityCopyWithImpl(this._self, this._then);

  final SessionCompletedSavedDataEntity _self;
  final $Res Function(SessionCompletedSavedDataEntity) _then;

/// Create a copy of SessionCompletedDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updateResult = null,}) {
  return _then(SessionCompletedSavedDataEntity(
updateResult: null == updateResult ? _self.updateResult : updateResult // ignore: cast_nullable_to_non_nullable
as UpdateProfileStatsResultEntity,
  ));
}

/// Create a copy of SessionCompletedDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UpdateProfileStatsResultEntityCopyWith<$Res> get updateResult {
  
  return $UpdateProfileStatsResultEntityCopyWith<$Res>(_self.updateResult, (value) {
    return _then(_self.copyWith(updateResult: value));
  });
}
}

// dart format on
