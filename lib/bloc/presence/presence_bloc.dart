import 'package:dhyana/data_provider/auth/model/user.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/public_profile.dart';
import 'package:dhyana/repository/auth_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/presence.dart';
import 'package:dhyana/repository/presence_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_factory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'presence_event.dart';
part 'presence_state.dart';
part 'presence_bloc.freezed.dart';

class PresenceBloc extends Bloc<PresenceEvent, PresenceState> {

  Logger logger = getLogger('PresenceBloc');

  final PresenceRepository presenceRepository;
  final AuthRepository authRepository;
  final ProfileRepository profileRepository;
  final CrashlyticsService crashlyticsService;

  PresenceBloc({
    required this.presenceRepository,
    required this.authRepository,
    required this.profileRepository,
    required this.crashlyticsService,
  }) : super(const PresenceState.initial()) {
    on<LoadPresenceData>(_onLoadPresenceData);
    on<ShowPresence>(_onShowPresence);
  }

  void _onLoadPresenceData(LoadPresenceData event, emit) async {
    logger.t('Loading presence data');
    try {
      List<Presence> presenceList = await presenceRepository
        .getPresence(event.ownProfileId);
      logger.t('Loaded ${presenceList.length} presence items');
      emit(PresenceState.loaded(presenceList: presenceList));
    } catch (e, stack) {
      emit(const PresenceState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to presence data'
      );
    }
  }

  void _onShowPresence(ShowPresence event, emit) async {
    try {
      logger.t('Showing presence');
      User? user = await authRepository.user;
      if (user == null) {
        logger.t('User is not signed in, not showing presence.');
        return;
      }
      Profile profile = await profileRepository.read(user.uid);
      if (profile.completed) {
        logger.t('User signed in and profile is complete, showing presence.');
        await presenceRepository.showPresence(Presence(
          id: profile.id,
          profile: PublicProfile.fromProfile(profile: profile),
          startedAt: DateTime.now(),
        ));
      } else {
        logger.t('User is signed in but profile is incomplete, showing anonymous presence.');
        await presenceRepository.showPresence(Presence(
          id: profile.id,
          profile: PublicProfile.anonymous(),
          startedAt: DateTime.now(),
        ));
      }
      logger.t('Successfully showed presence.');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to show presence'
      );
    }

  }

}
