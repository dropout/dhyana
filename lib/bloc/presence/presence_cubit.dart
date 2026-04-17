import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/location.dart';
import 'package:dhyana/model/presence.dart';
import 'package:dhyana/model/presence_query_options.dart';
import 'package:dhyana/model/profile.dart';
import 'package:dhyana/model/public_profile.dart';
import 'package:dhyana/repository/presence_repository.dart';
import 'package:dhyana/repository/profile_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'presence_state.dart';
part 'presence_cubit.freezed.dart';

/// Enables showing and querying presence data to show who is around
/// who you have practiced with. 
class PresenceCubit extends Cubit<PresenceState> with LoggerMixin {
  
  /// Repository to show and query presence data.
  final PresenceRepository presenceRepository;

  /// Repository to read profile data to show presence.
  final ProfileRepository profileRepository;

  /// Service to log errors
  final CrashlyticsService crashlyticsService;

  /// Creates a new [PresenceCubit] with the given repositories and services.
  PresenceCubit({
    required this.presenceRepository,
    required this.profileRepository,
    required this.crashlyticsService,
  }) : super(const PresenceState.initial());

  /// Loads presence data based on the given query options.
  /// If [ownProfileId] is provided, it will exclude it from the results.
  /// If [location] is provided it will filter and sort the results by distance 
  /// to the location.
  Future<void> loadPresenceData({
    String? ownProfileId,
    Location? location,
    double rangeInKm = 100.0,
    Duration interval = const Duration(minutes: 60),
    int limit = 18,
  }) async {
    try {
      emit(PresenceState.loading());
      List<Presence> presenceList = await presenceRepository.query(
        PresenceQueryOptions(
          limit: limit,
          ownProfileId: ownProfileId,
          location: location,
          rangeInKm: rangeInKm,
          windowSize: interval,
        ),
      );
      logger.t('Loaded ${presenceList.length} presence items');
      emit(PresenceState.loaded(presenceList: presenceList));
    } catch (e, stack) {
      emit(const PresenceState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load presence data',
      );
    }
  }

  Future<void> loadMorePresenceData(String lastDocumentId, {
    int intervalInMinutes = 60,
    int batchSize = 18,
  }) async {
    try {

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
        limit: batchSize,
        lastDocumentId: lastDocumentId,
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

  Future<void> showPresence(String profileId) async {
    try {
      Profile profile = await profileRepository.read(profileId);
      if (profile.completed) {
        await presenceRepository.showPresence(
          Presence(
            id: profile.id,
            profile: PublicProfile.fromProfile(profile: profile),
            startedAt: DateTime.now(),
            location: profile.location,
          ),
        );
        logger.t('Showing presence.');
      } else {
        logger.t(
          'User is signed in but profile is incomplete, NOT showing presence.',
        );
      }
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to show presence!',
      );
    }
  }

}
