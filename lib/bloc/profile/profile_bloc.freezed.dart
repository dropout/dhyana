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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProfileEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        loadProfile,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function() clearData,
    required TResult Function() validateProfileStats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function()? clearData,
    TResult? Function()? validateProfileStats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function()? clearData,
    TResult Function()? validateProfileStats,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(ClearProfileData value) clearData,
    required TResult Function(ValidateProfileStats value) validateProfileStats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ClearProfileData value)? clearData,
    TResult? Function(ValidateProfileStats value)? validateProfileStats,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ClearProfileData value)? clearData,
    TResult Function(ValidateProfileStats value)? validateProfileStats,
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

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadProfileImplCopyWith<$Res> {
  factory _$$LoadProfileImplCopyWith(
          _$LoadProfileImpl value, $Res Function(_$LoadProfileImpl) then) =
      __$$LoadProfileImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String profileId,
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError});
}

/// @nodoc
class __$$LoadProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$LoadProfileImpl>
    implements _$$LoadProfileImplCopyWith<$Res> {
  __$$LoadProfileImplCopyWithImpl(
      _$LoadProfileImpl _value, $Res Function(_$LoadProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$LoadProfileImpl(
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
    ));
  }
}

/// @nodoc

class _$LoadProfileImpl implements LoadProfile {
  const _$LoadProfileImpl(
      {required this.profileId, this.onComplete, this.onError});

  @override
  final String profileId;
  @override
  final void Function(Profile)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;

