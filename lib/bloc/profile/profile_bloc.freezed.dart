// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool useStream, String profileId) loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        updateProfile,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool useStream, String profileId)? loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool useStream, String profileId)? loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileLoadingErrorOccured value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileLoadingErrorOccured value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileLoadingErrorOccured value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileEventCopyWith<$Res> {
  factory $ProfileEventCopyWith(
          ProfileEvent value, $Res Function(ProfileEvent) then) =
      _$ProfileEventCopyWithImpl<$Res, ProfileEvent>;
}

/// @nodoc
class _$ProfileEventCopyWithImpl<$Res, $Val extends ProfileEvent>
    implements $ProfileEventCopyWith<$Res> {
  _$ProfileEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProfileInitialCopyWith<$Res> {
  factory _$$ProfileInitialCopyWith(
          _$ProfileInitial value, $Res Function(_$ProfileInitial) then) =
      __$$ProfileInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileInitialCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileInitial>
    implements _$$ProfileInitialCopyWith<$Res> {
  __$$ProfileInitialCopyWithImpl(
      _$ProfileInitial _value, $Res Function(_$ProfileInitial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileInitial implements ProfileInitial {
  const _$ProfileInitial();

  @override
  String toString() {
    return 'ProfileEvent.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool useStream, String profileId) loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        updateProfile,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool useStream, String profileId)? loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool useStream, String profileId)? loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
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
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileLoadingErrorOccured value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileLoadingErrorOccured value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileLoadingErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProfileInitial implements ProfileEvent {
  const factory ProfileInitial() = _$ProfileInitial;
}

/// @nodoc
abstract class _$$LoadProfileCopyWith<$Res> {
  factory _$$LoadProfileCopyWith(
          _$LoadProfile value, $Res Function(_$LoadProfile) then) =
      __$$LoadProfileCopyWithImpl<$Res>;
  @useResult
  $Res call({bool useStream, String profileId});
}

/// @nodoc
class __$$LoadProfileCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$LoadProfile>
    implements _$$LoadProfileCopyWith<$Res> {
  __$$LoadProfileCopyWithImpl(
      _$LoadProfile _value, $Res Function(_$LoadProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? useStream = null,
    Object? profileId = null,
  }) {
    return _then(_$LoadProfile(
      useStream: null == useStream
          ? _value.useStream
          : useStream // ignore: cast_nullable_to_non_nullable
              as bool,
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadProfile implements LoadProfile {
  const _$LoadProfile({this.useStream = false, required this.profileId});

  @override
  @JsonKey()
  final bool useStream;
  @override
  final String profileId;

  @override
  String toString() {
    return 'ProfileEvent.loadProfile(useStream: $useStream, profileId: $profileId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProfile &&
            (identical(other.useStream, useStream) ||
                other.useStream == useStream) &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, useStream, profileId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProfileCopyWith<_$LoadProfile> get copyWith =>
      __$$LoadProfileCopyWithImpl<_$LoadProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool useStream, String profileId) loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        updateProfile,
    required TResult Function() error,
  }) {
    return loadProfile(useStream, profileId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool useStream, String profileId)? loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult? Function()? error,
  }) {
    return loadProfile?.call(useStream, profileId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool useStream, String profileId)? loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile(useStream, profileId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileLoadingErrorOccured value) error,
  }) {
    return loadProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileLoadingErrorOccured value)? error,
  }) {
    return loadProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileLoadingErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile(this);
    }
    return orElse();
  }
}

abstract class LoadProfile implements ProfileEvent {
  const factory LoadProfile(
      {final bool useStream, required final String profileId}) = _$LoadProfile;

  bool get useStream;
  String get profileId;
  @JsonKey(ignore: true)
  _$$LoadProfileCopyWith<_$LoadProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveProfileUpdateCopyWith<$Res> {
  factory _$$ReceiveProfileUpdateCopyWith(_$ReceiveProfileUpdate value,
          $Res Function(_$ReceiveProfileUpdate) then) =
      __$$ReceiveProfileUpdateCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ReceiveProfileUpdateCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ReceiveProfileUpdate>
    implements _$$ReceiveProfileUpdateCopyWith<$Res> {
  __$$ReceiveProfileUpdateCopyWithImpl(_$ReceiveProfileUpdate _value,
      $Res Function(_$ReceiveProfileUpdate) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$ReceiveProfileUpdate(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$ReceiveProfileUpdate implements ReceiveProfileUpdate {
  const _$ReceiveProfileUpdate({required this.profile});

  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileEvent.receiveUpdate(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveProfileUpdate &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveProfileUpdateCopyWith<_$ReceiveProfileUpdate> get copyWith =>
      __$$ReceiveProfileUpdateCopyWithImpl<_$ReceiveProfileUpdate>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool useStream, String profileId) loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        updateProfile,
    required TResult Function() error,
  }) {
    return receiveUpdate(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool useStream, String profileId)? loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult? Function()? error,
  }) {
    return receiveUpdate?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool useStream, String profileId)? loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (receiveUpdate != null) {
      return receiveUpdate(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileLoadingErrorOccured value) error,
  }) {
    return receiveUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileLoadingErrorOccured value)? error,
  }) {
    return receiveUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileLoadingErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (receiveUpdate != null) {
      return receiveUpdate(this);
    }
    return orElse();
  }
}

abstract class ReceiveProfileUpdate implements ProfileEvent {
  const factory ReceiveProfileUpdate({required final Profile profile}) =
      _$ReceiveProfileUpdate;

  Profile get profile;
  @JsonKey(ignore: true)
  _$$ReceiveProfileUpdateCopyWith<_$ReceiveProfileUpdate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileCopyWith<$Res> {
  factory _$$UpdateProfileCopyWith(
          _$UpdateProfile value, $Res Function(_$UpdateProfile) then) =
      __$$UpdateProfileCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Profile profile,
      Map<String, dynamic> formData,
      bool completeProfile,
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$UpdateProfileCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateProfile>
    implements _$$UpdateProfileCopyWith<$Res> {
  __$$UpdateProfileCopyWithImpl(
      _$UpdateProfile _value, $Res Function(_$UpdateProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? formData = null,
    Object? completeProfile = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$UpdateProfile(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      formData: null == formData
          ? _value._formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      completeProfile: null == completeProfile
          ? _value.completeProfile
          : completeProfile // ignore: cast_nullable_to_non_nullable
              as bool,
      onComplete: freezed == onComplete
          ? _value.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(Profile)?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object?, StackTrace)?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$UpdateProfile implements UpdateProfile {
  const _$UpdateProfile(
      {required this.profile,
      required final Map<String, dynamic> formData,
      this.completeProfile = false,
      required this.onComplete,
      required this.onError})
      : _formData = formData;

  @override
  final Profile profile;
  final Map<String, dynamic> _formData;
  @override
  Map<String, dynamic> get formData {
    if (_formData is EqualUnmodifiableMapView) return _formData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formData);
  }

  @override
  @JsonKey()
  final bool completeProfile;
  @override
  final void Function(Profile)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;

  @override
  String toString() {
    return 'ProfileEvent.updateProfile(profile: $profile, formData: $formData, completeProfile: $completeProfile, onComplete: $onComplete, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfile &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other._formData, _formData) &&
            (identical(other.completeProfile, completeProfile) ||
                other.completeProfile == completeProfile) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      profile,
      const DeepCollectionEquality().hash(_formData),
      completeProfile,
      onComplete,
      onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileCopyWith<_$UpdateProfile> get copyWith =>
      __$$UpdateProfileCopyWithImpl<_$UpdateProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool useStream, String profileId) loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        updateProfile,
    required TResult Function() error,
  }) {
    return updateProfile(
        profile, formData, completeProfile, onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool useStream, String profileId)? loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult? Function()? error,
  }) {
    return updateProfile?.call(
        profile, formData, completeProfile, onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool useStream, String profileId)? loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(
          profile, formData, completeProfile, onComplete, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileLoadingErrorOccured value) error,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileLoadingErrorOccured value)? error,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileLoadingErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(this);
    }
    return orElse();
  }
}

abstract class UpdateProfile implements ProfileEvent {
  const factory UpdateProfile(
          {required final Profile profile,
          required final Map<String, dynamic> formData,
          final bool completeProfile,
          required final void Function(Profile)? onComplete,
          required final void Function(Object?, StackTrace)? onError}) =
      _$UpdateProfile;

  Profile get profile;
  Map<String, dynamic> get formData;
  bool get completeProfile;
  void Function(Profile)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  @JsonKey(ignore: true)
  _$$UpdateProfileCopyWith<_$UpdateProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileLoadingErrorOccuredCopyWith<$Res> {
  factory _$$ProfileLoadingErrorOccuredCopyWith(
          _$ProfileLoadingErrorOccured value,
          $Res Function(_$ProfileLoadingErrorOccured) then) =
      __$$ProfileLoadingErrorOccuredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileLoadingErrorOccuredCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileLoadingErrorOccured>
    implements _$$ProfileLoadingErrorOccuredCopyWith<$Res> {
  __$$ProfileLoadingErrorOccuredCopyWithImpl(
      _$ProfileLoadingErrorOccured _value,
      $Res Function(_$ProfileLoadingErrorOccured) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileLoadingErrorOccured implements ProfileLoadingErrorOccured {
  const _$ProfileLoadingErrorOccured();

  @override
  String toString() {
    return 'ProfileEvent.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadingErrorOccured);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(bool useStream, String profileId) loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        updateProfile,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(bool useStream, String profileId)? loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(bool useStream, String profileId)? loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            bool completeProfile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        updateProfile,
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
    required TResult Function(ProfileInitial value) initial,
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileLoadingErrorOccured value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileInitial value)? initial,
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileLoadingErrorOccured value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileInitial value)? initial,
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileLoadingErrorOccured value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProfileLoadingErrorOccured implements ProfileEvent {
  const factory ProfileLoadingErrorOccured() = _$ProfileLoadingErrorOccured;
}

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Profile profile) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Profile profile)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Profile profile)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) then) =
      _$ProfileStateCopyWithImpl<$Res, ProfileState>;
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res, $Val extends ProfileState>
    implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$ProfileLoadingStateCopyWith<$Res> {
  factory _$$ProfileLoadingStateCopyWith(_$ProfileLoadingState value,
          $Res Function(_$ProfileLoadingState) then) =
      __$$ProfileLoadingStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileLoadingStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileLoadingState>
    implements _$$ProfileLoadingStateCopyWith<$Res> {
  __$$ProfileLoadingStateCopyWithImpl(
      _$ProfileLoadingState _value, $Res Function(_$ProfileLoadingState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileLoadingState extends ProfileLoadingState {
  const _$ProfileLoadingState() : super._();

  @override
  String toString() {
    return 'ProfileState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Profile profile) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Profile profile)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Profile profile)? loaded,
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
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class ProfileLoadingState extends ProfileState {
  const factory ProfileLoadingState() = _$ProfileLoadingState;
  const ProfileLoadingState._() : super._();
}

/// @nodoc
abstract class _$$ProfileLoadedStateCopyWith<$Res> {
  factory _$$ProfileLoadedStateCopyWith(_$ProfileLoadedState value,
          $Res Function(_$ProfileLoadedState) then) =
      __$$ProfileLoadedStateCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ProfileLoadedStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileLoadedState>
    implements _$$ProfileLoadedStateCopyWith<$Res> {
  __$$ProfileLoadedStateCopyWithImpl(
      _$ProfileLoadedState _value, $Res Function(_$ProfileLoadedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$ProfileLoadedState(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$ProfileLoadedState extends ProfileLoadedState {
  const _$ProfileLoadedState({required this.profile}) : super._();

  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileState.loaded(profile: $profile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadedState &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLoadedStateCopyWith<_$ProfileLoadedState> get copyWith =>
      __$$ProfileLoadedStateCopyWithImpl<_$ProfileLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Profile profile) loaded,
    required TResult Function() error,
  }) {
    return loaded(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Profile profile)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Profile profile)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(profile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileErrorState value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class ProfileLoadedState extends ProfileState {
  const factory ProfileLoadedState({required final Profile profile}) =
      _$ProfileLoadedState;
  const ProfileLoadedState._() : super._();

  Profile get profile;
  @JsonKey(ignore: true)
  _$$ProfileLoadedStateCopyWith<_$ProfileLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileErrorStateCopyWith<$Res> {
  factory _$$ProfileErrorStateCopyWith(
          _$ProfileErrorState value, $Res Function(_$ProfileErrorState) then) =
      __$$ProfileErrorStateCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileErrorStateCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileErrorState>
    implements _$$ProfileErrorStateCopyWith<$Res> {
  __$$ProfileErrorStateCopyWithImpl(
      _$ProfileErrorState _value, $Res Function(_$ProfileErrorState) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileErrorState extends ProfileErrorState {
  const _$ProfileErrorState() : super._();

  @override
  String toString() {
    return 'ProfileState.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Profile profile) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(Profile profile)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Profile profile)? loaded,
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
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileLoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileLoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProfileErrorState extends ProfileState {
  const factory ProfileErrorState() = _$ProfileErrorState;
  const ProfileErrorState._() : super._();
}
