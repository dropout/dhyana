import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/core/domain/entity/presence/presence.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/modules/social/domain/usecase/load_more_presence_data_use_case.dart';
import 'package:dhyana/modules/social/domain/usecase/load_presence_data_use_case.dart';
import 'package:dhyana/modules/social/domain/usecase/show_presence_use_case.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'presence_state.dart';
part 'presence_cubit.freezed.dart';

/// Enables showing and querying presence data to show who is around
/// who you have practiced with. 
class PresenceCubit extends Cubit<PresenceState> with LoggerMixin {

  /// Use case to load presence data.
  final LoadPresenceDataUseCase loadPresenceDataUseCase;

  /// Use case to load additional presence data pages.
  final LoadMorePresenceDataUseCase loadMorePresenceDataUseCase;

  /// Use case to show user presence.
  final ShowPresenceUseCase showPresenceUseCase;

  /// Service to log errors
  final CrashlyticsService crashlyticsService;

  /// Creates a new [PresenceCubit] with the given repositories and services.
  PresenceCubit({
    required this.loadPresenceDataUseCase,
    required this.loadMorePresenceDataUseCase,
    required this.showPresenceUseCase,
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
      final presenceList = await loadPresenceDataUseCase.execute(
        ownProfileId: ownProfileId,
        location: location,
        rangeInKm: rangeInKm,
        interval: interval,
        limit: limit,
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
      final morePresenceList = await loadMorePresenceDataUseCase.execute(
        lastDocumentId: lastDocumentId,
        batchSize: batchSize,
      );

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
      await showPresenceUseCase.execute(profileId);
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to show presence!',
      );
    }
  }

}
