import 'dart:async';

import 'package:dhyana/bloc/profile/data_update/all.dart';
import 'package:dhyana/model/profile_statistics_report.dart';
import 'package:dhyana/util/profile_stats_calculator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/repository/profile_repository.dart';
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
  final CrashlyticsService crashlyticsService;
  final ProfileStatsCalculator _profileStatsCalculator = ProfileStatsCalculator();
  StreamSubscription<Profile>? _profileStreamSubscription;

  ProfileBloc({
    required this.profileRepository,
    required this.crashlyticsService,
  }) : super(const ProfileState.loading()) {

    on<LoadProfile>(_onLoadProfile);
    on<ReceiveProfileUpdate>(_onReceiveProfileUpdate);
    on<UpdateProfile>(_onUpdateProfile);
    on<ProfileErrorOccured>(_onProfileLoadingErrorOccured);
    on<CalculateConsecutiveDays>(_onCalculateConsecutiveDays);
    on<ValidateConsecutiveDays>(_onValidateConsecutiveDays);
    on<ResetProfileContent>(_onResetProfile);
  }

  void _onLoadProfile(LoadProfile event, emit) async {
    try {
      emit(const ProfileState.loading());
      // await Future.delayed(Duration(seconds: 3));
      // throw Exception('stupid');
      if (event.useStream) {
        // only call load completed callback
        // once on every LoadProfile event
        // in case of using streams
        bool isOnCompleteCallbackFired = false;
        _profileStreamSubscription?.cancel();
        _profileStreamSubscription = profileRepository
          .readStream(event.profileId)
          .listen((profile) {

            // user tapped back button while loading
            // it is cancelled before in close()
            // but still its called ??
            if (isClosed) return;

            add(ProfileEvent.receiveUpdate(profile: profile));
            if (isOnCompleteCallbackFired == false) {
              isOnCompleteCallbackFired = true;
              event.onComplete?.call(profile);
            }
          });

        _profileStreamSubscription?.onError((exception, stackTrace) {
          crashlyticsService.recordError(
            exception: exception,
            stackTrace: stackTrace,
            reason: 'Error occured when receiving profile info: ${event.profileId}'
          );

          // user tapped back button while loading
          if (isClosed) return;

          // It happens during an update received
          // Maybe we don't need to display this error?
          add(const ProfileEvent.error());

        });
      } else {
        logger.t('Loading profile: ${event.profileId}');
        _profileStreamSubscription?.cancel();
        Profile profile = await profileRepository.read(event.profileId);
        emit(ProfileState.loaded(profile: profile));
        event.onComplete?.call(profile);
        logger.t('Loaded profile: ${profile.displayName}');
      }
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

  void _onReceiveProfileUpdate(ReceiveProfileUpdate event, emit) {
    emit(ProfileState.loaded(profile: event.profile));
    logger.t('Receiving profile update: ${event.profile.displayName}');
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

  void _onCalculateConsecutiveDays(CalculateConsecutiveDays event, emit) async {
    try {
      logger.t('Calculating consecutive days for profile: ${event.profile.id}');

      Profile calculatedProfile = event.profile.copyWith(
        statsReport: _profileStatsCalculator.calculateConsecutiveDays(event.profile.statsReport),
      );

      if (calculatedProfile.statsReport.consecutiveDays == event.profile.statsReport.consecutiveDays) {
        logger.t('Consecutive days have not changed, not saving profile data');
        event.onComplete?.call(event.profile);
        return;
      }

      logger.t('Consecutive days changed: ${event.profile.statsReport.consecutiveDays} -> ${calculatedProfile.statsReport.consecutiveDays}');

      await profileRepository.update(calculatedProfile);
      emit(ProfileState.loaded(profile: calculatedProfile));
      event.onComplete?.call(calculatedProfile);
      logger.t('Profile saved');
    } catch(e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to update profile: ${event.profile.id}'
      );
      event.onError?.call(e, stack);
    }
  }

  void _onValidateConsecutiveDays(ValidateConsecutiveDays event, emit) async {
    try {
      logger.t('Validating consecutive days');
      ProfileStatisticsReport validatedStats = _profileStatsCalculator
        .calculateConsecutiveDays(event.profile.statsReport);

      if (event.profile.statsReport.consecutiveDays == validatedStats.consecutiveDays) {
        logger.t('Concsecutive days are OK - no change');
        return;
      }

      Profile updatedProfile = event.profile.copyWith(
        statsReport: validatedStats
      );
      emit(ProfileState.loaded(profile: updatedProfile));
      logger.t('Validated consecutive days: ${event.profile.statsReport.consecutiveDays} -> ${updatedProfile.statsReport.consecutiveDays}');
      event.onComplete?.call(updatedProfile);

      // save the validated data, no need to wait for completing that
      logger.t('Saving validated consecutive days...');
      await profileRepository.update(updatedProfile);
      logger.t('Validated consecutive days saved in profile');
    } catch(e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to validate consecutive days: ${event.profile.id}'
      );
      event.onError?.call(e, stack);
    }
  }

  void _onResetProfile(ResetProfileContent event, emit) {
    logger.t('Reset profile...');
    _profileStreamSubscription?.cancel();
    emit(const ProfileState.initial());
  }

  @override
  Future<void> close() async {
    _profileStreamSubscription?.cancel();
    return super.close();
  }

}
