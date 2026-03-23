import 'dart:convert';

import 'package:dhyana/enum/shared_preferences_key.dart';
import 'package:dhyana/model/timer_settings.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/service/shared_preferences_service.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';
part 'home_screen_cubit.g.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {

  final SharedPreferencesService sharedPreferencesService;
  final CrashlyticsService crashlyticsService;

  HomeScreenCubit({
    required this.sharedPreferencesService,
    required this.crashlyticsService,
  }) : super(const HomeScreenState.loading());

  Future<void> init(TimerSettings? timerSettings) async {
    if (timerSettings != null) {
      setSessionType(SessionType.timer);
      emit(HomeScreenState.loaded(
        sessionType: SessionType.timer,
        timerSettings: timerSettings
      ));
    } else {
      try {
        final homeScreenState = await _loadStateFromSharedPreferences();
        emit(homeScreenState);
      } catch (e, stackTrace) {
        emit(HomeScreenState.loaded(sessionType: SessionType.timer));
        crashlyticsService.recordError(
          exception: e,
          stackTrace: stackTrace,
          reason: 'Failed to load HomeScreenState from SharedPreferences during init',
        );
      }
    }
  }

  Future<void> loadState() async {
    try {
      final homeScreenState = await _loadStateFromSharedPreferences();
      emit(homeScreenState);
    } catch (e, stackTrace) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stackTrace,
        reason: 'Failed to load HomeScreenState from SharedPreferences',
      );
      emit(HomeScreenState.loaded(
        // timerSettings: ,
        sessionType: SessionType.timer
      ));
    }
  }

  Future<void> setSessionType(SessionType sessionType) async {
    try {
      final currentState = state;
      if (currentState is HomeScreenStateLoaded) {
        final updatedState = currentState.copyWith(sessionType: sessionType);
        emit(updatedState);
        _saveStateToSharedPreferences(updatedState);
      }
    } catch (e, stackTrace) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stackTrace,
        reason: 'Failed to update session type and save HomeScreenState to SharedPreferences',
      );
    }
  }

  Future<void> toggleSessionType() async {
    try {
      final currentState = state;
      if (currentState is HomeScreenStateLoaded) {
        final newSessionType = currentState.sessionType == SessionType.timer
          ? SessionType.chanting
          : SessionType.timer;
        final updatedState = currentState.copyWith(sessionType: newSessionType);
        emit(updatedState);
        _saveStateToSharedPreferences(updatedState);
      }
    } catch (e, stackTrace) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stackTrace,
        reason: 'Failed to toggle session type and save HomeScreenState to SharedPreferences',
      );
    }
  }

  Future<HomeScreenState> _loadStateFromSharedPreferences() async {
    final jsonString = await sharedPreferencesService.get<String>(
      key: SharedPreferencesKey.homeScreenState);
    Map<String, Object?> json = jsonString != null ? Map<String,
      Object?>.from(jsonDecode(jsonString)) : {};
    return HomeScreenState.fromJson(json);
  }

  Future<void> _saveStateToSharedPreferences(HomeScreenState state) async {
    final jsonString = jsonEncode(state.toJson());
    await sharedPreferencesService.set(
      key: SharedPreferencesKey.homeScreenState,
      value: jsonString,
    );
  }


}
