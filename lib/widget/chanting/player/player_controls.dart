import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/enum/playback_state.dart';
import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

/// Displays transport controls and a non-seekable progress bar for audio playback.
/// Shows the current position and total duration of the chant, and allows
/// users to play/pause, skip tracks, and open the playlist.
class PlayerControls extends StatelessWidget {

  /// Creates a [PlayerControls] widget.
  const PlayerControls({
    required this.chantingState,
    required this.onNextPressed,
    required this.onPlayPausePressed,
    required this.onPreviousPressed,
    required this.onPlaylistPressed,
    super.key,
    this.isNextEnabled = true,
    this.isPreviousEnabled = true,
    this.showProgressBar = true,
    this.showTime = true,
  });

  /// The current state of the chanting player
  final ChantingState chantingState;

  /// Whether the "Next" button should be enabled.
  final bool isNextEnabled;

  /// Whether the "Previous" button should be enabled.
  final bool isPreviousEnabled;

  /// Callback invoked when the user presses the "Next" button.
  final VoidCallback? onNextPressed;

  /// Callback invoked when the user presses the "Play/Pause" button.
  final VoidCallback onPlayPausePressed;

  /// Callback invoked when the user presses the "Previous" button.
  final VoidCallback? onPreviousPressed;

  /// Callback invoked when the user presses the "Playlist" button.
  final VoidCallback onPlaylistPressed;

  /// Whether to show the progress bar above the controls.
  final bool showProgressBar;

  /// Whether to show the current position and total duration text.
  final bool showTime;

  Duration get position => chantingState.position;
  Duration get duration => chantingState.duration;
  bool get isPlaying => chantingState.playbackState == .playing;

  @override
  Widget build(BuildContext context) {
    final Duration safeDuration = duration < Duration.zero
        ? Duration.zero
        : duration;
    final Duration safePosition = position < Duration.zero
        ? Duration.zero
        : position > safeDuration
        ? safeDuration
        : position;

    final double maxMs = safeDuration.inMilliseconds.toDouble();
    final double currentMs = safePosition.inMilliseconds.toDouble();

    final TextStyle? timeTextStyle = context.theme.textTheme.bodyLarge
        ?.copyWith(
          fontFamily: 'RobotoCondensed',
          color: Colors.white70,
          fontWeight: FontWeight.bold,
        );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (showProgressBar) Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: DesignSpec.paddingLg,
            vertical: DesignSpec.paddingLg,
          ),
          child: LinearProgressIndicator(
            value: maxMs == 0 ? 0 : currentMs / maxMs,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
        if (showTime) Padding(
          padding: const EdgeInsets.symmetric(horizontal: DesignSpec.paddingLg),
          child: Row(
            children: <Widget>[
              Text(
                safePosition.formatMss(),
                textAlign: TextAlign.start,
                style: timeTextStyle,
              ),
              const Spacer(),
              Text(
                safeDuration.formatMss(),
                textAlign: TextAlign.end,
                style: timeTextStyle,
              ),
            ],
          ),
        ),
        Gap.medium(),
        buildControlsRow(context),
      ],
    );
  }

  Widget buildControlsRow(BuildContext context) {
    return Row(    
      children: [
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              iconSize: 32,
              onPressed: isPreviousEnabled ? onPreviousPressed : null,
              icon: const Icon(Icons.skip_previous_rounded),
              color: isPreviousEnabled ? Colors.white : Colors.white54,
            ),
            Gap.small(),
            PlayPauseButton(
              isLoading: chantingState.isLoading,
              playbackState: chantingState.playbackState,
              onPressed: onPlayPausePressed
            ),
            Gap.small(),
            IconButton(
              iconSize: 32,
              onPressed: isNextEnabled ? onNextPressed : null,
              icon: const Icon(Icons.skip_next_rounded),
              color: isNextEnabled ? Colors.white : Colors.white54,
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                iconSize: 32,
                onPressed: onPlaylistPressed,
                icon: const Icon(Icons.playlist_play_rounded),
                color: Colors.white,
              ),
            ],
          )
        ),
      ],
    );
    
  }
}


/// Circular play/pause button that can show a loading spinner.
class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    required this.playbackState,
    required this.onPressed,
    required this.isLoading,
    super.key,
    this.backgroundColor = AppColors.red,
    this.iconColor = Colors.white,
    this.size = 42,
    this.disableWhileLoading = true,
  });

  final AudioPlaybackState playbackState;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color iconColor;
  final double size;
  final bool disableWhileLoading;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    final VoidCallback? resolvedOnPressed = disableWhileLoading && isLoading
        ? null
        : onPressed;

    return IconButton.filled(
      iconSize: size,
      onPressed: resolvedOnPressed,
      style: IconButton.styleFrom(backgroundColor: backgroundColor),
      icon: AnimatedSwitcher(
        duration: const Duration(milliseconds: 200),
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        child: isLoading
            ? SizedBox(
                key: const ValueKey<String>('loading'),
                width: size,
                height: size,
                child: CircularProgressIndicator(
                  strokeWidth: 2.4,
                  valueColor: AlwaysStoppedAnimation<Color>(iconColor),
                ),
              )
            : Icon(
                key: ValueKey<AudioPlaybackState>(playbackState),
                playbackState == .playing
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                color: iconColor,
              ),
      ),
    );
  }
}
