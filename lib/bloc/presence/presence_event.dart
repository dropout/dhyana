part of 'presence_bloc.dart';

@freezed
sealed class PresenceEvent with _$PresenceEvent {

  const PresenceEvent._();

  const factory PresenceEvent.load({
    String? ownProfileId,
  }) = LoadPresenceData;

  const factory PresenceEvent.showPresence() = ShowPresence;

}
