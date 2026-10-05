// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'caching_progress_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CachingProgressEntity {

 int get totalTasks; int get completedTasks; double get progress; List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})> get results;
/// Create a copy of CachingProgressEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CachingProgressEntityCopyWith<CachingProgressEntity> get copyWith => _$CachingProgressEntityCopyWithImpl<CachingProgressEntity>(this as CachingProgressEntity, _$identity);

  /// Serializes this CachingProgressEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CachingProgressEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CachingProgressEntity&&(identical(other.totalTasks, _this.totalTasks) || other.totalTasks == _this.totalTasks)&&(identical(other.completedTasks, _this.completedTasks) || other.completedTasks == _this.completedTasks)&&(identical(other.progress, _this.progress) || other.progress == _this.progress)&&const DeepCollectionEquality().equals(other.results, _this.results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CachingProgressEntity;
  return Object.hash(runtimeType,_this.totalTasks,_this.completedTasks,_this.progress,const DeepCollectionEquality().hash(_this.results));
}

@override
String toString() {
  final _this = this as CachingProgressEntity;
  return 'CachingProgressEntity(totalTasks: ${_this.totalTasks}, completedTasks: ${_this.completedTasks}, progress: ${_this.progress}, results: ${_this.results})';
}


}

/// @nodoc
abstract mixin class $CachingProgressEntityCopyWith<$Res>  {
  factory $CachingProgressEntityCopyWith(CachingProgressEntity value, $Res Function(CachingProgressEntity) _then) = _$CachingProgressEntityCopyWithImpl;
@useResult
$Res call({
 int totalTasks, int completedTasks, double progress, List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})> results
});




}
/// @nodoc
class _$CachingProgressEntityCopyWithImpl<$Res>
    implements $CachingProgressEntityCopyWith<$Res> {
  _$CachingProgressEntityCopyWithImpl(this._self, this._then);

  final CachingProgressEntity _self;
  final $Res Function(CachingProgressEntity) _then;

/// Create a copy of CachingProgressEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? totalTasks = null,Object? completedTasks = null,Object? progress = null,Object? results = null,}) {
  return _then(CachingProgressEntity(
totalTasks: null == totalTasks ? _self.totalTasks : totalTasks // ignore: cast_nullable_to_non_nullable
as int,completedTasks: null == completedTasks ? _self.completedTasks : completedTasks // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})>,
  ));
}

}


/// Adds pattern-matching-related methods to [CachingProgressEntity].
extension CachingProgressEntityPatterns on CachingProgressEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CachingProgressEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CachingProgressEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CachingProgressEntity value)  $default,){
final _that = this;
switch (_that) {
case _CachingProgressEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CachingProgressEntity value)?  $default,){
final _that = this;
switch (_that) {
case _CachingProgressEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int totalTasks,  int completedTasks,  double progress,  List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CachingProgressEntity() when $default != null:
return $default(_that.totalTasks,_that.completedTasks,_that.progress,_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int totalTasks,  int completedTasks,  double progress,  List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})> results)  $default,) {final _that = this;
switch (_that) {
case _CachingProgressEntity():
return $default(_that.totalTasks,_that.completedTasks,_that.progress,_that.results);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int totalTasks,  int completedTasks,  double progress,  List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})> results)?  $default,) {final _that = this;
switch (_that) {
case _CachingProgressEntity() when $default != null:
return $default(_that.totalTasks,_that.completedTasks,_that.progress,_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CachingProgressEntity extends CachingProgressEntity {
  const _CachingProgressEntity({this.totalTasks = 0, this.completedTasks = 0, this.progress = 0.0,  List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})> results = const []}): _results = results,super._();
  factory _CachingProgressEntity.fromJson(Map<String, dynamic> json) => _$CachingProgressEntityFromJson(json);

@override@JsonKey() final  int totalTasks;
@override@JsonKey() final  int completedTasks;
@override@JsonKey() final  double progress;
 final  List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})> _results;
@override@JsonKey() List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of CachingProgressEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CachingProgressEntityCopyWith<_CachingProgressEntity> get copyWith => __$CachingProgressEntityCopyWithImpl<_CachingProgressEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CachingProgressEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CachingProgressEntity&&(identical(other.totalTasks, totalTasks) || other.totalTasks == totalTasks)&&(identical(other.completedTasks, completedTasks) || other.completedTasks == completedTasks)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,totalTasks,completedTasks,progress,const DeepCollectionEquality().hash(_results));
}

@override
String toString() {
    return 'CachingProgressEntity(totalTasks: $totalTasks, completedTasks: $completedTasks, progress: $progress, results: $results)';
}


}

/// @nodoc
abstract mixin class _$CachingProgressEntityCopyWith<$Res> implements $CachingProgressEntityCopyWith<$Res> {
  factory _$CachingProgressEntityCopyWith(_CachingProgressEntity value, $Res Function(_CachingProgressEntity) _then) = __$CachingProgressEntityCopyWithImpl;
@override @useResult
$Res call({
 int totalTasks, int completedTasks, double progress, List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})> results
});




}
/// @nodoc
class __$CachingProgressEntityCopyWithImpl<$Res>
    implements _$CachingProgressEntityCopyWith<$Res> {
  __$CachingProgressEntityCopyWithImpl(this._self, this._then);

  final _CachingProgressEntity _self;
  final $Res Function(_CachingProgressEntity) _then;

/// Create a copy of CachingProgressEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? totalTasks = null,Object? completedTasks = null,Object? progress = null,Object? results = null,}) {
  return _then(_CachingProgressEntity(
totalTasks: null == totalTasks ? _self.totalTasks : totalTasks // ignore: cast_nullable_to_non_nullable
as int,completedTasks: null == completedTasks ? _self.completedTasks : completedTasks // ignore: cast_nullable_to_non_nullable
as int,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<({ChantEntity chant, ChantLocalResourcesEntity localResources,})>,
  ));
}


}

// dart format on
