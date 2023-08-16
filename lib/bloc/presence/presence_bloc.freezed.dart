// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'presence_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PresenceEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? ownProfileId) load,
    required TResult Function() showPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? ownProfileId)? load,
    TResult? Function()? showPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? ownProfileId)? load,
    TResult Function()? showPresence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPresenceData value) load,
    required TResult Function(ShowPresence value) showPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPresenceData value)? load,
    TResult? Function(ShowPresence value)? showPresence,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPresenceData value)? load,
    TResult Function(ShowPresence value)? showPresence,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceEventCopyWith<$Res> {
  factory $PresenceEventCopyWith(
          PresenceEvent value, $Res Function(PresenceEvent) then) =
      _$PresenceEventCopyWithImpl<$Res, PresenceEvent>;
}

/// @nodoc
class _$PresenceEventCopyWithImpl<$Res, $Val extends PresenceEvent>
    implements $PresenceEventCopyWith<$Res> {
  _$PresenceEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoadPresenceDataCopyWith<$Res> {
  factory _$$LoadPresenceDataCopyWith(
          _$LoadPresenceData value, $Res Function(_$LoadPresenceData) then) =
      __$$LoadPresenceDataCopyWithImpl<$Res>;
  @useResult
  $Res call({String? ownProfileId});
}

/// @nodoc
class __$$LoadPresenceDataCopyWithImpl<$Res>
    extends _$PresenceEventCopyWithImpl<$Res, _$LoadPresenceData>
    implements _$$LoadPresenceDataCopyWith<$Res> {
  __$$LoadPresenceDataCopyWithImpl(
      _$LoadPresenceData _value, $Res Function(_$LoadPresenceData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ownProfileId = freezed,
  }) {
    return _then(_$LoadPresenceData(
      ownProfileId: freezed == ownProfileId
          ? _value.ownProfileId
          : ownProfileId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$LoadPresenceData extends LoadPresenceData {
  const _$LoadPresenceData({this.ownProfileId}) : super._();

  @override
  final String? ownProfileId;

  @override
  String toString() {
    return 'PresenceEvent.load(ownProfileId: $ownProfileId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadPresenceData &&
            (identical(other.ownProfileId, ownProfileId) ||
                other.ownProfileId == ownProfileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ownProfileId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadPresenceDataCopyWith<_$LoadPresenceData> get copyWith =>
      __$$LoadPresenceDataCopyWithImpl<_$LoadPresenceData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? ownProfileId) load,
    required TResult Function() showPresence,
  }) {
    return load(ownProfileId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? ownProfileId)? load,
    TResult? Function()? showPresence,
  }) {
    return load?.call(ownProfileId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? ownProfileId)? load,
    TResult Function()? showPresence,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(ownProfileId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPresenceData value) load,
    required TResult Function(ShowPresence value) showPresence,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPresenceData value)? load,
    TResult? Function(ShowPresence value)? showPresence,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPresenceData value)? load,
    TResult Function(ShowPresence value)? showPresence,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class LoadPresenceData extends PresenceEvent {
  const factory LoadPresenceData({final String? ownProfileId}) =
      _$LoadPresenceData;
  const LoadPresenceData._() : super._();

  String? get ownProfileId;
  @JsonKey(ignore: true)
  _$$LoadPresenceDataCopyWith<_$LoadPresenceData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ShowPresenceCopyWith<$Res> {
  factory _$$ShowPresenceCopyWith(
          _$ShowPresence value, $Res Function(_$ShowPresence) then) =
      __$$ShowPresenceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ShowPresenceCopyWithImpl<$Res>
    extends _$PresenceEventCopyWithImpl<$Res, _$ShowPresence>
    implements _$$ShowPresenceCopyWith<$Res> {
  __$$ShowPresenceCopyWithImpl(
      _$ShowPresence _value, $Res Function(_$ShowPresence) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ShowPresence extends ShowPresence {
  const _$ShowPresence() : super._();

  @override
  String toString() {
    return 'PresenceEvent.showPresence()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ShowPresence);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String? ownProfileId) load,
    required TResult Function() showPresence,
  }) {
    return showPresence();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String? ownProfileId)? load,
    TResult? Function()? showPresence,
  }) {
    return showPresence?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String? ownProfileId)? load,
    TResult Function()? showPresence,
    required TResult orElse(),
  }) {
    if (showPresence != null) {
      return showPresence();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadPresenceData value) load,
    required TResult Function(ShowPresence value) showPresence,
  }) {
    return showPresence(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadPresenceData value)? load,
    TResult? Function(ShowPresence value)? showPresence,
  }) {
    return showPresence?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadPresenceData value)? load,
    TResult Function(ShowPresence value)? showPresence,
    required TResult orElse(),
  }) {
    if (showPresence != null) {
      return showPresence(this);
    }
    return orElse();
  }
}

abstract class ShowPresence extends PresenceEvent {
  const factory ShowPresence() = _$ShowPresence;
  const ShowPresence._() : super._();
}

