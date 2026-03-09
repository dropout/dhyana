import 'package:dhyana/util/duration.dart';
import 'package:dhyana/widget/design_spec.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:dhyana/widget/util/gap.dart';
import 'package:flutter/material.dart';

/// Displays transport controls and a seekable progress bar for audio playback.
/// Shows the current position and total duration of the chant, and allows
/// users to play/pause, skip tracks, and open the playlist.
class PlayerControls extends StatelessWidget {
  /// Creates a [PlayerControls] widget.
  const PlayerControls({
    required this.position,
    required this.duration,
    required this.isPlaying,
    required this.onNextPressed,
    required this.onPlayPausePressed,
    required this.onPreviousPressed,
    required this.onPlaylistPressed,
    super.key,
    this.isNextEnabled = true,
    this.isPreviousEnabled = true,
  });

  /// The total duration of the currently playing chant.
  final Duration duration;

  /// The current playback position within the chant.
  final Duration position;

  /// Whether the chant is currently playing.
  final bool isPlaying;

  /// Whether the "Next" button should be enabled.
  final bool isNextEnabled;

  /// Whether the "Previous" button should be enabled.
  final bool isPreviousEnabled;

  /// Callback invoked when the user presses the "Next" button.
  final VoidCallback onNextPressed;

  /// Callback invoked when the user presses the "Play/Pause" button.
  final VoidCallback onPlayPausePressed;

  /// Callback invoked when the user presses the "Previous" button.
  final VoidCallback onPreviousPressed;

  /// Callback invoked when the user presses the "Playlist" button.
  final VoidCallback onPlaylistPressed;

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
        Padding(
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
        Padding(
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

        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     IconButton(
        //       onPressed: isPreviousEnabled ? onPreviousPressed : null,
        //       icon: const Icon(Icons.skip_previous_rounded),
        //       color: isPreviousEnabled ? Colors.white : Colors.white54,
        //       tooltip: 'Previous',
        //     ),
        //     const SizedBox(width: 8),
        //     IconButton.filled(
        //       onPressed: onPlayPausePressed,
        //       icon: Icon(
        //         isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
        //       ),
        //       tooltip: isPlaying ? 'Pause' : 'Play',
        //     ),
        //     const SizedBox(width: 8),
        //     IconButton(
        //       onPressed: isNextEnabled ? onNextPressed : null,
        //       icon: const Icon(Icons.skip_next_rounded),
        //       color: isNextEnabled ? Colors.white : Colors.white54,
        //       tooltip: 'Next',
        //     ),
        //   ],
        // ),



      ],
    );
  }

  Widget buildControlsRow(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Row()),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: isPreviousEnabled ? onPreviousPressed : null,
              icon: const Icon(Icons.skip_previous_rounded),
              color: isPreviousEnabled ? Colors.white : Colors.white54,
              tooltip: 'Previous',
            ),
            const SizedBox(width: 8),
            IconButton.filled(
              onPressed: onPlayPausePressed,
              icon: Icon(
                isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
              ),
              tooltip: isPlaying ? 'Pause' : 'Play',
            ),
            const SizedBox(width: 8),
            IconButton(
              onPressed: isNextEnabled ? onNextPressed : null,
              icon: const Icon(Icons.skip_next_rounded),
              color: isNextEnabled ? Colors.white : Colors.white54,
              tooltip: 'Next',
            ),
          ],
        ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: onPlaylistPressed,
                icon: const Icon(Icons.playlist_play_rounded),
                color: Colors.white,
                tooltip: 'Playlist',
              ),
            ],
          )
        ),
      ],
    );
    
  }
}
