import 'package:dhyana/core/domain/enum/home_screen_view_state.dart';
import 'package:dhyana/core/service/crashlytics_service.dart';
import 'package:dhyana/core/util/logger_mixin.dart';
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

class HomeScreenCubit extends HydratedCubit<HomeScreenState> with LoggerMixin {
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
        logger.t('Using initial state for HomeScreenCubit: $initialState');
        return initialState;
      } else {
        final sessionType = HomeScreenViewState.values.byName(json['sessionType'] as String);
        logger.t('Restored HomeScreenCubit state from JSON: $sessionType');
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
    logger.t('Saving HomeScreenCubit state: $state');
    return {
      'sessionType': state.sessionType.name,
    };
  }  

  Future<void> setSessionType(HomeScreenViewState sessionType) async {
    try {
      final updatedState = state.copyWith(sessionType: sessionType);
      emit(updatedState);
      logger.t('New session type has been set: $sessionType');
    } catch (e, stackTrace) {
      crashlyticsService.recordError(
        exception: e,
        stackTrace: stackTrace,
        reason:
            'Failed to update session type and save HomeScreenState to SharedPreferences',
      );
    }
  }

}
