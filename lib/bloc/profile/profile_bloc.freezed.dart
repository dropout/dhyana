// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent()';
  }
}

/// @nodoc
class $ProfileEventCopyWith<$Res> {
  $ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}

/// @nodoc

class LoadProfile implements ProfileEvent {
  const LoadProfile(
      {required this.profileId, this.profile, this.onComplete, this.onError});

  final String profileId;

  /// Optional. If given does not trigger loading from repository.
  final Profile? profile;
  final void Function(Profile)? onComplete;
  final void Function(Object?, StackTrace)? onError;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadProfileCopyWith<LoadProfile> get copyWith =>
      _$LoadProfileCopyWithImpl<LoadProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadProfile &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, profileId, profile, onComplete, onError);

  @override
  String toString() {
    return 'ProfileEvent.loadProfile(profileId: $profileId, profile: $profile, onComplete: $onComplete, onError: $onError)';
  }
}

/// @nodoc
abstract mixin class $LoadProfileCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory $LoadProfileCopyWith(
          LoadProfile value, $Res Function(LoadProfile) _then) =
      _$LoadProfileCopyWithImpl;
  @useResult
  $Res call(
      {String profileId,
      Profile? profile,
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError});

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$LoadProfileCopyWithImpl<$Res> implements $LoadProfileCopyWith<$Res> {
  _$LoadProfileCopyWithImpl(this._self, this._then);

  final LoadProfile _self;
  final $Res Function(LoadProfile) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profileId = null,
    Object? profile = freezed,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(LoadProfile(
      profileId: null == profileId
          ? _self.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      onComplete: freezed == onComplete
          ? _self.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(Profile)?,
      onError: freezed == onError
          ? _self.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object?, StackTrace)?,
    ));
  }

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc

class UpdateProfile implements ProfileEvent {
  const UpdateProfile(
      {required this.profile,
      required final Map<String, dynamic> formData,
      this.onComplete,
      this.onError,
      this.completeProfile = false})
      : _formData = formData;

  final Profile profile;
  final Map<String, dynamic> _formData;
  Map<String, dynamic> get formData {
    if (_formData is EqualUnmodifiableMapView) return _formData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_formData);
  }

  final void Function(Profile profile)? onComplete;
  final void Function(Object? error, StackTrace stack)? onError;
  @JsonKey()
  final bool completeProfile;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UpdateProfileCopyWith<UpdateProfile> get copyWith =>
      _$UpdateProfileCopyWithImpl<UpdateProfile>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UpdateProfile &&
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

  @override
  String toString() {
    return 'ProfileEvent.updateProfile(profile: $profile, formData: $formData, onComplete: $onComplete, onError: $onError, completeProfile: $completeProfile)';
  }
}

/// @nodoc
abstract mixin class $UpdateProfileCopyWith<$Res>
    implements $ProfileEventCopyWith<$Res> {
  factory $UpdateProfileCopyWith(
          UpdateProfile value, $Res Function(UpdateProfile) _then) =
      _$UpdateProfileCopyWithImpl;
  @useResult
  $Res call(
      {Profile profile,
      Map<String, dynamic> formData,
      void Function(Profile profile)? onComplete,
      void Function(Object? error, StackTrace stack)? onError,
      bool completeProfile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$UpdateProfileCopyWithImpl<$Res>
    implements $UpdateProfileCopyWith<$Res> {
  _$UpdateProfileCopyWithImpl(this._self, this._then);

  final UpdateProfile _self;
  final $Res Function(UpdateProfile) _then;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profile = null,
    Object? formData = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
    Object? completeProfile = null,
  }) {
    return _then(UpdateProfile(
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
      formData: null == formData
          ? _self._formData
          : formData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>,
      onComplete: freezed == onComplete
          ? _self.onComplete
          : onComplete // ignore: cast_nullable_to_non_nullable
              as void Function(Profile profile)?,
      onError: freezed == onError
          ? _self.onError
          : onError // ignore: cast_nullable_to_non_nullable
              as void Function(Object? error, StackTrace stack)?,
      completeProfile: null == completeProfile
          ? _self.completeProfile
          : completeProfile // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc

class ProfileErrorOccured implements ProfileEvent {
  const ProfileErrorOccured();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileErrorOccured);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.error()';
  }
}

/// @nodoc

class ClearProfileData implements ProfileEvent {
  const ClearProfileData();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ClearProfileData);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.clearData()';
  }
}

/// @nodoc

class ValidateProfileStats implements ProfileEvent {
  const ValidateProfileStats();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ValidateProfileStats);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.validateProfileStats()';
  }
}

/// @nodoc
mixin _$ProfileState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState()';
  }
}

/// @nodoc
class $ProfileStateCopyWith<$Res> {
  $ProfileStateCopyWith(ProfileState _, $Res Function(ProfileState) __);
}

/// @nodoc

class ProfileStateInitial extends ProfileState {
  const ProfileStateInitial() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.initial()';
  }
}

/// @nodoc

class ProfileLoadingState extends ProfileState {
  const ProfileLoadingState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileLoadingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.loading()';
  }
}

/// @nodoc

class ProfileLoadedState extends ProfileState {
  const ProfileLoadedState({required this.profile}) : super._();

  final Profile profile;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileLoadedStateCopyWith<ProfileLoadedState> get copyWith =>
      _$ProfileLoadedStateCopyWithImpl<ProfileLoadedState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileLoadedState &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  @override
  String toString() {
    return 'ProfileState.loaded(profile: $profile)';
  }
}

/// @nodoc
abstract mixin class $ProfileLoadedStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory $ProfileLoadedStateCopyWith(
          ProfileLoadedState value, $Res Function(ProfileLoadedState) _then) =
      _$ProfileLoadedStateCopyWithImpl;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class _$ProfileLoadedStateCopyWithImpl<$Res>
    implements $ProfileLoadedStateCopyWith<$Res> {
  _$ProfileLoadedStateCopyWithImpl(this._self, this._then);

  final ProfileLoadedState _self;
  final $Res Function(ProfileLoadedState) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? profile = null,
  }) {
    return _then(ProfileLoadedState(
      profile: null == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_self.profile, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }
}

/// @nodoc

class ProfileErrorState extends ProfileState {
  const ProfileErrorState() : super._();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileErrorState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileState.error()';
  }
}

// dart format on
