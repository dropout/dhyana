import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/service/wakelock_service.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/chanting/player/lyrics_view.dart';
import 'package:dhyana/widget/chanting/player/player_controls.dart';
import 'package:dhyana/widget/chanting/player/playlist_sheet.dart';
import 'package:dhyana/widget/design_spec.dart';
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
    if (widget.chantingState.playbackState == PlaybackState.playing) {
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
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned.fill(
          child: AnimatedCrossFade(
            firstChild: buildLyricsView(context),
            secondChild: _GapCountdownOverlay(
              key: ValueKey('second'),
              chantingState: widget.chantingState,
            ),
            crossFadeState:
                widget.chantingState.isGapActive &&
                  !widget.chantingState.isLoading
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: Durations.medium1,
            layoutBuilder: (topChild, topKey, bottomChild, bottomKey) {
              return Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    key: bottomKey,
                    // We use alignment to ensure the outgoing widget
                    // doesn't try to expand to infinite height
                    child: bottomChild,
                  ),
                  Positioned(key: topKey, child: topChild),
                ],
              );
            },
          ),
        ),
        Positioned(left: 0, bottom: 0, right: 0, child: buildControls(context)),
      ],
    );
  }

  Widget buildLyricsView(BuildContext context) {
    if (widget.chantingState.isLoading) {
      return SizedBox.shrink();
    } else {
      return LyricsView(
        chantingState: widget.chantingState,
        key: ValueKey('lyrics'),
      );
    }
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
    if (chantingState.isGapActive) {
      return PlayerControls(
        chantingState: chantingState,
        onNextPressed: () => _onNextPressed(context),
        onPreviousPressed: () => _onPreviousPressed(context),
        onPlayPausePressed: () => _onPlayPausePressed(context),
        onPlaylistPressed: () => _onPlaylistPressed(context),
        showProgressBar: false,
        showTime: false,
      );
    } else {
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
}

/// Fullscreen overlay shown between chanting playlist items during the gap countdown.
class _GapCountdownOverlay extends StatelessWidget {
  final ChantingState chantingState;

  const _GapCountdownOverlay({required this.chantingState, super.key});

  @override
  Widget build(BuildContext context) {
    final seconds = chantingState.isGapActive
        ? chantingState.remainingSeconds
        : chantingState.chantingSettings.gapLength.inSeconds;

    return ColoredBox(
      color: Colors.black.withValues(alpha: 0.6),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              context.l10n.chantingNextChantIn,
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
            Gap.medium(),
            AnimatedSwitcher(
              duration: Durations.medium1,
              switchInCurve: Curves.easeInExpo,
              switchOutCurve: Curves.easeOutExpo,
              child: Text(
                '$seconds',
                key: ValueKey(seconds),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 64,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
