import 'dart:async';

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
    on<ProfileLoadingErrorOccured>(_onProfileLoadingErrorOccured);
  }

  void _onLoadProfile(LoadProfile event, emit) async {
    try {
      emit(const ProfileState.loading());
      if (event.useStream) {
        logger.v('Streaming profile: ${event.profileId}');
        _profileStreamSubscription?.cancel();

        _profileStreamSubscription = profileRepository
            .getProfileStreamById(event.profileId).listen((profile) {
          add(ProfileEvent.receiveUpdate(profile: profile));
        });

        _profileStreamSubscription?.onError((exception, stackTrace) {
          crashlyticsService.recordError(
            exception: exception,
            stackTrace: stackTrace,
            reason: 'Error occured when receiving profile info: ${event.profileId}'
          );

          // Maybe we don't need to display this error?
          add(const ProfileEvent.error());
        });

      } else {
        logger.v('Loading profile: ${event.profileId}');
        Profile profile = await profileRepository.getProfileById(event.profileId);
        emit(ProfileState.loaded(profile: profile));
        logger.v('Loaded profile: ${profile.displayName}');
      }
    } catch (exception, stackTrace) {
      emit(const ProfileErrorState());
      crashlyticsService.recordError(
        exception: exception,
        stackTrace: stackTrace,
        reason: 'Unable to load profile: ${event.profileId}'
      );
    }
  }

  void _onReceiveProfileUpdate(ReceiveProfileUpdate event, emit) {
    emit(ProfileState.loaded(profile: event.profile));
    logger.v('Receiving profile update: ${event.profile.displayName}');
  }

  void _onUpdateProfile(UpdateProfile event, emit) async {
    try {
      logger.v('Updating profile');
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

  void _onProfileLoadingErrorOccured(ProfileLoadingErrorOccured event, emit) {
    emit(const ProfileErrorState());
  }

  @override
  Future<void> close() async {
    _profileStreamSubscription?.cancel();
    return super.close();
  }

}
