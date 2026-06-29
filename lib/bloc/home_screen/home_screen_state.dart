part of 'home_screen_cubit.dart';

@freezed
sealed class HomeScreenState with _$HomeScreenState {
  const HomeScreenState._();
  const factory HomeScreenState({
    @Default(SessionType.timer) SessionType sessionType,
  }) = _HomeScreenState;
}
