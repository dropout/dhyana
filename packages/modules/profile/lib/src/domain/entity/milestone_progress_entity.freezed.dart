// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'milestone_progress_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MilestoneProgressEntity implements DiagnosticableTreeMixin {

 int get completedDaysCount;// Update default targetDaysCount in firebase function onbeforeCreateUser too
 int get targetDaysCount; List<ProfileSessionEntity> get sessions;
/// Create a copy of MilestoneProgressEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MilestoneProgressEntityCopyWith<MilestoneProgressEntity> get copyWith => _$MilestoneProgressEntityCopyWithImpl<MilestoneProgressEntity>(this as MilestoneProgressEntity, _$identity);

  /// Serializes this MilestoneProgressEntity to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MilestoneProgressEntity'))
    ..add(DiagnosticsProperty('completedDaysCount', completedDaysCount))..add(DiagnosticsProperty('targetDaysCount', targetDaysCount))..add(DiagnosticsProperty('sessions', sessions));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MilestoneProgressEntity&&(identical(other.completedDaysCount, completedDaysCount) || other.completedDaysCount == completedDaysCount)&&(identical(other.targetDaysCount, targetDaysCount) || other.targetDaysCount == targetDaysCount)&&const DeepCollectionEquality().equals(other.sessions, sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completedDaysCount,targetDaysCount,const DeepCollectionEquality().hash(sessions));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MilestoneProgressEntity(completedDaysCount: $completedDaysCount, targetDaysCount: $targetDaysCount, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class $MilestoneProgressEntityCopyWith<$Res>  {
  factory $MilestoneProgressEntityCopyWith(MilestoneProgressEntity value, $Res Function(MilestoneProgressEntity) _then) = _$MilestoneProgressEntityCopyWithImpl;
@useResult
$Res call({
 int completedDaysCount, int targetDaysCount, List<ProfileSessionEntity> sessions
});




}
/// @nodoc
class _$MilestoneProgressEntityCopyWithImpl<$Res>
    implements $MilestoneProgressEntityCopyWith<$Res> {
  _$MilestoneProgressEntityCopyWithImpl(this._self, this._then);

  final MilestoneProgressEntity _self;
  final $Res Function(MilestoneProgressEntity) _then;

/// Create a copy of MilestoneProgressEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? completedDaysCount = null,Object? targetDaysCount = null,Object? sessions = null,}) {
  return _then(_self.copyWith(
completedDaysCount: null == completedDaysCount ? _self.completedDaysCount : completedDaysCount // ignore: cast_nullable_to_non_nullable
as int,targetDaysCount: null == targetDaysCount ? _self.targetDaysCount : targetDaysCount // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self.sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<ProfileSessionEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [MilestoneProgressEntity].
extension MilestoneProgressEntityPatterns on MilestoneProgressEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MilestoneProgressEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MilestoneProgressEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MilestoneProgressEntity value)  $default,){
final _that = this;
switch (_that) {
case _MilestoneProgressEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MilestoneProgressEntity value)?  $default,){
final _that = this;
switch (_that) {
case _MilestoneProgressEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int completedDaysCount,  int targetDaysCount,  List<ProfileSessionEntity> sessions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MilestoneProgressEntity() when $default != null:
return $default(_that.completedDaysCount,_that.targetDaysCount,_that.sessions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int completedDaysCount,  int targetDaysCount,  List<ProfileSessionEntity> sessions)  $default,) {final _that = this;
switch (_that) {
case _MilestoneProgressEntity():
return $default(_that.completedDaysCount,_that.targetDaysCount,_that.sessions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int completedDaysCount,  int targetDaysCount,  List<ProfileSessionEntity> sessions)?  $default,) {final _that = this;
switch (_that) {
case _MilestoneProgressEntity() when $default != null:
return $default(_that.completedDaysCount,_that.targetDaysCount,_that.sessions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MilestoneProgressEntity extends MilestoneProgressEntity with DiagnosticableTreeMixin {
  const _MilestoneProgressEntity({this.completedDaysCount = 0, this.targetDaysCount = 7, final  List<ProfileSessionEntity> sessions = const []}): _sessions = sessions,super._();
  factory _MilestoneProgressEntity.fromJson(Map<String, dynamic> json) => _$MilestoneProgressEntityFromJson(json);

@override@JsonKey() final  int completedDaysCount;
// Update default targetDaysCount in firebase function onbeforeCreateUser too
@override@JsonKey() final  int targetDaysCount;
 final  List<ProfileSessionEntity> _sessions;
@override@JsonKey() List<ProfileSessionEntity> get sessions {
  if (_sessions is EqualUnmodifiableListView) return _sessions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sessions);
}


/// Create a copy of MilestoneProgressEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MilestoneProgressEntityCopyWith<_MilestoneProgressEntity> get copyWith => __$MilestoneProgressEntityCopyWithImpl<_MilestoneProgressEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MilestoneProgressEntityToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MilestoneProgressEntity'))
    ..add(DiagnosticsProperty('completedDaysCount', completedDaysCount))..add(DiagnosticsProperty('targetDaysCount', targetDaysCount))..add(DiagnosticsProperty('sessions', sessions));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MilestoneProgressEntity&&(identical(other.completedDaysCount, completedDaysCount) || other.completedDaysCount == completedDaysCount)&&(identical(other.targetDaysCount, targetDaysCount) || other.targetDaysCount == targetDaysCount)&&const DeepCollectionEquality().equals(other._sessions, _sessions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,completedDaysCount,targetDaysCount,const DeepCollectionEquality().hash(_sessions));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MilestoneProgressEntity(completedDaysCount: $completedDaysCount, targetDaysCount: $targetDaysCount, sessions: $sessions)';
}


}

/// @nodoc
abstract mixin class _$MilestoneProgressEntityCopyWith<$Res> implements $MilestoneProgressEntityCopyWith<$Res> {
  factory _$MilestoneProgressEntityCopyWith(_MilestoneProgressEntity value, $Res Function(_MilestoneProgressEntity) _then) = __$MilestoneProgressEntityCopyWithImpl;
@override @useResult
$Res call({
 int completedDaysCount, int targetDaysCount, List<ProfileSessionEntity> sessions
});




}
/// @nodoc
class __$MilestoneProgressEntityCopyWithImpl<$Res>
    implements _$MilestoneProgressEntityCopyWith<$Res> {
  __$MilestoneProgressEntityCopyWithImpl(this._self, this._then);

  final _MilestoneProgressEntity _self;
  final $Res Function(_MilestoneProgressEntity) _then;

/// Create a copy of MilestoneProgressEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? completedDaysCount = null,Object? targetDaysCount = null,Object? sessions = null,}) {
  return _then(_MilestoneProgressEntity(
completedDaysCount: null == completedDaysCount ? _self.completedDaysCount : completedDaysCount // ignore: cast_nullable_to_non_nullable
as int,targetDaysCount: null == targetDaysCount ? _self.targetDaysCount : targetDaysCount // ignore: cast_nullable_to_non_nullable
as int,sessions: null == sessions ? _self._sessions : sessions // ignore: cast_nullable_to_non_nullable
as List<ProfileSessionEntity>,
  ));
}


}

// dart format on
