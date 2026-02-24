import 'dart:convert';

import 'package:dhyana/enum/shared_preferences_key.dart';
import 'package:dhyana/service/shared_preferences_service.dart';
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
  final SharedPreferencesService sharedPreferencesService;
  final CrashlyticsService crashlyticsService;

  ChantingSettingsCubit({
    required this.chantsRepository,
    required this.sharedPreferencesService,
    required this.crashlyticsService,
  }) : super(ChantingSettingsState.initial());

  Future<void> loadAvailableChants() async {
    try {
      logger.t('Loading available chants');
      emit(state.copyWith(isLoading: true, error: null));

      final chants = await chantsRepository.queryAll();
      final selectedChants = await _loadSelectedChantsFromSharedPrefs();

      emit(state.copyWith(
        availableChants: chants,
        selectedChants: selectedChants,
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

  void addToSelectedChants(Chant chant) {
    final updated = List<Chant>.from(state.selectedChants)..add(chant);
    emit(state.copyWith(selectedChants: updated));
    _saveSelectedChantsToSharedPrefs(updated);
  }

  /// Reorders the chant list by removing the element at [oldIndex] and inserting
  /// it at [newIndex]. Bounds are clamped so accidental out-of-range inputs from
  /// the UI do not crash the app.
  void reorderSelectedChants(int oldIndex, int newIndex) {
    if (state.selectedChants.isEmpty) {
      return;
    }

    final int safeOldIndex = oldIndex.clamp(0, state.selectedChants.length - 1);
    final int safeNewIndex = newIndex.clamp(0, state.selectedChants.length - 1);

    if (safeOldIndex == safeNewIndex) {
      return;
    }

    final updatedSelectedChants = List<Chant>.from(state.selectedChants);
    final movedChant = updatedSelectedChants.removeAt(safeOldIndex);
    updatedSelectedChants.insert(safeNewIndex, movedChant);

    emit(state.copyWith(selectedChants: updatedSelectedChants));
    _saveSelectedChantsToSharedPrefs(updatedSelectedChants);
  }

  Future<List<Chant>> _loadSelectedChantsFromSharedPrefs() async {
    final jsonString = await sharedPreferencesService.get<String>(
      key: SharedPreferencesKey.selectedChants,
    );

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((json) => Chant.fromJson(json)).toList();
  }

  Future<void> _saveSelectedChantsToSharedPrefs(List<Chant> selectedChants) async {
    final jsonString = jsonEncode(
      selectedChants.map((chant) => chant.toJson()).toList()
    );
    await sharedPreferencesService.set(
      key: SharedPreferencesKey.selectedChants,
      value: jsonString,
    );
  }

}
