part of 'profile_settings_cubit.dart';

@freezed
sealed class ProfileSettingsState with _$ProfileSettingsState {

  const ProfileSettingsState._();

  const factory ProfileSettingsState({
    ProfileSettings? settings,
  }) = _ProfileSettingsState;

}
