import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/core/domain/service/wakelock_service.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/chanting/player/lyrics_view.dart';
import 'package:dhyana/widget/chanting/player/player_controls.dart';
import 'package:dhyana/widget/chanting/player/playlist_sheet.dart';
import 'package:dhyana/core/presentation/design_spec.dart';
import 'package:dhyana/widget/util/app_error_display.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Main view for the chanting player,
/// displaying the lyrics and playback controls.
class ChantingPlayerView extends StatefulWidget {
  /// The current state of the chanting player, containing
  /// the lyrics document, playback position, and playback state, etc...
  final ChantingState chantingState;

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
        Positioned.fill(
          child: switch (widget.chantingState.loadingState) {
            .loading => buildLoadingView(context),
            .error => AppErrorDisplay(),
            _ => buildLyricsView(context),
          },

          // child: buildLyricsView(context),

          // child: AnimatedCrossFade(
          //   firstChild: buildLyricsView(context),
          //   secondChild: _GapCountdownOverlay(
          //     key: ValueKey('second'),
          //     chantingState: widget.chantingState,
          //   ),
          //   crossFadeState:
          //       widget.chantingState.isGapActive &&
          //         !widget.chantingState.isLoading
          //       ? CrossFadeState.showSecond
          //       : CrossFadeState.showFirst,
          //   duration: Durations.medium1,
          //   layoutBuilder: (topChild, topKey, bottomChild, bottomKey) {
          //     return Stack(
          //       clipBehavior: Clip.none,
          //       children: [
          //         Positioned(
          //           key: bottomKey,
          //           // We use alignment to ensure the outgoing widget
          //           // doesn't try to expand to infinite height
          //           child: bottomChild,
          //         ),
          //         Positioned(key: topKey, child: topChild),
          //       ],
          //     );
          //   },
          // ),
        ),
        Positioned(left: 0, bottom: 0, right: 0, child: buildControls(context)),
      ],
    );
  }

  Widget buildLoadingView(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Preparing chants assets... ${widget.chantingState.cachingProgress.completedTasks} / ${widget.chantingState.cachingProgress.totalTasks}',
          style: context.theme.textTheme.bodyMedium?.copyWith(color: Colors.white)
        ),
        Gap.small(),
        FractionallySizedBox(
          widthFactor: 0.75,
          // padding: const EdgeInsets.all(DesignSpec.paddingLg),
          child: LinearProgressIndicator(
            backgroundColor: Colors.grey.shade600,
            color: Colors.white,
            value: widget.chantingState.cachingProgress.progress,
          ),
        ),    
      ]
    );
  }

  Widget buildLyricsView(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return LyricsView(
          chantingState: widget.chantingState,
          maxWidth: constraints.maxWidth,
        );
      },
    );
  }

  Widget buildControls(BuildContext context) {
    return Stack(
      children: [
        // Gradient behind the controls to improve readability
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
//               context.l10n.chantingNextChantIn,
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
