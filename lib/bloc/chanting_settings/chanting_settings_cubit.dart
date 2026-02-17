import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/model/chant.dart';
import 'package:dhyana/repository/chants_repository.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chanting_settings_state.dart';
part 'chanting_settings_cubit.freezed.dart';

class ChantingSettingsCubit extends Cubit<ChantingSettingsState>
    with LoggerMixin {

  final ChantsRepository chantsRepository;
  final CrashlyticsService crashlyticsService;

  ChantingSettingsCubit({
    required this.chantsRepository,
    required this.crashlyticsService,
  }) : super(ChantingSettingsState.initial());

  Future<void> load() async {
    try {
      logger.t('Loading available chants');
      emit(state.copyWith(isLoading: true, error: null));

      final chants = await chantsRepository.queryAll();

      emit(state.copyWith(
        availableChants: chants,
        isLoading: false,
      ));
      logger.t('Successfully loaded ${chants.length} chants');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to load available chants',
      );
      emit(state.copyWith(
        isLoading: false,
        error: e.toString(),
      ));
    }
  }

  /// Reorders the chant list by removing the element at [oldIndex] and inserting
  /// it at [newIndex]. Bounds are clamped so accidental out-of-range inputs from
  /// the UI do not crash the app.
  void reorder(int oldIndex, int newIndex) {
    if (state.selectedChants.isEmpty) {
      return;
    }

    final int safeOldIndex = oldIndex.clamp(0, state.selectedChants.length - 1);
    final int safeNewIndex = newIndex.clamp(0, state.selectedChants.length - 1);

    if (safeOldIndex == safeNewIndex) {
      return;
    }

    final updated = List<Chant>.from(state.selectedChants);

    final movedChant = updated.removeAt(safeOldIndex);
    updated.insert(safeNewIndex, movedChant);

    emit(state.copyWith(selectedChants: updated));
  }
}
