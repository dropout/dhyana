part of 'presence_bloc.dart';

@freezed
sealed class PresenceEvent with _$PresenceEvent {

  const PresenceEvent._();

  /// Loads presence data from backend, replaces existing data in the bloc.
  /// If [ownProfileId] is provided, it will be used to filter that specific
  /// profile from the list of presence documents.
  const factory PresenceEvent.load({
    String? ownProfileId,
    @Default(60) int intervalInMinutes,
    @Default(18) int batchSize,
  }) = LoadPresenceData;

  /// Loads more presence data from backend and
  /// appends it to existing data.
  const factory PresenceEvent.loadMore({
    required String lastDocumentId,
    @Default(60) int intervalInMinutes,
    @Default(18) int batchSize,
  }) = LoadMorePresenceData;

  /// Signals backend to show presence for a profile
  const factory PresenceEvent.showPresence({
    required String profileId,
  }) = ShowPresence;

}
