import 'package:dhyana/bloc/profile/data_update/all.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/repository/all.dart';
import 'package:dhyana/service/id_generator_service.dart';
import 'package:dhyana/service/profile_stats_report_updater.dart';
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
    on<ClearProfileData>(_onClearProfileData);
  }

  void _onLoadProfile(LoadProfile event, emit) async {
    try {
      logger.t('Loading profile: ${event.profileId}');
      Profile profile = await profileRepository.read(event.profileId);

      // Check if consecutive days are valid
      ProfileStatisticsReport updatedStatsReport =
        profileStatsUpdater.validateStatsReport(profile.statsReport);

      if (updatedStatsReport != profile.statsReport) {
        logger.t('Consecutive days and milestone progress have been invalidated!');
        profile = profile.copyWith(
          statsReport: updatedStatsReport
        );
        // lazy update the profile
        profileRepository.update(profile);
      }

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

  void _onClearProfileData(ClearProfileData event, emit) async {
    emit(const ProfileState.initial());
    logger.t('Profile data cleared!');
  }

}
