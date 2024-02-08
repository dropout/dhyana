import 'dart:async';

import 'package:dhyana/model/profile_stats.dart';
import 'package:dhyana/util/date_time_utils.dart';
import 'package:dhyana/util/profile_stats_calculator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

import 'strategy/all.dart';

part 'profile_event.dart';
part 'profile_state.dart';
part 'profile_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  Logger logger = getLogger('ProfileBloc');

  final ProfileRepository profileRepository;
  final CrashlyticsService crashlyticsService;
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
  }

  void _onLoadProfile(LoadProfile event, emit) async {
    try {
      emit(const ProfileState.loading());
      if (event.useStream) {
        bool isOnCompleteCallbackFired = false;
        logger.t('Streaming profile: ${event.profileId}');
        _profileStreamSubscription?.cancel();
        _profileStreamSubscription = profileRepository
          .getProfileStreamById(event.profileId)
          .listen((profile) {
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
          // It happens during an update received
          // Maybe we don't need to display this error?
          add(const ProfileEvent.error());
        });
      } else {
        logger.t('Loading profile: ${event.profileId}');
        _profileStreamSubscription?.cancel();
        Profile profile = await profileRepository.getProfileById(event.profileId);
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
      ProfileUpdateStrategy profileUpdateStrategy = DefaultProfileUpdateStrategy(
        profile: event.profile,
        formData: event.formData,
        profileRepository: profileRepository,
        completeProfile: event.completeProfile,
      );
      Profile profile = await profileUpdateStrategy.execute();
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
      logger.t('Calculating consecutive days for profile: ${event.profile.displayName}');
      DateTime now = DateTime.now();

      // no last session, no consecutive days
      if (event.profile.stats.lastSessionDate == null) {
        event.onComplete?.call(event.profile);
        logger.t('No last session, nothing to calculate');
        return;
      }

      // last session was on yesterday, nothing to calculate yet
      if (now.isBeforePreviousDay(event.profile.stats.lastSessionDate!) == false) {
        event.onComplete?.call(event.profile);
        logger.t('Last session was on yesterday, nothing to calculate yet');
        return;
      }

      // should calculate consecutive days and save the new value in db
      ProfileStats calculatedStats = calculateConsecutiveDays(
        event.profile.stats,
        now,
      );
      Profile calculatedProfile = event.profile.copyWith(
        stats: calculatedStats,
      );
      await profileRepository.updateProfileData(calculatedProfile);
      emit(ProfileState.loaded(profile: calculatedProfile));
      event.onComplete?.call(calculatedProfile);
      logger.t('Last consecutive days: ${event.profile.stats.consecutiveDays} - New consecutive days: ${calculatedStats.consecutiveDays}');
    } catch(e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to update profile: ${event.profile.id}'
      );
      event.onError?.call(e, stack);
    }
  }

  @override
  Future<void> close() async {
    _profileStreamSubscription?.cancel();
    return super.close();
  }

}
