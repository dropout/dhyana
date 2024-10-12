import 'package:dhyana/bloc/profile/data_update/all.dart';
import 'package:dhyana/model/factory/session_factory.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/profile_stats_calculator.dart';
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

  Logger logger = getLogger('ProfileBloc');

  final ProfileRepository profileRepository;
  final StatisticsRepository statisticsRepository;
  final CrashlyticsService crashlyticsService;
  final ProfileStatsCalculator _profileStatsCalculator = ProfileStatsCalculator();

  ProfileBloc({
    required this.profileRepository,
    required this.statisticsRepository,
    required this.crashlyticsService,
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

      // On every profile load we attempt to validate consecutive days
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

      // Check if it has been validated already today
      // In that case no need to continue
      Profile profile = event.profile;
      final bool isSameDay = DateTime.now()
        .isSameDay(profile.statsReport.consecutiveDays.lastChecked);
      if (isSameDay == true && event.forceValidation == false) {
        logger.t('Skipping validating consecutive days: it\' the same day, forceValidation: ${event.forceValidation.toString()}');
        return;
      }

      // Make a calculation
      ProfileStatisticsReport validatedStats = _profileStatsCalculator
        .calculateConsecutiveDays(event.profile.statsReport);

      // Mark last checked
      final DateTime now = DateTime.now();
      validatedStats = validatedStats.copyWith(
        consecutiveDays: validatedStats.consecutiveDays.copyWith(
          lastChecked: now,
        ),
      );

      // Update the profile with newly calculated report
      Profile updatedProfile = event.profile.copyWith(
        statsReport: validatedStats
      );

      emit(ProfileState.loaded(profile: updatedProfile));
      logger.t('Consecutive days change: ${event.profile.statsReport.consecutiveDays.count} -> ${updatedProfile.statsReport.consecutiveDays.count}');
      event.onComplete?.call(updatedProfile);

      // save the validated profile data
      await profileRepository.update(updatedProfile);
      logger.t('Consecutive days checked at: ${now.toString()}');
    } catch(e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to validate consecutive days: ${event.profile.id}'
      );
      event.onError?.call(e, stack);
    }
  }

  void _onLogSession(LogSession event, emit) async {
    try {
      ProfileStatsCalculator profileStatsCalculator = ProfileStatsCalculator();

      // Get a profile
      Profile profile = await profileRepository.read(event.profileId);
      logger.t('Logging session for profile: ${profile.id}');

      // Create Session
      Session session = SessionFactory.withFirebaseId(
        profileId: event.profileId,
        startTime: event.startTime,
        endTime: event.endTime,
        duration: event.duration,
        timerSettings: event.timerSettings
      );
      logger.t('Session created: ${session.id}');

      // Calculate statistics report
      ProfileStatisticsReport updatedStatsReport =
        profileStatsCalculator.updateProfileStatsReportWithNewSession(
          profile.statsReport,
          session
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
      logger.t('Stored session in profile statistics: ${session.id}');

      // Update profile with new report
      await profileRepository.update(updatedProfile);
      logger.t('Updated profile with new statistics report: ${profile.id}');

    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to log session: ${event.profileId}'
      );
    }

  }

  void _onResetProfile(ResetProfileContent event, emit) {
    logger.t('Reset profile...');
    emit(const ProfileState.initial());
  }

}
