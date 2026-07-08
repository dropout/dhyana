import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/bloc/presence/presence_cubit.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:dhyana/service/chanting_audio_service.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Provides the necessary context for chanting sessions, 
/// including the chanting cubit and presence cubit.
class ChantingContext extends StatelessWidget {

  final Widget child;
  final ChantingSettings chantingSettings;
  final void Function(ChantingCubit, PresenceCubit)? onCreate;

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

    return BlocBuilder<AuthCubit, AuthState>(
      builder: (BuildContext context, AuthState authState) {
        final bool isSignedIn = (authState is AuthStateSignedIn);
        final String? profileId = (isSignedIn) ? authState.user.uid : null;

        final chantingCubit = ChantingCubit(
          chantingSettings: chantingSettings,
          audioService: ChantingAudioService(services.audioHandler),
          lyricsService: services.lyricsService,
          resourceResolver: services.resourceResolver,
          chantPlaybackRepository: repos.chantPlaybackRepository,
          crashlyticsService: services.crashlyticsService,
        );

        final presenceCubit = PresenceCubit(
          presenceRepository: repos.presenceRepository,
          profileRepository: repos.profileRepository,
          crashlyticsService: services.crashlyticsService,
        );

        if (isSignedIn && profileId != null) {
          presenceCubit.showPresence(profileId);
        }

        onCreate?.call(chantingCubit, presenceCubit);

        return MultiBlocProvider(
          providers: [
            BlocProvider<ChantingCubit>(
              create: (_) => chantingCubit,
            ),
            BlocProvider<PresenceCubit>(
              create: (_) => presenceCubit,
            ),
          ],
          child: child,
        );
      },
    );
  }
}
