import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

/// Displays transport controls and a seekable progress bar for audio playback.
class PlayerControls extends StatelessWidget {
  const PlayerControls({
    required this.position,
    required this.duration,
    required this.isPlaying,
    required this.onNextPressed,
    required this.onPlayPausePressed,
    required this.onPreviousPressed,
    required this.onSeek,    
    super.key,
    this.isNextEnabled = true,
    this.isPreviousEnabled = true,
  });

  final Duration duration;
  final bool isPlaying;
  final bool isNextEnabled;
  final bool isPreviousEnabled;
  final VoidCallback onNextPressed;
  final VoidCallback onPlayPausePressed;
  final VoidCallback onPreviousPressed;
  final ValueChanged<Duration> onSeek;
  final Duration position;

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Slider(
          value: maxMs == 0 ? 0 : currentMs,
          min: 0,
          max: maxMs == 0 ? 1 : maxMs,
          onChanged: maxMs == 0
              ? null
              : (double value) {
                  onSeek(Duration(milliseconds: value.round()));
                },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              Text(
                _formatDuration(safePosition),
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),              
              ),
              const Spacer(),
              Text(
                _formatDuration(safeDuration),
                style: context.theme.textTheme.bodyMedium?.copyWith(
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
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
      ],
    );
  }

  String _formatDuration(Duration value) {
    final int totalSeconds = value.inSeconds;
    final int minutes = totalSeconds ~/ 60;
    final int seconds = totalSeconds % 60;
    final String paddedSeconds = seconds.toString().padLeft(2, '0');
    return '$minutes:$paddedSeconds';
  }
  
}