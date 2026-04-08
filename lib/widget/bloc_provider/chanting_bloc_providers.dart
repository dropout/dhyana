import 'package:dhyana/bloc/auth/auth_bloc.dart';
import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/bloc/presence/presence_cubit.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:dhyana/service/chanting_audio_service.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChantingBlocProviders extends StatelessWidget {

  final Widget child;
  final ChantingSettings chantingSettings;

  const ChantingBlocProviders({
    required this.child,
    required this.chantingSettings,
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

        return MultiBlocProvider(
          providers: [
            BlocProvider<ChantingCubit>(
              create: (context) => ChantingCubit(
                chantingSettings: chantingSettings,
                audioService: ChantingAudioService(services.audioHandler),
                lyricsService: services.lyricsService,
                resourceResolver: services.resourceResolver,
                crashlyticsService: services.crashlyticsService,
              ),
            ),

            BlocProvider<PresenceCubit>(
              create: (_) {
                // Create the presence bloc
                final presenceBloc = PresenceCubit(
                  presenceRepository: repos.presenceRepository,
                  profileRepository: repos.profileRepository,
                  crashlyticsService: services.crashlyticsService,
                );

                // Show the presence if user is signed in
                if (isSignedIn && profileId != null) {
                  presenceBloc.showPresence(profileId);
                }
                return presenceBloc;
              },
              lazy: false,
            ),
          ],
          child: child,
        );
      },
    );
  }
}