  @override
  String toString() {
    return 'ProfileEvent.loadProfile(profileId: $profileId, onComplete: $onComplete, onError: $onError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProfileImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profileId, onComplete, onError);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadProfileImplCopyWith<_$LoadProfileImpl> get copyWith =>
      __$$LoadProfileImplCopyWithImpl<_$LoadProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        loadProfile,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function() clearData,
    required TResult Function() validateProfileStats,
  }) {
    return loadProfile(profileId, onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function()? clearData,
    TResult? Function()? validateProfileStats,
  }) {
    return loadProfile?.call(profileId, onComplete, onError);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function()? clearData,
    TResult Function()? validateProfileStats,
    required TResult orElse(),
  }) {
    if (loadProfile != null) {
      return loadProfile(profileId, onComplete, onError);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(ClearProfileData value) clearData,
    required TResult Function(ValidateProfileStats value) validateProfileStats,
  }) {
    return loadProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ClearProfileData value)? clearData,
    TResult? Function(ValidateProfileStats value)? validateProfileStats,
  }) {
    return loadProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ClearProfileData value)? clearData,
    TResult Function(ValidateProfileStats value)? validateProfileStats,
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
      final void Function(Object?, StackTrace)? onError}) = _$LoadProfileImpl;

  String get profileId;
  void Function(Profile)? get onComplete;
  void Function(Object?, StackTrace)? get onError;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadProfileImplCopyWith<_$LoadProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateProfileImplCopyWith<$Res> {
  factory _$$UpdateProfileImplCopyWith(
          _$UpdateProfileImpl value, $Res Function(_$UpdateProfileImpl) then) =
      __$$UpdateProfileImplCopyWithImpl<$Res>;
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
class __$$UpdateProfileImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$UpdateProfileImpl>
    implements _$$UpdateProfileImplCopyWith<$Res> {
  __$$UpdateProfileImplCopyWithImpl(
      _$UpdateProfileImpl _value, $Res Function(_$UpdateProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? formData = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
    Object? completeProfile = null,
  }) {
    return _then(_$UpdateProfileImpl(
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

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$UpdateProfileImpl implements UpdateProfile {
  const _$UpdateProfileImpl(
      {required this.profile,
      required final Map<String, dynamic> formData,
      this.onComplete,
      this.onError,
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateProfileImpl &&
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

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateProfileImplCopyWith<_$UpdateProfileImpl> get copyWith =>
      __$$UpdateProfileImplCopyWithImpl<_$UpdateProfileImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        loadProfile,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function() clearData,
    required TResult Function() validateProfileStats,
  }) {
    return updateProfile(
        profile, formData, onComplete, onError, completeProfile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function()? clearData,
    TResult? Function()? validateProfileStats,
  }) {
    return updateProfile?.call(
        profile, formData, onComplete, onError, completeProfile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function()? clearData,
    TResult Function()? validateProfileStats,
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
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(ClearProfileData value) clearData,
    required TResult Function(ValidateProfileStats value) validateProfileStats,
  }) {
    return updateProfile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ClearProfileData value)? clearData,
    TResult? Function(ValidateProfileStats value)? validateProfileStats,
  }) {
    return updateProfile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ClearProfileData value)? clearData,
    TResult Function(ValidateProfileStats value)? validateProfileStats,
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
      final void Function(Profile)? onComplete,
      final void Function(Object?, StackTrace)? onError,
      final bool completeProfile}) = _$UpdateProfileImpl;

  Profile get profile;
  Map<String, dynamic> get formData;
  void Function(Profile)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  bool get completeProfile;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateProfileImplCopyWith<_$UpdateProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileErrorOccuredImplCopyWith<$Res> {
  factory _$$ProfileErrorOccuredImplCopyWith(_$ProfileErrorOccuredImpl value,
          $Res Function(_$ProfileErrorOccuredImpl) then) =
      __$$ProfileErrorOccuredImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileErrorOccuredImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ProfileErrorOccuredImpl>
    implements _$$ProfileErrorOccuredImplCopyWith<$Res> {
  __$$ProfileErrorOccuredImplCopyWithImpl(_$ProfileErrorOccuredImpl _value,
      $Res Function(_$ProfileErrorOccuredImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileErrorOccuredImpl implements ProfileErrorOccured {
  const _$ProfileErrorOccuredImpl();

  @override
  String toString() {
    return 'ProfileEvent.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileErrorOccuredImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        loadProfile,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function() clearData,
    required TResult Function() validateProfileStats,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function()? clearData,
    TResult? Function()? validateProfileStats,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function()? clearData,
    TResult Function()? validateProfileStats,
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
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(ClearProfileData value) clearData,
    required TResult Function(ValidateProfileStats value) validateProfileStats,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ClearProfileData value)? clearData,
    TResult? Function(ValidateProfileStats value)? validateProfileStats,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ClearProfileData value)? clearData,
    TResult Function(ValidateProfileStats value)? validateProfileStats,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class ProfileErrorOccured implements ProfileEvent {
  const factory ProfileErrorOccured() = _$ProfileErrorOccuredImpl;
}

/// @nodoc
abstract class _$$ClearProfileDataImplCopyWith<$Res> {
  factory _$$ClearProfileDataImplCopyWith(_$ClearProfileDataImpl value,
          $Res Function(_$ClearProfileDataImpl) then) =
      __$$ClearProfileDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearProfileDataImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ClearProfileDataImpl>
    implements _$$ClearProfileDataImplCopyWith<$Res> {
  __$$ClearProfileDataImplCopyWithImpl(_$ClearProfileDataImpl _value,
      $Res Function(_$ClearProfileDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ClearProfileDataImpl implements ClearProfileData {
  const _$ClearProfileDataImpl();

  @override
  String toString() {
    return 'ProfileEvent.clearData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearProfileDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        loadProfile,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function() clearData,
    required TResult Function() validateProfileStats,
  }) {
    return clearData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function()? clearData,
    TResult? Function()? validateProfileStats,
  }) {
    return clearData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function()? clearData,
    TResult Function()? validateProfileStats,
    required TResult orElse(),
  }) {
    if (clearData != null) {
      return clearData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(ClearProfileData value) clearData,
    required TResult Function(ValidateProfileStats value) validateProfileStats,
  }) {
    return clearData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ClearProfileData value)? clearData,
    TResult? Function(ValidateProfileStats value)? validateProfileStats,
  }) {
    return clearData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ClearProfileData value)? clearData,
    TResult Function(ValidateProfileStats value)? validateProfileStats,
    required TResult orElse(),
  }) {
    if (clearData != null) {
      return clearData(this);
    }
    return orElse();
  }
}

abstract class ClearProfileData implements ProfileEvent {
  const factory ClearProfileData() = _$ClearProfileDataImpl;
}

/// @nodoc
abstract class _$$ValidateProfileStatsImplCopyWith<$Res> {
  factory _$$ValidateProfileStatsImplCopyWith(_$ValidateProfileStatsImpl value,
          $Res Function(_$ValidateProfileStatsImpl) then) =
      __$$ValidateProfileStatsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ValidateProfileStatsImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ValidateProfileStatsImpl>
    implements _$$ValidateProfileStatsImplCopyWith<$Res> {
  __$$ValidateProfileStatsImplCopyWithImpl(_$ValidateProfileStatsImpl _value,
      $Res Function(_$ValidateProfileStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ValidateProfileStatsImpl implements ValidateProfileStats {
  const _$ValidateProfileStatsImpl();

  @override
  String toString() {
    return 'ProfileEvent.validateProfileStats()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateProfileStatsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String profileId,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        loadProfile,
    required TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)
        updateProfile,
    required TResult Function() error,
    required TResult Function() clearData,
    required TResult Function() validateProfileStats,
  }) {
    return validateProfileStats();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult? Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult? Function()? error,
    TResult? Function()? clearData,
    TResult? Function()? validateProfileStats,
  }) {
    return validateProfileStats?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String profileId, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        loadProfile,
    TResult Function(
            Profile profile,
            Map<String, dynamic> formData,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError,
            bool completeProfile)?
        updateProfile,
    TResult Function()? error,
    TResult Function()? clearData,
    TResult Function()? validateProfileStats,
    required TResult orElse(),
  }) {
    if (validateProfileStats != null) {
      return validateProfileStats();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(ClearProfileData value) clearData,
    required TResult Function(ValidateProfileStats value) validateProfileStats,
  }) {
    return validateProfileStats(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ClearProfileData value)? clearData,
    TResult? Function(ValidateProfileStats value)? validateProfileStats,
  }) {
    return validateProfileStats?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ClearProfileData value)? clearData,
    TResult Function(ValidateProfileStats value)? validateProfileStats,
    required TResult orElse(),
  }) {
    if (validateProfileStats != null) {
      return validateProfileStats(this);
    }
    return orElse();
  }
}

