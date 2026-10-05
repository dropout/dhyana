import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_line_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_word_entity.dart';
import 'package:chanting/src/presentation/view/player/lyric_word.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

/// Renders a single [LyricsLineEntity] with per-word highlight animation.
/// The [position] is used to determine the state of each word (inactive, pending, singing, sung).
/// The [isActive] is currently not used, but can be used in the future to apply additional styling to the active line.
class LyricLine extends StatelessWidget {
  static const EdgeInsets linePadding = EdgeInsets.symmetric(
    horizontal: 24,
    vertical: 8,
  );
  static final RegExp _lineBreakPattern = RegExp(r'\\n|\r?\n');

  final LyricsLineEntity line;
  final Duration position;
  final bool isActive;

  final ChantingStateEntity chantingState;

  const LyricLine({
    super.key,
    required this.line,
    required this.position,
    required this.isActive,
    required this.chantingState,
  });

  @override
  Widget build(BuildContext context) {
    final textSpans = <InlineSpan>[];
    var hasWordOnCurrentParagraph = false;

    for (final word in line.words) {
      final fragments = word.text.split(_lineBreakPattern);

      for (var i = 0; i < fragments.length; i++) {
        final fragment = fragments[i];
        if (fragment.isNotEmpty) {
          if (hasWordOnCurrentParagraph) {
            textSpans.add(const TextSpan(text: ' '));
          }
          textSpans.add(
            WidgetSpan(
              child: LyricWordWidget(
                word: word.copyWith(text: fragment),
                wordState: getWordState(word),
              ),
            ),
          );
          hasWordOnCurrentParagraph = true;
        }

        if (i < fragments.length - 1) {
          textSpans.add(const TextSpan(text: '\n\n'));
          hasWordOnCurrentParagraph = false;
        }
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

  static String displayText(LyricsLineEntity line) {
    final text = StringBuffer();
    var hasWordOnCurrentParagraph = false;

    for (final word in line.words) {
      final fragments = word.text.split(_lineBreakPattern);

      for (var i = 0; i < fragments.length; i++) {
        final fragment = fragments[i];
        if (fragment.isNotEmpty) {
          if (hasWordOnCurrentParagraph) text.write(' ');
          text.write(fragment);
          hasWordOnCurrentParagraph = true;
        }

        if (i < fragments.length - 1) {
          text.write('\n\n');
          hasWordOnCurrentParagraph = false;
        }
      }
    }

    return text.toString();
  }

  WordState getWordState(LyricsWordEntity word) {
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
