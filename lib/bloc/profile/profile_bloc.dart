import 'package:dhyana/bloc/profile/data_update/all.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/service/id_generator_service.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/profile_stats_report_updater.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final Logger logger = getLogger('ProfileBloc');

  final ProfileRepository profileRepository;
  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;
  final IdGeneratorService idGeneratorService;

  final ProfileStatsReportUpdater profileStatsUpdater;

  ProfileBloc({
    required this.profileRepository,
    required this.statisticsRepository,
    required this.crashlyticsService,
    required this.idGeneratorService,
    required this.profileStatsUpdater,
  }) : super(const ProfileState.loading()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateProfile>(_onUpdateProfile);
    on<ProfileErrorOccured>(_onProfileLoadingErrorOccured);
    on<ResetProfileContent>(_onResetProfile);
    on<LogSession>(_onLogSession);
    on<ValidateConsecutiveDays>(_onValidateConsecutiveDays);
  }

  void _onLoadProfile(LoadProfile event, emit) async {
    try {
      logger.t('Loading profile: ${event.profileId}');
      emit(const ProfileState.loading());
      Profile profile = await profileRepository.read(event.profileId);

      // Try to check if consecutive days are still valid
      add(ProfileEvent.validateConsecutiveDays(profile: profile));

      emit(ProfileState.loaded(profile: profile));
      event.onComplete?.call(profile);
      logger.t('Loaded profile: ${profile.displayName}');
    } catch (exception, stackTrace) {
      emit(const ProfileErrorState());
      crashlyticsService.recordError(
        exception: exception,
        stackTrace: stackTrace,
        reason: 'Unable to load profile: ${event.profileId}'
      );
      event.onError?.call(exception, stackTrace);
    }
  }

  void _onUpdateProfile(UpdateProfile event, emit) async {
    try {
      logger.t('Updating profile');
      ProfileDataUpdater profileUpdater = DefaultProfileDataUpdater(
        profile: event.profile,
        formData: event.formData,
        profileRepository: profileRepository,
        completeProfile: event.completeProfile,
      );
      Profile profile = await profileUpdater.update();
      emit(ProfileState.loaded(profile: profile));
      event.onComplete?.call(profile);
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to update profile: ${event.profile.id}'
      );
      event.onError?.call(e, stack);
    }
  }

  void _onProfileLoadingErrorOccured(ProfileErrorOccured event, emit) {
    emit(const ProfileErrorState());
  }

  void _onValidateConsecutiveDays(ValidateConsecutiveDays event, emit) async {
    try {

      final DateTime now = DateTime.now();

      // Check if it has been already validated today
      // In that case no need to continue
      Profile profile = event.profile;
      final bool isSameDay = now.isSameDay(profile.statsReport.consecutiveDays.lastChecked);
      if (isSameDay == true && event.forceValidation == false) {
        logger.t('Skipping validating consecutive days: it\' the same day, forceValidation: ${event.forceValidation.toString()}');
        return;
      }

      ProfileStatisticsReport updatedStatsReport =
        profileStatsUpdater.validateConsecutiveDays(event.profile.statsReport);

      // Update the profile with newly calculated report
      Profile updatedProfile = event.profile.copyWith(
        statsReport: updatedStatsReport
      );

      emit(ProfileState.loaded(profile: updatedProfile));
      logger.t('Consecutive days change: ${event.profile.statsReport.consecutiveDays.current} -> ${updatedProfile.statsReport.consecutiveDays.current}');
      event.onComplete?.call(updatedProfile);

      // Save the validated profile data
      await profileRepository.update(updatedProfile);
      logger.t('Consecutive days checked at: ${updatedStatsReport.consecutiveDays.lastChecked.toString()}');
    } catch(e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to validate consecutive days: ${event.profile.statsReport.consecutiveDays.toString()}'
      );
      event.onError?.call(e, stack);
    }
  }

  void _onLogSession(LogSession event, emit) async {
    try {

      // Get a profile
      Profile profile = await profileRepository.read(event.profileId);
      logger.t('Logging session for profile: ${profile.id}');

      // Create Session
      Session session = Session(
        id: idGeneratorService.sessionId(event.profileId),
        startTime: event.startTime,
        endTime: event.endTime,
        duration: event.duration,
        timerSettings: event.timerSettings,
      );

      // Calculate profile statistics report
      ProfileStatisticsReport updatedStatsReport =
        profileStatsUpdater.updateProfileStatsReportWithNewSession(
          profile.statsReport,
          session,
        );
      logger.t('Updated statistics report: ${session.id}');

      // Store statistics data
      Profile updatedProfile = profile.copyWith(
        statsReport: updatedStatsReport,
      );

      await statisticsRepository.logSession(
        updatedProfile,
        session,
      );
      logger.t('Logged session in profile: ${session.id}');

      emit(ProfileState.loaded(profile: updatedProfile));

      // Update profile with new report
      await profileRepository.update(updatedProfile);
      logger.t('Updated profile with new statistics report: ${profile.id}');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to log session: ${event.profileId}'
      );
      emit(const ProfileErrorState());
    }

  }

  void _onResetProfile(ResetProfileContent event, emit) {
    logger.t('Reset profile...');
    emit(const ProfileState.initial());
  }

}
