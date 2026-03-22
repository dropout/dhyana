import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/widget/chanting/player/lyrics_view.dart';
import 'package:dhyana/widget/chanting/player/player_controls.dart';
import 'package:dhyana/widget/chanting/player/playlist_sheet.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Main view for the chanting player, displaying the lyrics and playback controls.
class ChantingPlayerView extends StatelessWidget {

  /// The current state of the chanting player, containing
  /// the lyrics document, playback position, and playback state, etc...
  final ChantingState chantingState;

  /// Creates a [ChantingPlayerView] widget.
  const ChantingPlayerView({
    required this.chantingState,
    super.key
  });

  /// Handles play/pause button press by toggling playback state
  void _onPlayPausePressed(BuildContext context) {  
    if (chantingState.playbackState == PlaybackState.playing) {
      context.read<ChantingCubit>().pause();
    } else {
      context.read<ChantingCubit>().play();
    }
  }

  /// Handles seek action by seeking the chant to the specified position.
  void _onNextPressed(BuildContext context) {
    context.read<ChantingCubit>().next();
  }

  /// Handles previous button press by skipping to the previous chant in the playlist.
  void _onPreviousPressed(BuildContext context) {
    context.read<ChantingCubit>().prev();
  }

  /// Handles playlist button press by opening the playlist bottom sheet.
  void _onPlaylistPressed(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      backgroundColor: AppColors.backgroundPaper,
      showDragHandle: false,
      builder: (bottomSheetContext) => SizedBox(
        height: MediaQuery.of(bottomSheetContext).size.height * 0.75,
        child: PlaylistSheet(
          chantingState: chantingState,
        )
      ),
    );
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
                    Colors.black.withValues(alpha: 0.9),
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
              bottom: DesignSpec.paddingLg,
            ),
            child: PlayerControls(
              position: chantingState.position,
              duration: chantingState.duration,
              isPlaying:
                (chantingState.playbackState == PlaybackState.playing),
              onNextPressed: () => _onNextPressed(context),
              onPlayPausePressed: () => _onPlayPausePressed(context),
              onPreviousPressed: () => _onPreviousPressed(context),
              onPlaylistPressed: () => _onPlaylistPressed(context),
            ),
          ),
        ),
      ],
    );
  }

}