abstract class ValidateProfileStats implements ProfileEvent {
  const factory ValidateProfileStats() = _$ValidateProfileStatsImpl;
}

/// @nodoc
mixin _$ProfileState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Profile profile) loaded,
    required TResult Function() error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Profile profile)? loaded,
    TResult? Function()? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Profile profile)? loaded,
    TResult Function()? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ProfileStateInitial value) initial,
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateInitial value)? initial,
    TResult? Function(ProfileLoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateInitial value)? initial,
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

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ProfileStateInitialImplCopyWith<$Res> {
  factory _$$ProfileStateInitialImplCopyWith(_$ProfileStateInitialImpl value,
          $Res Function(_$ProfileStateInitialImpl) then) =
      __$$ProfileStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileStateInitialImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileStateInitialImpl>
    implements _$$ProfileStateInitialImplCopyWith<$Res> {
  __$$ProfileStateInitialImplCopyWithImpl(_$ProfileStateInitialImpl _value,
      $Res Function(_$ProfileStateInitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileStateInitialImpl extends ProfileStateInitial {
  const _$ProfileStateInitialImpl() : super._();

  @override
  String toString() {
    return 'ProfileState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Profile profile) loaded,
    required TResult Function() error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Profile profile)? loaded,
    TResult? Function()? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(Profile profile)? loaded,
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
    required TResult Function(ProfileStateInitial value) initial,
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateInitial value)? initial,
    TResult? Function(ProfileLoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateInitial value)? initial,
    TResult Function(ProfileLoadingState value)? loading,
    TResult Function(ProfileLoadedState value)? loaded,
    TResult Function(ProfileErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class ProfileStateInitial extends ProfileState {
  const factory ProfileStateInitial() = _$ProfileStateInitialImpl;
  const ProfileStateInitial._() : super._();
}

/// @nodoc
abstract class _$$ProfileLoadingStateImplCopyWith<$Res> {
  factory _$$ProfileLoadingStateImplCopyWith(_$ProfileLoadingStateImpl value,
          $Res Function(_$ProfileLoadingStateImpl) then) =
      __$$ProfileLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileLoadingStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileLoadingStateImpl>
    implements _$$ProfileLoadingStateImplCopyWith<$Res> {
  __$$ProfileLoadingStateImplCopyWithImpl(_$ProfileLoadingStateImpl _value,
      $Res Function(_$ProfileLoadingStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileLoadingStateImpl extends ProfileLoadingState {
  const _$ProfileLoadingStateImpl() : super._();

  @override
  String toString() {
    return 'ProfileState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Profile profile) loaded,
    required TResult Function() error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Profile profile)? loaded,
    TResult? Function()? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
    required TResult Function(ProfileStateInitial value) initial,
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateInitial value)? initial,
    TResult? Function(ProfileLoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileErrorState value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateInitial value)? initial,
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
  const factory ProfileLoadingState() = _$ProfileLoadingStateImpl;
  const ProfileLoadingState._() : super._();
}

/// @nodoc
abstract class _$$ProfileLoadedStateImplCopyWith<$Res> {
  factory _$$ProfileLoadedStateImplCopyWith(_$ProfileLoadedStateImpl value,
          $Res Function(_$ProfileLoadedStateImpl) then) =
      __$$ProfileLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ProfileLoadedStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileLoadedStateImpl>
    implements _$$ProfileLoadedStateImplCopyWith<$Res> {
  __$$ProfileLoadedStateImplCopyWithImpl(_$ProfileLoadedStateImpl _value,
      $Res Function(_$ProfileLoadedStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$ProfileLoadedStateImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
    ));
  }

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get profile {
    return $ProfileCopyWith<$Res>(_value.profile, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc

class _$ProfileLoadedStateImpl extends ProfileLoadedState {
  const _$ProfileLoadedStateImpl({required this.profile}) : super._();

  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileState.loaded(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileLoadedStateImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileLoadedStateImplCopyWith<_$ProfileLoadedStateImpl> get copyWith =>
      __$$ProfileLoadedStateImplCopyWithImpl<_$ProfileLoadedStateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Profile profile) loaded,
    required TResult Function() error,
  }) {
    return loaded(profile);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Profile profile)? loaded,
    TResult? Function()? error,
  }) {
    return loaded?.call(profile);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
    required TResult Function(ProfileStateInitial value) initial,
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateInitial value)? initial,
    TResult? Function(ProfileLoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileErrorState value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateInitial value)? initial,
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
      _$ProfileLoadedStateImpl;
  const ProfileLoadedState._() : super._();

  Profile get profile;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileLoadedStateImplCopyWith<_$ProfileLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProfileErrorStateImplCopyWith<$Res> {
  factory _$$ProfileErrorStateImplCopyWith(_$ProfileErrorStateImpl value,
          $Res Function(_$ProfileErrorStateImpl) then) =
      __$$ProfileErrorStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileErrorStateImplCopyWithImpl<$Res>
    extends _$ProfileStateCopyWithImpl<$Res, _$ProfileErrorStateImpl>
    implements _$$ProfileErrorStateImplCopyWith<$Res> {
  __$$ProfileErrorStateImplCopyWithImpl(_$ProfileErrorStateImpl _value,
      $Res Function(_$ProfileErrorStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ProfileErrorStateImpl extends ProfileErrorState {
  const _$ProfileErrorStateImpl() : super._();

  @override
  String toString() {
    return 'ProfileState.error()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ProfileErrorStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(Profile profile) loaded,
    required TResult Function() error,
  }) {
    return error();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(Profile profile)? loaded,
    TResult? Function()? error,
  }) {
    return error?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
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
    required TResult Function(ProfileStateInitial value) initial,
    required TResult Function(ProfileLoadingState value) loading,
    required TResult Function(ProfileLoadedState value) loaded,
    required TResult Function(ProfileErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ProfileStateInitial value)? initial,
    TResult? Function(ProfileLoadingState value)? loading,
    TResult? Function(ProfileLoadedState value)? loaded,
    TResult? Function(ProfileErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ProfileStateInitial value)? initial,
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
  const factory ProfileErrorState() = _$ProfileErrorStateImpl;
  const ProfileErrorState._() : super._();
}
