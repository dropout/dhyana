part of 'presence_cubit.dart';

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