/// @nodoc
mixin _$PresenceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PresenceStateCopyWith<$Res> {
  factory $PresenceStateCopyWith(
          PresenceState value, $Res Function(PresenceState) then) =
      _$PresenceStateCopyWithImpl<$Res, PresenceState>;
}

/// @nodoc
class _$PresenceStateCopyWithImpl<$Res, $Val extends PresenceState>
    implements $PresenceStateCopyWith<$Res> {
  _$PresenceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PresenceStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial extends _Initial {
  const _$_Initial() : super._();

  @override
  String toString() {
    return 'PresenceState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial extends PresenceState {
  const factory _Initial() = _$_Initial;
  const _Initial._() : super._();
}

/// @nodoc
abstract class _$$PresenceLoadingStateCopyWith<$Res> {
  factory _$$PresenceLoadingStateCopyWith(_$PresenceLoadingState value,
          $Res Function(_$PresenceLoadingState) then) =
      __$$PresenceLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PresenceLoadingStateCopyWithImpl<$Res>
    extends _$PresenceStateCopyWithImpl<$Res, _$PresenceLoadingState>
    implements _$$PresenceLoadingStateCopyWith<$Res> {
  __$$PresenceLoadingStateCopyWithImpl(_$PresenceLoadingState _value,
      $Res Function(_$PresenceLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PresenceLoadingState extends PresenceLoadingState {
  const _$PresenceLoadingState() : super._();

  @override
  String toString() {
    return 'PresenceState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PresenceLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class PresenceLoadingState extends PresenceState {
  const factory PresenceLoadingState() = _$PresenceLoadingState;
  const PresenceLoadingState._() : super._();
}

/// @nodoc
abstract class _$$PresenceLoadedStateCopyWith<$Res> {
  factory _$$PresenceLoadedStateCopyWith(_$PresenceLoadedState value,
          $Res Function(_$PresenceLoadedState) then) =
      __$$PresenceLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Presence> presenceList});
}

/// @nodoc
class __$$PresenceLoadedStateCopyWithImpl<$Res>
    extends _$PresenceStateCopyWithImpl<$Res, _$PresenceLoadedState>
    implements _$$PresenceLoadedStateCopyWith<$Res> {
  __$$PresenceLoadedStateCopyWithImpl(
      _$PresenceLoadedState _value, $Res Function(_$PresenceLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? presenceList = null,
  }) {
    return _then(_$PresenceLoadedState(
      presenceList: null == presenceList
          ? _value._presenceList
          : presenceList // ignore: cast_nullable_to_non_nullable
              as List<Presence>,
    ));
  }
}

/// @nodoc

class _$PresenceLoadedState extends PresenceLoadedState {
  const _$PresenceLoadedState({required final List<Presence> presenceList})
      : _presenceList = presenceList,
        super._();

  final List<Presence> _presenceList;
  @override
  List<Presence> get presenceList {
    if (_presenceList is EqualUnmodifiableListView) return _presenceList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_presenceList);
  }

  @override
  String toString() {
    return 'PresenceState.loaded(presenceList: $presenceList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PresenceLoadedState &&
            const DeepCollectionEquality()
                .equals(other._presenceList, _presenceList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_presenceList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PresenceLoadedStateCopyWith<_$PresenceLoadedState> get copyWith =>
      __$$PresenceLoadedStateCopyWithImpl<_$PresenceLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) {
    return loaded(presenceList);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(presenceList);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(presenceList);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class PresenceLoadedState extends PresenceState {
  const factory PresenceLoadedState(
      {required final List<Presence> presenceList}) = _$PresenceLoadedState;
  const PresenceLoadedState._() : super._();

  List<Presence> get presenceList;
  @JsonKey(ignore: true)
  _$$PresenceLoadedStateCopyWith<_$PresenceLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PresenceErrorStateCopyWith<$Res> {
  factory _$$PresenceErrorStateCopyWith(_$PresenceErrorState value,
          $Res Function(_$PresenceErrorState) then) =
      __$$PresenceErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PresenceErrorStateCopyWithImpl<$Res>
    extends _$PresenceStateCopyWithImpl<$Res, _$PresenceErrorState>
    implements _$$PresenceErrorStateCopyWith<$Res> {
  __$$PresenceErrorStateCopyWithImpl(
      _$PresenceErrorState _value, $Res Function(_$PresenceErrorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$PresenceErrorState extends PresenceErrorState {
  const _$PresenceErrorState() : super._();

  @override
  String toString() {
    return 'PresenceState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PresenceErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Presence> presenceList) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Presence> presenceList)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Presence> presenceList)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(PresenceLoadingState value) loading,
    required TResult Function(PresenceLoadedState value) loaded,
    required TResult Function(PresenceErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(PresenceLoadingState value)? loading,
    TResult? Function(PresenceLoadedState value)? loaded,
    TResult? Function(PresenceErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(PresenceLoadingState value)? loading,
    TResult Function(PresenceLoadedState value)? loaded,
    TResult Function(PresenceErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class PresenceErrorState extends PresenceState {
  const factory PresenceErrorState() = _$PresenceErrorState;
  const PresenceErrorState._() : super._();
}
