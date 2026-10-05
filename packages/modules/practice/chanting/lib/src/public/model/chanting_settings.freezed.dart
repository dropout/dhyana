// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chanting_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChantingSettings implements DiagnosticableTreeMixin {

 List<ChantPlaylistItem> get selectedChants;@DateTimeOrNullConverter() DateTime? get lastUsed;
/// Create a copy of ChantingSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChantingSettingsCopyWith<ChantingSettings> get copyWith => _$ChantingSettingsCopyWithImpl<ChantingSettings>(this as ChantingSettings, _$identity);

  /// Serializes this ChantingSettings to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  final _this = this as ChantingSettings;
  properties
    ..add(DiagnosticsProperty('type', 'ChantingSettings'))
    ..add(DiagnosticsProperty('selectedChants', _this.selectedChants))..add(DiagnosticsProperty('lastUsed', _this.lastUsed));
}

@override
bool operator ==(Object other) {
  final _this = this as ChantingSettings;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChantingSettings&&const DeepCollectionEquality().equals(other.selectedChants, _this.selectedChants)&&(identical(other.lastUsed, _this.lastUsed) || other.lastUsed == _this.lastUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChantingSettings;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.selectedChants),_this.lastUsed);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  final _this = this as ChantingSettings;
  return 'ChantingSettings(selectedChants: ${_this.selectedChants}, lastUsed: ${_this.lastUsed})';
}


}

/// @nodoc
abstract mixin class $ChantingSettingsCopyWith<$Res>  {
  factory $ChantingSettingsCopyWith(ChantingSettings value, $Res Function(ChantingSettings) _then) = _$ChantingSettingsCopyWithImpl;
@useResult
$Res call({
 List<ChantPlaylistItem> selectedChants,@DateTimeOrNullConverter() DateTime? lastUsed
});




}
/// @nodoc
class _$ChantingSettingsCopyWithImpl<$Res>
    implements $ChantingSettingsCopyWith<$Res> {
  _$ChantingSettingsCopyWithImpl(this._self, this._then);

  final ChantingSettings _self;
  final $Res Function(ChantingSettings) _then;

/// Create a copy of ChantingSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? selectedChants = null,Object? lastUsed = freezed,}) {
  return _then(ChantingSettings(
selectedChants: null == selectedChants ? _self.selectedChants : selectedChants // ignore: cast_nullable_to_non_nullable
as List<ChantPlaylistItem>,lastUsed: freezed == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChantingSettings].
extension ChantingSettingsPatterns on ChantingSettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChantingSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChantingSettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChantingSettings value)  $default,){
final _that = this;
switch (_that) {
case _ChantingSettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChantingSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ChantingSettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChantPlaylistItem> selectedChants, @DateTimeOrNullConverter()  DateTime? lastUsed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChantingSettings() when $default != null:
return $default(_that.selectedChants,_that.lastUsed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChantPlaylistItem> selectedChants, @DateTimeOrNullConverter()  DateTime? lastUsed)  $default,) {final _that = this;
switch (_that) {
case _ChantingSettings():
return $default(_that.selectedChants,_that.lastUsed);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChantPlaylistItem> selectedChants, @DateTimeOrNullConverter()  DateTime? lastUsed)?  $default,) {final _that = this;
switch (_that) {
case _ChantingSettings() when $default != null:
return $default(_that.selectedChants,_that.lastUsed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChantingSettings extends ChantingSettings with DiagnosticableTreeMixin {
  const _ChantingSettings({ List<ChantPlaylistItem> selectedChants = const <ChantPlaylistItem>[], @DateTimeOrNullConverter() this.lastUsed}): _selectedChants = selectedChants,super._();
  factory _ChantingSettings.fromJson(Map<String, dynamic> json) => _$ChantingSettingsFromJson(json);

 final  List<ChantPlaylistItem> _selectedChants;
@override@JsonKey() List<ChantPlaylistItem> get selectedChants {
  if (_selectedChants is EqualUnmodifiableListView) return _selectedChants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedChants);
}

@override@DateTimeOrNullConverter() final  DateTime? lastUsed;

/// Create a copy of ChantingSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChantingSettingsCopyWith<_ChantingSettings> get copyWith => __$ChantingSettingsCopyWithImpl<_ChantingSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChantingSettingsToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    properties
    ..add(DiagnosticsProperty('type', 'ChantingSettings'))
    ..add(DiagnosticsProperty('selectedChants', selectedChants))..add(DiagnosticsProperty('lastUsed', lastUsed));
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChantingSettings&&const DeepCollectionEquality().equals(other.selectedChants, _selectedChants)&&(identical(other.lastUsed, lastUsed) || other.lastUsed == lastUsed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_selectedChants),lastUsed);
}

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
    return 'ChantingSettings(selectedChants: $selectedChants, lastUsed: $lastUsed)';
}


}

/// @nodoc
abstract mixin class _$ChantingSettingsCopyWith<$Res> implements $ChantingSettingsCopyWith<$Res> {
  factory _$ChantingSettingsCopyWith(_ChantingSettings value, $Res Function(_ChantingSettings) _then) = __$ChantingSettingsCopyWithImpl;
@override @useResult
$Res call({
 List<ChantPlaylistItem> selectedChants,@DateTimeOrNullConverter() DateTime? lastUsed
});




}
/// @nodoc
class __$ChantingSettingsCopyWithImpl<$Res>
    implements _$ChantingSettingsCopyWith<$Res> {
  __$ChantingSettingsCopyWithImpl(this._self, this._then);

  final _ChantingSettings _self;
  final $Res Function(_ChantingSettings) _then;

/// Create a copy of ChantingSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? selectedChants = null,Object? lastUsed = freezed,}) {
  return _then(_ChantingSettings(
selectedChants: null == selectedChants ? _self._selectedChants : selectedChants // ignore: cast_nullable_to_non_nullable
as List<ChantPlaylistItem>,lastUsed: freezed == lastUsed ? _self.lastUsed : lastUsed // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
