part of 'home_screen_cubit.dart';

@freezed
sealed class HomeScreenState with _$HomeScreenState {

  const factory HomeScreenState.loading() = HomeScreenStateLoading;
  const factory HomeScreenState.loaded({
    required SessionType sessionType,
  }) = HomeScreenStateLoaded;

  factory HomeScreenState.fromJson(Map<String, Object?> json) =>
    _$HomeScreenStateFromJson(json);

}
