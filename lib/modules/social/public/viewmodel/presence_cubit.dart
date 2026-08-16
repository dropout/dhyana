import 'package:dhyana/core/domain/entity/location.dart';
import 'package:dhyana/modules/social/data/mapper/presence_mapper.dart';
import 'package:dhyana/modules/social/public/model/presence.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/modules/social/domain/entity/presence_query_options_entity.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/modules/social/domain/usecase/query_presence_use_case.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'presence_cubit.freezed.dart';

/// Enables showing and querying presence data to show who is around
/// who you have practiced with. 
class PresenceCubit extends Cubit<PresenceState> with LoggerMixin {

  /// Use case to load presence data.
  final QueryPresenceUseCase queryPresenceDataUseCase;

  /// Service to log errors
  final CrashlyticsService crashlyticsService;

  /// Creates a new [PresenceCubit] with the given repositories and services.
  PresenceCubit({
    required this.queryPresenceDataUseCase,
    required this.crashlyticsService,
  }) : super(const PresenceState.initial());

  /// Loads presence data based on [queryOptions].
  /// If [appendResult] is true, loaded items are appended to current items.
  Future<void> loadPresenceData({
    Duration windowSize = const Duration(hours: 3),
    int limit = 20,
    String? ownProfileId,
    String? lastDocumentId,
    Location? location,
    double rangeInKm = 100,
    bool appendResult = false,
  }) async {
    try {
      final existingPresenceList = _currentPresenceList;
      if (appendResult) {
        emit(PresenceState.loadingMore(presenceList: existingPresenceList));
      } else {
        emit(PresenceState.loading());
      }

      final loadedPresenceList =
        (await queryPresenceDataUseCase.execute(PresenceQueryOptionsEntity(
          windowSize: windowSize,
          limit: limit,
          ownProfileId: ownProfileId,
          lastDocumentId: lastDocumentId,
          location: location,
          rangeInKm: rangeInKm,
        ))).map((e) => e.toApi()).toList();

      final resultList = appendResult
          ? <Presence>[...existingPresenceList, ...loadedPresenceList]
          : loadedPresenceList;

      logger.t(
        'Loaded ${loadedPresenceList.length} presence items. '
        'Append: $appendResult. Total: ${resultList.length}',
      );
      emit(PresenceState.loaded(presenceList: resultList));
    } catch (e, stack) {
      emit(const PresenceState.error());
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Unable to load presence data',
      );
    }
  }

  List<Presence> get _currentPresenceList {
    if (state is PresenceLoadedState) {
      return (state as PresenceLoadedState).presenceList;
    }
    if (state is PresenceLoadingMoreState) {
      return (state as PresenceLoadingMoreState).presenceList;
    }
    return const <Presence>[];
  }

}

@freezed
sealed class PresenceState with _$PresenceState {

  const PresenceState._();

  const factory PresenceState.initial() = _Initial;
  const factory PresenceState.loading() = PresenceLoadingState;
  const factory PresenceState.loadingMore({
    required List<Presence> presenceList,
  }) = PresenceLoadingMoreState;
  const factory PresenceState.loaded({
    required List<Presence> presenceList,
  }) = PresenceLoadedState;
  const factory PresenceState.error() = PresenceErrorState;

}