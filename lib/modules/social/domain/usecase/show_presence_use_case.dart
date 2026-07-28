import 'package:dhyana/core/domain/entity/presence/presence.dart';
import 'package:dhyana/core/domain/entity/presence/public_profile.dart';
import 'package:dhyana/core/domain/entity/profile/profile.dart';
import 'package:dhyana/core/domain/repository/auth_repository.dart';
import 'package:dhyana/core/domain/repository/presence_repository.dart';
import 'package:dhyana/core/domain/repository/profile_repository.dart';
import 'package:dhyana/util/logger_mixin.dart';

/// Use case for showing current user presence.
class ShowPresenceUseCase with LoggerMixin {

  final PresenceRepository presenceRepository;
  final ProfileRepository profileRepository;
  final AuthRepository authRepository;

  ShowPresenceUseCase({
    required this.presenceRepository,
    required this.profileRepository,
    required this.authRepository,
  });

  Future<void> execute(String profileId) async {

    // TODO: Consider not signed in use case

    Profile profile = await profileRepository.read(profileId);
    if (profile.completed) {
      await presenceRepository.showPresence(
        Presence(
          id: profile.id,
          profile: PublicProfile.fromProfile(profile: profile),
          startedAt: DateTime.now(),
          location: profile.location,
        ),
      );
      logger.t('Showing presence.');
    } else {
      logger.t('User is signed in but profile is incomplete, NOT showing presence.');
    }
  }
}