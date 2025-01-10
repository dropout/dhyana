import 'package:dhyana/model/all.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/public_profile.dart';
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

  final Logger logger = getLogger('PresenceBloc');

  final PresenceRepository presenceRepository;
  final ProfileRepository profileRepository;
  final CrashlyticsService crashlyticsService;

  PresenceBloc({
    required this.presenceRepository,
    required this.profileRepository,
    required this.crashlyticsService,
  }) : super(const PresenceState.initial()) {
    on<LoadPresenceData>(_onLoadPresenceData);
    on<LoadMorePresenceData>(_onLoadMorePresenceData);
    on<ShowPresence>(_onShowPresence);
  }

  void _onLoadPresenceData(LoadPresenceData event, emit) async {
    logger.t('Loading presence data');
    try {
      emit(PresenceState.loading());
      List<Presence> presenceList = await presenceRepository
        .query(PresenceQueryOptions(
          limit: 18,
          ownProfileId: event.ownProfileId,
        ));
      logger.t('Loaded ${presenceList.length} presence items');
      emit(PresenceState.loaded(presenceList: presenceList));
    } catch (e, stack) {
      emit(const PresenceState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load presence data'
      );
    }
  }

  void _onLoadMorePresenceData(LoadMorePresenceData event, emit) async {
    try {
      logger.t('Loading more presence data');

      // Get existing presence list
      List<Presence> existingPresenceList = [];
      if (state is PresenceLoadedState) {
        PresenceLoadedState loadedState = state as PresenceLoadedState;
        existingPresenceList = loadedState.presenceList;
      }

      // Get more presence list
      emit(PresenceState.loadingMore(
        presenceList: existingPresenceList
      ));
      PresenceQueryOptions queryOptions = PresenceQueryOptions(
        limit: event.batchSize,
        lastDocumentId: event.lastDocumentId,
      );
      List<Presence> morePresenceList = await presenceRepository.query(queryOptions);

      // Combine existing and more presence list
      final List<Presence> resultList = [
        existingPresenceList,
        morePresenceList
      ].expand((x) => x).toList();

      emit(PresenceState.loaded(
        presenceList: resultList
      ));
      logger.t('Loaded ${morePresenceList.length} more into existing list: ${existingPresenceList.length}. Total: ${resultList.length}');
    } catch (e, stack) {
      emit(const PresenceState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load MORE presence data'
      );
    }


  }

  void _onShowPresence(ShowPresence event, emit) async {
    try {
      Profile profile = await profileRepository.read(event.profileId);
      if (profile.completed) {
        await presenceRepository.showPresence(Presence(
          id: profile.id,
          profile: PublicProfile.fromProfile(profile: profile),
          startedAt: DateTime.now(),
        ));
        logger.t('Showing presence.');
      } else {
        await presenceRepository.showPresence(
          Presence(
            id: profile.id,
            profile: PublicProfile.anonymous(),
            startedAt: DateTime.now(),
          )
        );
        logger.t('User is signed in but profile is incomplete, showing anonymous presence.');
      }
      logger.t('Successfully showed presence.');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to show presence!'
      );
    }

  }

}
