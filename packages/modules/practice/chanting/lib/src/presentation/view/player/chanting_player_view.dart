import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/presentation/view/player/lyrics_effects_config.dart';
import 'package:chanting/src/presentation/viewmodel/chanting_cubit.dart';
import 'package:core/core.dart';
import 'package:chanting/src/presentation/view/player/lyrics_view.dart';
import 'package:chanting/src/presentation/view/player/player_controls.dart';
import 'package:chanting/src/presentation/view/player/playlist_sheet.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Main view for the chanting player,
/// displaying the lyrics and playback controls.
class ChantingPlayerView extends StatefulWidget {
  /// The current state of the chanting player, containing
  /// the lyrics document, playback position, and playback state, etc...
  final ChantingStateEntity chantingState;

  /// Service to manage wakelock during chanting sessions.
  final WakelockService wakelockService;

  /// Creates a [ChantingPlayerView] widget.
  const ChantingPlayerView({
    required this.chantingState,
    required this.wakelockService,
    super.key,
  });

  @override
  State<ChantingPlayerView> createState() => _ChantingPlayerViewState();
}

class _ChantingPlayerViewState extends State<ChantingPlayerView>
    with WidgetsBindingObserver {
  @override
  void initState() {
    widget.wakelockService.enable();
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    widget.wakelockService.disable();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Handles play/pause button press by toggling playback state
  void _onPlayPausePressed(BuildContext context) {
    if (widget.chantingState.playbackState.playing == true) {
      context.read<ChantingCubit>().pause();
    } else {
      context.read<ChantingCubit>().play();
    }
    context.hapticsTap();
  }

  /// Skip to next track
  void _onNextPressed(BuildContext context) {
    context.read<ChantingCubit>().next();
    context.hapticsTap();
  }

  /// Go to previous track
  void _onPreviousPressed(BuildContext context) {
    context.read<ChantingCubit>().prev();
    context.hapticsTap();
  }

  /// Handles playlist button press by opening the playlist bottom sheet.
  void _onPlaylistPressed(BuildContext context) {
    // Forward the chanting cubit to the bottom sheet context
    final chantingCubit = context.read<ChantingCubit>();
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      useSafeArea: true,
      backgroundColor: AppColors.backgroundPaper,
      showDragHandle: false,
      builder: (bottomSheetContext) => BlocProvider.value(
        value: chantingCubit,
        child: SizedBox(
          height: MediaQuery.of(bottomSheetContext).size.height * 0.75,
          child: PlaylistSheet(),
        ),
      ),
    );
    context.hapticsTap();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [

        AnimatedSwitcher(
          duration: Durations.long4,          
          child: switch (widget.chantingState.loadingState) {
            .processing => buildLoadingView(context),
            .error => buildErrorView(context),
            _ => buildLyricsView(context),
          },              
        ),

        Positioned(left: 0, bottom: 0, right: 0, child: buildControls(context)),
      ],
    );
  }

  Widget buildLoadingView(BuildContext context) {
    return Column(
      key: const ValueKey('chanting_player_loading_view'),
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Preparing your session...',
          style: context.theme.textTheme.bodyLarge?.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Gap.large(),
        // FractionallySizedBox(
        //   widthFactor: 0.66,
        //   child: LinearProgressIndicator(
        //     backgroundColor: Colors.grey.shade600,            
        //     color: Colors.white,
        //     value: widget.chantingState.cachingProgress.progress,
        //   ),
        // ),
      ],
    );
  }

  Widget buildErrorView(BuildContext context) => AppErrorDisplay(
    key: const ValueKey('chanting_player_error_view'),
  );

  Widget buildLyricsView(BuildContext context) {
    return LayoutBuilder(
      key: const ValueKey('chanting_player_lyrics_view'),
      builder: (context, constraints) {
        return LyricsView(
          chantingState: widget.chantingState,
          maxWidth: constraints.maxWidth,
          effects: const LyricsEffectsConfig(
            scale: false,
            maxBlurSigma: 5,
            blurSigmaPerLine: 0.4,
            wormDuration: Durations.extralong4,
            minOpacity: 0.1,
            opacityFalloffPerLine: 0.15,
            transitionDuration: Durations.medium4,
          ),
        );
      },
    );
  }

  Widget buildControls(BuildContext context) {
    return Stack(
      children: [
        SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              top: DesignSpec.padding2Xl,
              left: DesignSpec.paddingLg,
              right: DesignSpec.paddingLg,
              bottom: DesignSpec.paddingLg,
            ),
            child: buildPlayerControls(context),
          ),
        ),
      ],
    );
  }

  Widget buildPlayerControls(BuildContext context) {
    final chantingState = widget.chantingState;
    return PlayerControls(
      chantingState: chantingState,
      onNextPressed:
          chantingState.currentIndex <
              chantingState.chantingSettings.selectedChants.length - 1
          ? () => _onNextPressed(context)
          : null,
      onPlayPausePressed: () => _onPlayPausePressed(context),
      onPreviousPressed: widget.chantingState.currentIndex > 0
          ? () => _onPreviousPressed(context)
          : null,
      onPlaylistPressed: () => _onPlaylistPressed(context),
    );
  }
}

/// Fullscreen overlay shown between chanting playlist items during the gap countdown.
// class _GapCountdownOverlay extends StatelessWidget {
//   final ChantingState chantingState;

//   const _GapCountdownOverlay({required this.chantingState, super.key});

//   @override
//   Widget build(BuildContext context) {
//     final seconds = chantingState.isGapActive
//         ? chantingState.remainingSeconds
//         : chantingState.chantingSettings.gapLength.inSeconds;

//     return ColoredBox(
//       color: Colors.black.withValues(alpha: 0.6),
//       child: Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Text(
//               style: const TextStyle(color: Colors.white70, fontSize: 16),
//             ),
//             Gap.medium(),
//             AnimatedSwitcher(
//               duration: Durations.medium1,
//               switchInCurve: Curves.easeInExpo,
//               switchOutCurve: Curves.easeOutExpo,
//               child: Text(
//                 '$seconds',
//                 key: ValueKey(seconds),
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontSize: 64,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
