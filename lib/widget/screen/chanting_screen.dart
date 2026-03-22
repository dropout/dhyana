import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/model/chanting_settings.dart';
import 'package:dhyana/widget/app_bar/custom_app_bar.dart';
import 'package:dhyana/widget/app_bar/custom_back_button.dart';
import 'package:dhyana/widget/chanting/chanting_player_view.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/app_loading_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChantingScreen extends StatelessWidget {

  final ChantingSettings chantingSettings;

  const ChantingScreen({
    super.key,
    required this.chantingSettings,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChantingCubit>(
      create: (context) => ChantingCubit(
        chantingSettings: chantingSettings,
        audioService: context.services.audioService,
        lyricsService: context.services.lyricsService,
        resourceResolver: context.services.resourceResolver,
        crashlyticsService: context.services.crashlyticsService,
      ),
      child: Builder(
        builder: (context) => buildScaffolding(context),
        )
    );

  }

  Widget buildScaffolding(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        leading: CustomBackButton(),
      ),
      backgroundColor: Colors.black,
      body: BlocBuilder<ChantingCubit, ChantingState>(
        builder: (context, state) {
          return switch (state.playbackState) {
            PlaybackState.loading => AppLoadingDisplay(),
            PlaybackState.error => Center(child: Text('Error loading chant')),
            _ => ChantingPlayerView(
              chantingState: state,
              wakelockService: context.services.wakelockService,
            ),
          };
        }
      )
    );
  }

}

