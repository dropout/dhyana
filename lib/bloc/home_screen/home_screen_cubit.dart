import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'home_screen_state.dart';
part 'home_screen_cubit.freezed.dart';

class HomeScreenCubit extends HydratedCubit<HomeScreenState> {
  final HomeScreenState? initialState;
  final CrashlyticsService crashlyticsService;

  HomeScreenCubit({
    this.initialState,
    required this.crashlyticsService,
  }) : super(initialState ?? HomeScreenState());

  @override
  HomeScreenState? fromJson(Map<String, dynamic> json) {
    try {
      if (initialState != null) {
        return initialState;
      } else {
        final sessionType = SessionType.values.byName(json['sessionType'] as String);
        return HomeScreenState(sessionType: sessionType);
      }
    } catch (e, stack) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stack,
        reason: 'Failed to deserialize HomeScreenState from JSON',
      );
      return null;
    }
  }

  @override
  Map<String, dynamic> toJson(HomeScreenState state) {
    return {
      'sessionType': state.sessionType.name,
    };
  }  

  Future<void> setSessionType(SessionType sessionType) async {
    try {
      final updatedState = state.copyWith(sessionType: sessionType);
      emit(updatedState);
    } catch (e, stackTrace) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stackTrace,
        reason:
            'Failed to update session type and save HomeScreenState to SharedPreferences',
      );
    }
  }

  Future<void> toggleSessionType() async {
    try {
      final newSessionType = state.sessionType == SessionType.sitting
        ? SessionType.chanting
        : SessionType.sitting;
      final updatedState = state.copyWith(sessionType: newSessionType);
      emit(updatedState);
    } catch (e, stackTrace) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stackTrace,
        reason:
            'Failed to toggle session type and save HomeScreenState to SharedPreferences',
      );
    }
  }

}
