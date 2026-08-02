import 'package:dhyana/modules/practice/chanting/presentation/viewmodel/chanting/chanting_cubit.dart';
import 'package:dhyana/core/domain/entity/chant/chanting_settings.dart';
import 'package:dhyana/modules/practice/chanting/domain/service/chanting_audio_service.dart';
import 'package:dhyana/core/presentation/view/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Provides the necessary context for chanting sessions, 
/// including the chanting cubit and presence cubit.
class ChantingContext extends StatelessWidget {

  final Widget child;
  final ChantingSettings chantingSettings;
  final void Function(ChantingCubit)? onCreate;

  const ChantingContext({
    required this.child,
    required this.chantingSettings,
    this.onCreate,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final services = context.services;
    final repos = context.repos;

        // TODO: Show presence for chanting sessions
        final chantingCubit = ChantingCubit(
          chantingSettings: chantingSettings,
          audioService: ChantingAudioService(services.audioHandler),
          lyricsService: services.lyricsService,
          chantPlaybackRepository: repos.chantPlaybackRepository,
          crashlyticsService: services.crashlyticsService,
        );

        // final presenceCubit = PresenceCubit(
        //   loadPresenceDataUseCase: LoadPresenceDataUseCase(
        //     presenceRepository: repos.presenceRepository,
        //   ),
        //   loadMorePresenceDataUseCase: LoadMorePresenceDataUseCase(
        //     presenceRepository: repos.presenceRepository,
        //   ),
        //   showPresenceUseCase: ShowPresenceUseCase(
        //     presenceRepository: repos.presenceRepository,
        //     profileRepository: repos.profileRepository,
        //   ),
        //   crashlyticsService: services.crashlyticsService,
        // );

        // if (isSignedIn && profileId != null) {
        //   presenceCubit.showPresence(profileId);
        // }

        onCreate?.call(chantingCubit);

        return BlocProvider<ChantingCubit>(
          create: (_) => chantingCubit,
          child: child,
        );
    //   },
    // );
  }
}
