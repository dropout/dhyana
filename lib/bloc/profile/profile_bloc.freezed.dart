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
        validateConsecutiveDays,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
    required TResult Function() reset,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, Duration duration, TimerSettings timerSettings)
        logSession,
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
        validateConsecutiveDays,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult? Function()? reset,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
        validateConsecutiveDays,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult Function()? reset,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LoadProfile value) loadProfile,
    required TResult Function(ReceiveProfileUpdate value) receiveUpdate,
    required TResult Function(UpdateProfile value) updateProfile,
    required TResult Function(ProfileErrorOccured value) error,
    required TResult Function(ValidateConsecutiveDays value)
        validateConsecutiveDays,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
    required TResult Function(ResetProfileContent value) reset,
    required TResult Function(LogSession value) logSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult? Function(ResetProfileContent value)? reset,
    TResult? Function(LogSession value)? logSession,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult Function(ResetProfileContent value)? reset,
    TResult Function(LogSession value)? logSession,
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
      void Function(Object?, StackTrace)? onError,
      bool useStream});
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
    Object? useStream = null,
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
      useStream: null == useStream
          ? _value.useStream
          : useStream // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$LoadProfileImpl implements LoadProfile {
  const _$LoadProfileImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadProfileImpl &&
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
        validateConsecutiveDays,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
    required TResult Function() reset,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, Duration duration, TimerSettings timerSettings)
        logSession,
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
        validateConsecutiveDays,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult? Function()? reset,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
        validateConsecutiveDays,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult Function()? reset,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
    required TResult Function(ValidateConsecutiveDays value)
        validateConsecutiveDays,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
    required TResult Function(ResetProfileContent value) reset,
    required TResult Function(LogSession value) logSession,
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
    TResult? Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult? Function(ResetProfileContent value)? reset,
    TResult? Function(LogSession value)? logSession,
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
    TResult Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult Function(ResetProfileContent value)? reset,
    TResult Function(LogSession value)? logSession,
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
      final bool useStream}) = _$LoadProfileImpl;

  String get profileId;
  void Function(Profile)? get onComplete;
  void Function(Object?, StackTrace)? get onError;
  bool get useStream;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadProfileImplCopyWith<_$LoadProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReceiveProfileUpdateImplCopyWith<$Res> {
  factory _$$ReceiveProfileUpdateImplCopyWith(_$ReceiveProfileUpdateImpl value,
          $Res Function(_$ReceiveProfileUpdateImpl) then) =
      __$$ReceiveProfileUpdateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Profile profile});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ReceiveProfileUpdateImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ReceiveProfileUpdateImpl>
    implements _$$ReceiveProfileUpdateImplCopyWith<$Res> {
  __$$ReceiveProfileUpdateImplCopyWithImpl(_$ReceiveProfileUpdateImpl _value,
      $Res Function(_$ReceiveProfileUpdateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
  }) {
    return _then(_$ReceiveProfileUpdateImpl(
      profile: null == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile,
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

class _$ReceiveProfileUpdateImpl implements ReceiveProfileUpdate {
  const _$ReceiveProfileUpdateImpl({required this.profile});

  @override
  final Profile profile;

  @override
  String toString() {
    return 'ProfileEvent.receiveUpdate(profile: $profile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiveProfileUpdateImpl &&
            (identical(other.profile, profile) || other.profile == profile));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiveProfileUpdateImplCopyWith<_$ReceiveProfileUpdateImpl>
      get copyWith =>
          __$$ReceiveProfileUpdateImplCopyWithImpl<_$ReceiveProfileUpdateImpl>(
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
        validateConsecutiveDays,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
    required TResult Function() reset,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, Duration duration, TimerSettings timerSettings)
        logSession,
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
        validateConsecutiveDays,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult? Function()? reset,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
        validateConsecutiveDays,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult Function()? reset,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
    required TResult Function(ValidateConsecutiveDays value)
        validateConsecutiveDays,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
    required TResult Function(ResetProfileContent value) reset,
    required TResult Function(LogSession value) logSession,
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
    TResult? Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult? Function(ResetProfileContent value)? reset,
    TResult? Function(LogSession value)? logSession,
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
    TResult Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult Function(ResetProfileContent value)? reset,
    TResult Function(LogSession value)? logSession,
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
      _$ReceiveProfileUpdateImpl;

  Profile get profile;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiveProfileUpdateImplCopyWith<_$ReceiveProfileUpdateImpl>
      get copyWith => throw _privateConstructorUsedError;
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
        validateConsecutiveDays,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
    required TResult Function() reset,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, Duration duration, TimerSettings timerSettings)
        logSession,
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
        validateConsecutiveDays,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult? Function()? reset,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
        validateConsecutiveDays,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult Function()? reset,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
    required TResult Function(ValidateConsecutiveDays value)
        validateConsecutiveDays,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
    required TResult Function(ResetProfileContent value) reset,
    required TResult Function(LogSession value) logSession,
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
    TResult? Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult? Function(ResetProfileContent value)? reset,
    TResult? Function(LogSession value)? logSession,
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
    TResult Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult Function(ResetProfileContent value)? reset,
    TResult Function(LogSession value)? logSession,
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
        validateConsecutiveDays,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
    required TResult Function() reset,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, Duration duration, TimerSettings timerSettings)
        logSession,
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
        validateConsecutiveDays,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult? Function()? reset,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
        validateConsecutiveDays,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult Function()? reset,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
    required TResult Function(ValidateConsecutiveDays value)
        validateConsecutiveDays,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
    required TResult Function(ResetProfileContent value) reset,
    required TResult Function(LogSession value) logSession,
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
    TResult? Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult? Function(ResetProfileContent value)? reset,
    TResult? Function(LogSession value)? logSession,
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
    TResult Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult Function(ResetProfileContent value)? reset,
    TResult Function(LogSession value)? logSession,
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
abstract class _$$ValidateConsecutiveDaysImplCopyWith<$Res> {
  factory _$$ValidateConsecutiveDaysImplCopyWith(
          _$ValidateConsecutiveDaysImpl value,
          $Res Function(_$ValidateConsecutiveDaysImpl) then) =
      __$$ValidateConsecutiveDaysImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Profile profile,
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$ValidateConsecutiveDaysImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ValidateConsecutiveDaysImpl>
    implements _$$ValidateConsecutiveDaysImplCopyWith<$Res> {
  __$$ValidateConsecutiveDaysImplCopyWithImpl(
      _$ValidateConsecutiveDaysImpl _value,
      $Res Function(_$ValidateConsecutiveDaysImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$ValidateConsecutiveDaysImpl(
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

class _$ValidateConsecutiveDaysImpl implements ValidateConsecutiveDays {
  const _$ValidateConsecutiveDaysImpl(
      {required this.profile, this.onComplete, this.onError});

  @override
  final Profile profile;
  @override
  final void Function(Profile)? onComplete;
  @override
  final void Function(Object?, StackTrace)? onError;

  @override
  String toString() {
    return 'ProfileEvent.validateConsecutiveDays(profile: $profile, onComplete: $onComplete, onError: $onError)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidateConsecutiveDaysImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, onComplete, onError);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidateConsecutiveDaysImplCopyWith<_$ValidateConsecutiveDaysImpl>
      get copyWith => __$$ValidateConsecutiveDaysImplCopyWithImpl<
          _$ValidateConsecutiveDaysImpl>(this, _$identity);

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
        validateConsecutiveDays,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
    required TResult Function() reset,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, Duration duration, TimerSettings timerSettings)
        logSession,
  }) {
    return validateConsecutiveDays(profile, onComplete, onError);
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
        validateConsecutiveDays,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult? Function()? reset,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
  }) {
    return validateConsecutiveDays?.call(profile, onComplete, onError);
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
        validateConsecutiveDays,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult Function()? reset,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
    required TResult orElse(),
  }) {
    if (validateConsecutiveDays != null) {
      return validateConsecutiveDays(profile, onComplete, onError);
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
    required TResult Function(ValidateConsecutiveDays value)
        validateConsecutiveDays,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
    required TResult Function(ResetProfileContent value) reset,
    required TResult Function(LogSession value) logSession,
  }) {
    return validateConsecutiveDays(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult? Function(ResetProfileContent value)? reset,
    TResult? Function(LogSession value)? logSession,
  }) {
    return validateConsecutiveDays?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult Function(ResetProfileContent value)? reset,
    TResult Function(LogSession value)? logSession,
    required TResult orElse(),
  }) {
    if (validateConsecutiveDays != null) {
      return validateConsecutiveDays(this);
    }
    return orElse();
  }
}

abstract class ValidateConsecutiveDays implements ProfileEvent {
  const factory ValidateConsecutiveDays(
          {required final Profile profile,
          final void Function(Profile)? onComplete,
          final void Function(Object?, StackTrace)? onError}) =
      _$ValidateConsecutiveDaysImpl;

  Profile get profile;
  void Function(Profile)? get onComplete;
  void Function(Object?, StackTrace)? get onError;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidateConsecutiveDaysImplCopyWith<_$ValidateConsecutiveDaysImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CalculateConsecutiveDaysImplCopyWith<$Res> {
  factory _$$CalculateConsecutiveDaysImplCopyWith(
          _$CalculateConsecutiveDaysImpl value,
          $Res Function(_$CalculateConsecutiveDaysImpl) then) =
      __$$CalculateConsecutiveDaysImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {Profile profile,
      void Function(Profile)? onComplete,
      void Function(Object?, StackTrace)? onError});

  $ProfileCopyWith<$Res> get profile;
}

/// @nodoc
class __$$CalculateConsecutiveDaysImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$CalculateConsecutiveDaysImpl>
    implements _$$CalculateConsecutiveDaysImplCopyWith<$Res> {
  __$$CalculateConsecutiveDaysImplCopyWithImpl(
      _$CalculateConsecutiveDaysImpl _value,
      $Res Function(_$CalculateConsecutiveDaysImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profile = null,
    Object? onComplete = freezed,
    Object? onError = freezed,
  }) {
    return _then(_$CalculateConsecutiveDaysImpl(
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

class _$CalculateConsecutiveDaysImpl implements CalculateConsecutiveDays {
  const _$CalculateConsecutiveDaysImpl(
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
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CalculateConsecutiveDaysImpl &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.onComplete, onComplete) ||
                other.onComplete == onComplete) &&
            (identical(other.onError, onError) || other.onError == onError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, profile, onComplete, onError);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CalculateConsecutiveDaysImplCopyWith<_$CalculateConsecutiveDaysImpl>
      get copyWith => __$$CalculateConsecutiveDaysImplCopyWithImpl<
          _$CalculateConsecutiveDaysImpl>(this, _$identity);

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
        validateConsecutiveDays,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
    required TResult Function() reset,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, Duration duration, TimerSettings timerSettings)
        logSession,
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
        validateConsecutiveDays,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult? Function()? reset,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
        validateConsecutiveDays,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult Function()? reset,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
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
    required TResult Function(ValidateConsecutiveDays value)
        validateConsecutiveDays,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
    required TResult Function(ResetProfileContent value) reset,
    required TResult Function(LogSession value) logSession,
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
    TResult? Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult? Function(ResetProfileContent value)? reset,
    TResult? Function(LogSession value)? logSession,
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
    TResult Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult Function(ResetProfileContent value)? reset,
    TResult Function(LogSession value)? logSession,
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
      _$CalculateConsecutiveDaysImpl;

  Profile get profile;
  void Function(Profile)? get onComplete;
  void Function(Object?, StackTrace)? get onError;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CalculateConsecutiveDaysImplCopyWith<_$CalculateConsecutiveDaysImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ResetProfileContentImplCopyWith<$Res> {
  factory _$$ResetProfileContentImplCopyWith(_$ResetProfileContentImpl value,
          $Res Function(_$ResetProfileContentImpl) then) =
      __$$ResetProfileContentImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ResetProfileContentImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$ResetProfileContentImpl>
    implements _$$ResetProfileContentImplCopyWith<$Res> {
  __$$ResetProfileContentImplCopyWithImpl(_$ResetProfileContentImpl _value,
      $Res Function(_$ResetProfileContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ResetProfileContentImpl implements ResetProfileContent {
  const _$ResetProfileContentImpl();

  @override
  String toString() {
    return 'ProfileEvent.reset()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResetProfileContentImpl);
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
        validateConsecutiveDays,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
    required TResult Function() reset,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, Duration duration, TimerSettings timerSettings)
        logSession,
  }) {
    return reset();
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
        validateConsecutiveDays,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult? Function()? reset,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
  }) {
    return reset?.call();
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
        validateConsecutiveDays,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult Function()? reset,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset();
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
    required TResult Function(ValidateConsecutiveDays value)
        validateConsecutiveDays,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
    required TResult Function(ResetProfileContent value) reset,
    required TResult Function(LogSession value) logSession,
  }) {
    return reset(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult? Function(ResetProfileContent value)? reset,
    TResult? Function(LogSession value)? logSession,
  }) {
    return reset?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult Function(ResetProfileContent value)? reset,
    TResult Function(LogSession value)? logSession,
    required TResult orElse(),
  }) {
    if (reset != null) {
      return reset(this);
    }
    return orElse();
  }
}

abstract class ResetProfileContent implements ProfileEvent {
  const factory ResetProfileContent() = _$ResetProfileContentImpl;
}

/// @nodoc
abstract class _$$LogSessionImplCopyWith<$Res> {
  factory _$$LogSessionImplCopyWith(
          _$LogSessionImpl value, $Res Function(_$LogSessionImpl) then) =
      __$$LogSessionImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String profileId,
      DateTime startTime,
      DateTime endTime,
      Duration duration,
      TimerSettings timerSettings});

  $TimerSettingsCopyWith<$Res> get timerSettings;
}

/// @nodoc
class __$$LogSessionImplCopyWithImpl<$Res>
    extends _$ProfileEventCopyWithImpl<$Res, _$LogSessionImpl>
    implements _$$LogSessionImplCopyWith<$Res> {
  __$$LogSessionImplCopyWithImpl(
      _$LogSessionImpl _value, $Res Function(_$LogSessionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? profileId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? duration = null,
    Object? timerSettings = null,
  }) {
    return _then(_$LogSessionImpl(
      profileId: null == profileId
          ? _value.profileId
          : profileId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as Duration,
      timerSettings: null == timerSettings
          ? _value.timerSettings
          : timerSettings // ignore: cast_nullable_to_non_nullable
              as TimerSettings,
    ));
  }

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TimerSettingsCopyWith<$Res> get timerSettings {
    return $TimerSettingsCopyWith<$Res>(_value.timerSettings, (value) {
      return _then(_value.copyWith(timerSettings: value));
    });
  }
}

/// @nodoc

class _$LogSessionImpl implements LogSession {
  const _$LogSessionImpl(
      {required this.profileId,
      required this.startTime,
      required this.endTime,
      required this.duration,
      required this.timerSettings});

  @override
  final String profileId;
  @override
  final DateTime startTime;
  @override
  final DateTime endTime;
  @override
  final Duration duration;
  @override
  final TimerSettings timerSettings;

  @override
  String toString() {
    return 'ProfileEvent.logSession(profileId: $profileId, startTime: $startTime, endTime: $endTime, duration: $duration, timerSettings: $timerSettings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LogSessionImpl &&
            (identical(other.profileId, profileId) ||
                other.profileId == profileId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.timerSettings, timerSettings) ||
                other.timerSettings == timerSettings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, profileId, startTime, endTime, duration, timerSettings);

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LogSessionImplCopyWith<_$LogSessionImpl> get copyWith =>
      __$$LogSessionImplCopyWithImpl<_$LogSessionImpl>(this, _$identity);

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
        validateConsecutiveDays,
    required TResult Function(
            Profile profile,
            void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)
        calculateConsecutiveDays,
    required TResult Function() reset,
    required TResult Function(String profileId, DateTime startTime,
            DateTime endTime, Duration duration, TimerSettings timerSettings)
        logSession,
  }) {
    return logSession(profileId, startTime, endTime, duration, timerSettings);
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
        validateConsecutiveDays,
    TResult? Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult? Function()? reset,
    TResult? Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
  }) {
    return logSession?.call(
        profileId, startTime, endTime, duration, timerSettings);
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
        validateConsecutiveDays,
    TResult Function(Profile profile, void Function(Profile)? onComplete,
            void Function(Object?, StackTrace)? onError)?
        calculateConsecutiveDays,
    TResult Function()? reset,
    TResult Function(String profileId, DateTime startTime, DateTime endTime,
            Duration duration, TimerSettings timerSettings)?
        logSession,
    required TResult orElse(),
  }) {
    if (logSession != null) {
      return logSession(profileId, startTime, endTime, duration, timerSettings);
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
    required TResult Function(ValidateConsecutiveDays value)
        validateConsecutiveDays,
    required TResult Function(CalculateConsecutiveDays value)
        calculateConsecutiveDays,
    required TResult Function(ResetProfileContent value) reset,
    required TResult Function(LogSession value) logSession,
  }) {
    return logSession(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LoadProfile value)? loadProfile,
    TResult? Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult? Function(UpdateProfile value)? updateProfile,
    TResult? Function(ProfileErrorOccured value)? error,
    TResult? Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult? Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult? Function(ResetProfileContent value)? reset,
    TResult? Function(LogSession value)? logSession,
  }) {
    return logSession?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LoadProfile value)? loadProfile,
    TResult Function(ReceiveProfileUpdate value)? receiveUpdate,
    TResult Function(UpdateProfile value)? updateProfile,
    TResult Function(ProfileErrorOccured value)? error,
    TResult Function(ValidateConsecutiveDays value)? validateConsecutiveDays,
    TResult Function(CalculateConsecutiveDays value)? calculateConsecutiveDays,
    TResult Function(ResetProfileContent value)? reset,
    TResult Function(LogSession value)? logSession,
    required TResult orElse(),
  }) {
    if (logSession != null) {
      return logSession(this);
    }
    return orElse();
  }
}

abstract class LogSession implements ProfileEvent {
  const factory LogSession(
      {required final String profileId,
      required final DateTime startTime,
      required final DateTime endTime,
      required final Duration duration,
      required final TimerSettings timerSettings}) = _$LogSessionImpl;

  String get profileId;
  DateTime get startTime;
  DateTime get endTime;
  Duration get duration;
  TimerSettings get timerSettings;

  /// Create a copy of ProfileEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LogSessionImplCopyWith<_$LogSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
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
