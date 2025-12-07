import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/repository/settings_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_settings_state.dart';
part 'profile_settings_cubit.freezed.dart';

class ProfileSettingsCubit extends Cubit<ProfileSettingsState> {

  final SettingsRepository settingsRepository;
  final CrashlyticsService crashlyticsService;

  ProfileSettingsCubit({
    required this.settingsRepository,
    required this.crashlyticsService,
  }) : super(const ProfileSettingsState());

  Future<void> loadSettings(String profileId, {
    void Function(ProfileSettings)? onComplete,
    void Function(Object?, StackTrace)? onError,
  }) async {
    try {
      final settings = await settingsRepository.read(profileId);
      emit(ProfileSettingsState(settings: settings));
      onComplete?.call(settings);
    } catch (e, st) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Failed to load profile settings for profileId: $profileId'
      );
      onError?.call(e, st);
    }
  }

  Future<void> saveSettings(ProfileSettings settings, {
    void Function(ProfileSettings)? onComplete,
    void Function(Object?, StackTrace)? onError,
  }) async {
    try {
      await settingsRepository.update(settings);
      emit(ProfileSettingsState(settings: settings));
      onComplete?.call(settings);
    } catch (e, st) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason: 'Failed to save profile settings for profileId: ${settings.id}'
      );
      onError?.call(e, st);
    }
  }

}
