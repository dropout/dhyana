import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/widget/chanting/player/lyrics_view.dart';
import 'package:dhyana/widget/chanting/player/player_controls.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChantingPlayerView extends StatelessWidget {

  final ChantingState chantingState;

  const ChantingPlayerView({
    required this.chantingState,
    super.key
  });

  void _onPlayPausePressed(BuildContext context) {
    if (chantingState.playbackState == PlaybackState.playing) {
      context.read<ChantingCubit>().pause();
    } else {
      context.read<ChantingCubit>().play();
    }
  }

  void _onSeek(BuildContext context, Duration position) {
    context.read<ChantingCubit>().seek(position);
  }

  void _onNextPressed(BuildContext context) {
    context.read<ChantingCubit>().next();
  }

  void _onPreviousPressed(BuildContext context) {
    context.read<ChantingCubit>().prev();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [        
        LyricsView(chantingState: chantingState),
        Positioned(
          left: 0,
          bottom: 0,
          right: 0,
          child: buildControls(context),
        )
      ],
    );
  }

  Widget buildControls(BuildContext context) {
    return Stack(
      children: [


        Positioned.fill(
          child: IgnorePointer(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.8),
                  ],
                  stops: const [0.0, 0.5],
                ),
              ),
            ),
          ),
        ),

        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: DesignSpec.padding2Xl,
              left: DesignSpec.paddingLg,
              right: DesignSpec.paddingLg,
            ),
            child: PlayerControls(
              position: chantingState.position,
              duration: chantingState.duration,
              isPlaying:
                (chantingState.playbackState == PlaybackState.playing),
              onNextPressed: () => _onNextPressed(context),
              onPlayPausePressed: () => _onPlayPausePressed(context),
              onPreviousPressed: () => _onPreviousPressed(context),
              onSeek: (Duration position) => _onSeek(context, position),
            ),
          ),
        ),
      ],
    );
  }

}
