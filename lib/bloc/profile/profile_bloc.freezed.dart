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
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool useStream)
        loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
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
abstract class _$$LoadProfileCopyWith<$Res> {
  factory _$$LoadProfileCopyWith(
          _$LoadProfile value, $Res Function(_$LoadProfile) then) =
      __$$LoadProfileCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String profileId,
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError,
      bool useStream});
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
    Object? profileId = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
    Object? useStream = null,
  }) {
    return _then(_$LoadProfile(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      onComplete: freezed == onComplete
          ? _value.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(Profile)?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object?, StackTrace)?,
      useStream: null == useStream
          ? _value.useStream
          : useStream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadProfile implements LoadProfile {
  const _$LoadProfile(
      {required this.profileId,
      this.onComplete,
      this.onError,
      this.useStream = false});

  @override
  final String profileId;
  @override
  final void Function(Profile)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;
  @override
  @JsonKey()
  final bool useStream;

  @override
  String toString() {
    return 'ProfileEvent.loadProfile(profileId: $profileId, onComplete: $onComplete, onError: $onError, useStream: $useStream)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProfile &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError) &&
            (identical(other.useStream, useStream) ||
                other.useStream == useStream));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profileId, onComplete, onError, useStream);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProfileCopyWith<_$LoadProfile> get copyWith =>
      __$$LoadProfileCopyWithImpl<_$LoadProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool useStream)
        loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
  }) {
    return loadProfile(profileId, onComplete, onError, useStream);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
  }) {
    return loadProfile?.call(profileId, onComplete, onError, useStream);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile(profileId, onComplete, onError, useStream);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
  }) {
    return loadProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
  }) {
    return loadProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
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
      {required final String profileId,
      final void Function(Profile)? onComplete,
      final void Function(Object?, StackTrace)? onError,
      final bool useStream}) = _$LoadProfile;

  String get profileId;
  void Function(Profile)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  bool get useStream;
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
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool useStream)
        loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
  }) {
    return receiveUpdate(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
  }) {
    return receiveUpdate?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
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
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
  }) {
    return receiveUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
  }) {
    return receiveUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
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
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError,
      bool completeProfile});

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
    Object? onComplete = freezed,
    Object? onError = freezed,
    Object? completeProfile = null,
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
      onComplete: freezed == onComplete
          ? _value.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(Profile)?,
      onError: freezed == onError
          ? _value.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object?, StackTrace)?,
      completeProfile: null == completeProfile
          ? _value.completeProfile
          : completeProfile // ignore: cast_nullable_to_non_nullable
              as bool,
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
      required this.onComplete,
      required this.onError,
      this.completeProfile = false})
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
  final void Function(Profile)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;
  @override
  @JsonKey()
  final bool completeProfile;

  @override
  String toString() {
    return 'ProfileEvent.updateProfile(profile: $profile, formData: $formData, onComplete: $onComplete, onError: $onError, completeProfile: $completeProfile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfile &&
            (identical(other.profile, profile) || other.profile == profile) &&
            const DeepCollectionEquality().equals(other._formData, _formData) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError) &&
            (identical(other.completeProfile, completeProfile) ||
                other.completeProfile == completeProfile));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      profile,
      const DeepCollectionEquality().hash(_formData),
      onComplete,
      onError,
      completeProfile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileCopyWith<_$UpdateProfile> get copyWith =>
      __$$UpdateProfileCopyWithImpl<_$UpdateProfile>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool useStream)
        loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
  }) {
    return updateProfile(
        profile, formData, onComplete, onError, completeProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
  }) {
    return updateProfile?.call(
        profile, formData, onComplete, onError, completeProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    required TResult orElse(),
  }) {
    if (updateProfile != null) {
      return updateProfile(
          profile, formData, onComplete, onError, completeProfile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
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
      required final void Function(Profile)? onComplete,
      required final void Function(Object?, StackTrace)? onError,
      final bool completeProfile}) = _$UpdateProfile;

  Profile get profile;
  Map<String, dynamic> get formData;
  void Function(Profile)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  bool get completeProfile;
  @JsonKey(ignore: true)
  _$$UpdateProfileCopyWith<_$UpdateProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileErrorOccuredCopyWith<$Res> {
  factory _$$ProfileErrorOccuredCopyWith(_$ProfileErrorOccured value,
          $Res Function(_$ProfileErrorOccured) then) =
      __$$ProfileErrorOccuredCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileErrorOccuredCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileErrorOccured>
    implements _$$ProfileErrorOccuredCopyWith<$Res> {
  __$$ProfileErrorOccuredCopyWithImpl(
      _$ProfileErrorOccured _value, $Res Function(_$ProfileErrorOccured) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ProfileErrorOccured implements ProfileErrorOccured {
  const _$ProfileErrorOccured();

  @override
  String toString() {
    return 'ProfileEvent.error()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileErrorOccured);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool useStream)
        loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
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
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProfileErrorOccured implements ProfileEvent {
  const factory ProfileErrorOccured() = _$ProfileErrorOccured;
}

/// @nodoc
abstract class _$$CalculateConsecutiveDaysCopyWith<$Res> {
  factory _$$CalculateConsecutiveDaysCopyWith(_$CalculateConsecutiveDays value,
          $Res Function(_$CalculateConsecutiveDays) then) =
      __$$CalculateConsecutiveDaysCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Profile profile,
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$CalculateConsecutiveDaysCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$CalculateConsecutiveDays>
    implements _$$CalculateConsecutiveDaysCopyWith<$Res> {
  __$$CalculateConsecutiveDaysCopyWithImpl(_$CalculateConsecutiveDays _value,
      $Res Function(_$CalculateConsecutiveDays) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$CalculateConsecutiveDays(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
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

class _$CalculateConsecutiveDays implements CalculateConsecutiveDays {
  const _$CalculateConsecutiveDays(
      {required this.profile, this.onComplete, this.onError});

  @override
  final Profile profile;
  @override
  final void Function(Profile)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;

  @override
  String toString() {
    return 'ProfileEvent.calculateConsecutiveDays(profile: $profile, onComplete: $onComplete, onError: $onError)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculateConsecutiveDays &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, onComplete, onError);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculateConsecutiveDaysCopyWith<_$CalculateConsecutiveDays>
      get copyWith =>
          __$$CalculateConsecutiveDaysCopyWithImpl<_$CalculateConsecutiveDays>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool useStream)
        loadProfile,
    required TResult Function(Profile profile) receiveUpdate,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
  }) {
    return calculateConsecutiveDays(profile, onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult? Function(Profile profile)? receiveUpdate,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
  }) {
    return calculateConsecutiveDays?.call(profile, onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError, bool useStream)?
        loadProfile,
    TResult Function(Profile profile)? receiveUpdate,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    required TResult orElse(),
  }) {
    if (calculateConsecutiveDays != null) {
      return calculateConsecutiveDays(profile, onComplete, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
  }) {
    return calculateConsecutiveDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
  }) {
    return calculateConsecutiveDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    required TResult orElse(),
  }) {
    if (calculateConsecutiveDays != null) {
      return calculateConsecutiveDays(this);
    }
    return orElse();
  }
}

abstract class CalculateConsecutiveDays implements ProfileEvent {
  const factory CalculateConsecutiveDays(
          {required final Profile profile,
          final void Function(Profile)? onComplete,
          final void Function(Object?, StackTrace)? onError}) =
      _$CalculateConsecutiveDays;

  Profile get profile;
  void Function(Profile)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  @JsonKey(ignore: true)
  _$$CalculateConsecutiveDaysCopyWith<_$CalculateConsecutiveDays>
      get copyWith => throw _privateConstructorUsedError;
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
