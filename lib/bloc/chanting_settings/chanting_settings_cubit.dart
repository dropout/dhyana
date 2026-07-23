import 'dart:convert';

import 'package:dhyana/core/domain/enum/shared_preferences_key.dart';
import 'package:dhyana/service/shared_preferences_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:uuid/uuid.dart';
import 'package:dhyana/model/chant.dart';
import 'package:dhyana/repository/chants_repository.dart';
import 'package:dhyana/core/domain/service/crashlytics_service.dart';
import 'package:dhyana/util/logger_mixin.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chanting_settings_state.dart';
part 'chanting_settings_cubit.freezed.dart';

/// A Cubit that manages the state of the chanting settings.
/// Enables adding new chants, removing chants, and reordering the chants
/// in the playlist.
class ChantingSettingsCubit extends Cubit<ChantingSettingsState>
    with LoggerMixin {
  
  /// The repository for fetching available chants.
  final ChantsRepository chantsRepository;

  /// The service for interacting with shared preferences.
  final SharedPreferencesService sharedPreferencesService;

  /// The service for logging errors to Crashlytics.
  final CrashlyticsService crashlyticsService;

  /// Creates a new instance of [ChantingSettingsCubit].
  ChantingSettingsCubit({
    required this.chantsRepository,
    required this.sharedPreferencesService,
    required this.crashlyticsService,
  }) : super(ChantingSettingsState.initial()) {
    _initialize();
  }

  /// Initializes the Cubit by loading the playlist chant IDs from shared preferences
  /// and fetching the available chants from the repository.
  /// It then creates the playlist based on the loaded chant IDs and available chants.
  Future<void> _initialize() async {
    try {
      logger.t('Initializing ChantingSettingsCubit');

      // Load the playlist chant IDs from shared preferences
      final List<String> playlistChantIds = await _loadPlaylistChantIds();

      // Fetch all available chants from the repository
      final List<Chant> freshChantList = await chantsRepository.queryAll();

      // Create the playlist based on the loaded chant IDs and available chants
      final List<ChantViewModel> playlist = <ChantViewModel>[];
      for (final chantId in playlistChantIds) {
        try {
          final chant = freshChantList.firstWhere((c) => c.id == chantId);
          playlist.add(ChantViewModel(
            uniqueId: Uuid().v4(),
            chant: chant,
          ));
        } catch (e) {
          // Chant not found in network data, skip
          logger.t('Chant with ID $chantId not found in available chants, skipping');
        }
      }

      emit(state.copyWith(playlist: playlist, isLoading: false));
      logger.t('Restored playlist with ${playlist.length} chants from shared preferences');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to initialize ChantingSettingsCubit',
      );
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// Loads the available chants from the repository and updates the state.
  /// It also sorts the chants based on their order property.
  Future<void> loadAvailableChants() async {
    try {
      logger.t('Loading available chants');
      emit(state.copyWith(isLoading: true, error: null));

      final chants = (await chantsRepository.queryAll())
        ..sort((a, b) => a.order.compareTo(b.order));

      emit(
        state.copyWith(
          availableChants: chants,
          isLoading: false,
        ),
      );
      logger.t('Successfully loaded ${chants.length} chants');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to load available chants',
      );
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  /// Adds a chant to the playlist.
  void addToPlaylist(Chant chant) {
    try {
      logger.t('Adding chant ${chant.name} to playlist');
      final ChantViewModel chantViewModel = ChantViewModel(
        uniqueId: Uuid().v4(),
        chant: chant,
      );

      final updated = List<ChantViewModel>.from(state.playlist)
        ..add(chantViewModel);
      emit(state.copyWith(playlist: updated));
      _savePlaylistChantIds(updated.map((c) => c.chant.id).toList());
      logger.t('Successfully added chant ${chant.name} to playlist');
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to add chant ${chant.name} to playlist',
      );
    }
  }

  /// Removes a chant from the playlist at the specified [index].
  void removeFromPlaylist(int index) {

    try {
      // Check if the index is valid
      if (index < 0 || index >= state.playlist.length) {
        logger.t('Invalid index $index for selected chants');
        return;
      }

      // Get the chant to be removed for logging purposes
      final targetChantViewModel = state.playlist[index];
      final updated = List<ChantViewModel>.from(state.playlist)
        ..removeAt(index);
          
      // Save the updated list of playlist chant IDs to shared preferences    
      _savePlaylistChantIds(updated.map((c) => c.chant.id).toList());

      emit(state.copyWith(playlist: updated));

      logger.t(
        'Removed chant ${targetChantViewModel.chant.name} at index $index from selected chants',
      );    
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to remove chant at index $index from playlist',
      );
    }    
  }

  /// Reorders the chant list by removing the element at [oldIndex] and inserting
  /// it at [newIndex]. Bounds are clamped so accidental out-of-range inputs from
  /// the UI do not crash the app.
  void reorderPlaylist(int oldIndex, int newIndex) {

    try {      
      // Check if the selected chants list is empty
      if (state.playlist.isEmpty) {
        logger.t('Selected chants list is empty, cannot reorder');
        return;
      }

      final int safeOldIndex = oldIndex.clamp(0, state.playlist.length - 1);
      final int safeNewIndex = newIndex.clamp(0, state.playlist.length - 1);

      // If the old index and new index are the same, no reordering is needed
      if (safeOldIndex == safeNewIndex) {
        return;
      }

      // Create a copy of the selected chants list to modify
      final updatedSelectedChants = List<ChantViewModel>.from(
        state.playlist,
      );

      // Remove the chant at the old index and insert it at the new index
      final movedChant = updatedSelectedChants.removeAt(safeOldIndex);
      updatedSelectedChants.insert(safeNewIndex, movedChant);
      
      // Save the updated list of playlist chant IDs to shared preferences
      _savePlaylistChantIds(updatedSelectedChants.map((c) => c.chant.id).toList());

      emit(state.copyWith(playlist: updatedSelectedChants));
      
      logger.t(
        'Reordering indices: oldIndex=$safeOldIndex, newIndex=$safeNewIndex',
      );    

    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to reorder playlist from index $oldIndex to $newIndex',
      );
    }

    
  }

  /// Loads the playlist chant IDs from shared preferences and returns 
  /// them as a list of strings.
  Future<List<String>> _loadPlaylistChantIds() async {
    try {
      final jsonString = await sharedPreferencesService.get<String>(
        key: SharedPreferencesKey.selectedChants,
      );
      if (jsonString == null || jsonString.isEmpty) {
        return [];
      }
      final dynamic decoded = jsonDecode(jsonString);
      final List<String> jsonList = (decoded as List<dynamic>).cast<String>();
      return jsonList;
    } catch (e, st) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: st,
        reason:
            'Failed to load selected chants from shared preferences, returning empty list',
      );
      return [];
    }
  }

  /// Saves the playlist chant IDs to shared preferences as a JSON string.
  Future<void> _savePlaylistChantIds(List<String> selectedChantIds) async {
    final jsonString = jsonEncode(selectedChantIds);
    await sharedPreferencesService.set(
      key: SharedPreferencesKey.selectedChants,
      value: jsonString,
    );
  }

}
