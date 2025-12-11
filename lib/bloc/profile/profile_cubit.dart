import 'package:dhyana/bloc/profile/data_update/default_profile_data_updater.dart';
import 'package:dhyana/data_provider/data_provider_exception.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/profile_settings.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/repository/settings_repository.dart';
import 'package:dhyana/repository/statistics_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/service/id_generator_service.dart';
import 'package:dhyana/service/profile_stats_report_updater.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'data_update/profile_data_updater.dart';

part 'profile_state.dart';
part 'profile_cubit.freezed.dart';

class ProfileCubit extends Cubit<ProfileState> with LoggerMixin {

  final ProfileRepository profileRepository;
  final SettingsRepository settingsRepository;
  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;
  final IdGeneratorService idGeneratorService;
  final ProfileStatsReportUpdater profileStatsUpdater;

  ProfileCubit({
    required this.profileRepository,
    required this.statisticsRepository,
    required this.settingsRepository,
    required this.crashlyticsService,
    required this.idGeneratorService,
    required this.profileStatsUpdater,
  }) : super(const ProfileState.initial());

  void loadProfile(String profileId, {
    Profile? profile,
    void Function(Profile)? onComplete,
    void Function(Object?, StackTrace)? onError,
  }) async {
    try {
      late Profile result;
      if (profile != null) {
        logger.t('Using profile: $profileId');
        result = profile;
      } else {
        logger.t('Loading profile: $profileId');
        emit(const ProfileState.loading());
        result = await profileRepository.read(profileId);
      }

      // Check if consecutive days are valid
      ProfileStatisticsReport updatedStatsReport =
        profileStatsUpdater.validateStatsReport(result.statsReport);

      if (updatedStatsReport != result.statsReport) {
        logger.t('Consecutive days and milestone progress have been invalidated!');
        result = result.copyWith(
          statsReport: updatedStatsReport
        );
        // lazy update the profile
        profileRepository.update(result);
      }
      final ProfileSettings settings = await _loadProfileSettings(result.id);

      emit(ProfileState.loaded(profile: result, settings: settings));
      onComplete?.call(result);
      logger.t('Loaded profile: ${result.displayName}');
    } catch (exception, stackTrace) {
      emit(const ProfileErrorState());
      crashlyticsService.recordError(
        exception: exception,
        stackTrace: stackTrace,
        reason: 'Unable to load profile: $profileId'
      );
      onError?.call(exception, stackTrace);
    }
  }

  void updateProfile({
    required Profile profile,
    required Map<String, dynamic> formData,
    void Function(Profile profile)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
    bool completeProfile = false,
  }) async {
    try {
      logger.t('Updating profile');
      ProfileDataUpdater profileUpdater = DefaultProfileDataUpdater(
        profile: profile,
        formData: formData,
        profileRepository: profileRepository,
        completeProfile: completeProfile,
      );
      final result = await profileUpdater.update();
      final settings = await _loadProfileSettings(result.id);
      emit(ProfileState.loaded(profile: result, settings: settings));
      onComplete?.call(result);
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to update profile: ${profile.id}'
      );
      onError?.call(e, stack);
    }
  }

  void updateProfileSettings({
    required Profile profile,
    required Map<String, dynamic> settingsFormData,
    void Function(ProfileSettings settings)? onComplete,
    void Function(Object? error, StackTrace stack)? onError,
  }) async {
    try {
      logger.t('Updating profile settings');
      final updatedSettings = ProfileSettings.fromJson({
        ...settingsFormData,
        'id': profile.id,
      });
      await settingsRepository.update(updatedSettings);
      emit(ProfileState.loaded(profile: profile, settings: updatedSettings));
      onComplete?.call(updatedSettings);
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to update profile settings for profile: ${profile.id}'
      );
      onError?.call(e, stack);
    }


  }

  void clearData() {
    emit(const ProfileState.initial());
    logger.t('Profile data cleared!');
  }

  Future<ProfileSettings> _loadProfileSettings(String profileId) async {
    try {
      return await settingsRepository.read(profileId);
    } on DocumentNotFoundException {
      logger.w('No settings found for profile: $profileId, using default settings');
      return ProfileSettings(id: profileId);
    }
  }



}
