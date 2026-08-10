import 'package:dhyana/core/domain/enum/home_screen_view_state.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'home_screen_cubit.freezed.dart';

@freezed
sealed class HomeScreenState with _$HomeScreenState {
  const HomeScreenState._();
  const factory HomeScreenState({
    @Default(HomeScreenViewState.sitting) HomeScreenViewState sessionType,
  }) = _HomeScreenState;
}


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
        final sessionType = HomeScreenViewState.values.byName(json['sessionType'] as String);
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

  Future<void> setSessionType(HomeScreenViewState sessionType) async {
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
      final newSessionType = state.sessionType == HomeScreenViewState.sitting
        ? HomeScreenViewState.chanting
        : HomeScreenViewState.sitting;
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
