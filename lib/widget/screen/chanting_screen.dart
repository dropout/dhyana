import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/enum/session_type.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:dhyana/model/session.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/app_routes.dart';
import 'package:dhyana/widget/bloc_provider/chanting_bloc_providers.dart';
import 'package:dhyana/widget/chanting/chanting_player_view.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChantingScreen extends StatelessWidget {
  
  final ChantingSettings chantingSettings;

  const ChantingScreen({
    required this.chantingSettings,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChantingBlocProviders(
      chantingSettings: chantingSettings,
      child: buildScaffolding(context),
    );
  }

  Widget buildScaffolding(BuildContext context) {
    return BlocConsumer<ChantingCubit, ChantingState>(
      builder: (context, state) {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(leading: CustomBackButton()),
          backgroundColor: Colors.black,
          body: switch (state.playbackState) {
            PlaybackState.loading => AppLoadingDisplay(),
            PlaybackState.error => Center(child: Text('Error loading chant')),
            _ => ChantingPlayerView(
              chantingState: state,
              wakelockService: context.services.wakelockService,
            ),
          },
        );
      },
      listenWhen: (prevState, currentState) {
        final isCompleted = prevState.playbackState != PlaybackState.completed
          && currentState.playbackState == PlaybackState.completed;
        final isLastChant = currentState.currentIndex == 
          currentState.chantingSettings.selectedChants.length - 1;
        return isCompleted && isLastChant;
      },
      listener: (context, state) {
        final elapsedTime = state.chantingSettings.selectedChants.fold(
          Duration.zero, 
          (total, chant) => total + chant.length
        );
        Session session = Session(
          id: context.services.idGeneratorService.sessionId(),
          type: SessionType.chanting,
          chantingSettings: state.chantingSettings,
          startTime: state.startTime ?? DateTime.now().subtract(elapsedTime),
          endTime: state.endTime ?? DateTime.now(),
          duration: elapsedTime,
        );
        SessionCompletedRoute($extra: session).replace(context);
      },
    );

  }

}
