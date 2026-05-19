import 'package:dhyana/bloc/chanting/chanting_cubit.dart';
import 'package:dhyana/model/lyrics_line.dart';
import 'package:dhyana/model/lyrics_word.dart';
import 'package:dhyana/widget/chanting/player/lyric_word.dart';
import 'package:dhyana/widget/util/app_context.dart';
import 'package:flutter/material.dart';

/// Renders a single [LyricsLine] with per-word highlight animation.
/// The [position] is used to determine the state of each word (inactive, pending, singing, sung).
/// The [isActive] is currently not used, but can be used in the future to apply additional styling to the active line.
class LyricLine extends StatelessWidget {
  static const EdgeInsets linePadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 8,
  );

  final LyricsLine line;
  final Duration position;
  final bool isActive;

  final ChantingState chantingState;

  const LyricLine({
    super.key,
    required this.line,
    required this.position,
    required this.isActive,
    required this.chantingState,
  });

  @override
  Widget build(BuildContext context) {
    
    List<InlineSpan> textSpans = [];

    for (int i = 0; i < line.words.length; i++) {
      textSpans.add(
        WidgetSpan(
          child: LyricWordWidget(
            word: line.words[i],
            wordState: getWordState(line.words[i]),
          ),
        ),
      );

      // Only add a space if it's NOT the last word in the sentence
      if (i < line.words.length - 1) {
        textSpans.add(
          const TextSpan(
            text: ' ',
          ),
        );
      }
    }

    return Padding(
      padding: linePadding,
      child: Text.rich(
        TextSpan(
          children: textSpans,
          style: context.theme.textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );

  }

  WordState getWordState(LyricsWord word) {
    final start = (word.start.inMilliseconds / 100).round();
    final end = (word.end.inMilliseconds / 100).round();
    final pos = (position.inMilliseconds / 100).round();

    if (pos >= start && pos < end) {
      return WordState.active;
    } else if (pos < start) {
      return WordState.pending;
    } else {
      return WordState.sung;
    }
  }

}
