import 'package:chanting/src/domain/entity/chanting_state_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_line_entity.dart';
import 'package:chanting/src/presentation/view/player/lyric_text_style.dart';
import 'package:chanting/src/presentation/view/player/lyric_word.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

/// Renders a single [LyricsLineEntity] with per-word highlight animation.
/// The [position] is used to determine the state of each word (inactive, pending, singing, sung).
/// The [isActive] is currently not used, but can be used in the future to apply additional styling to the active line.
class const LyricLine({
  required final LyricsLineEntity line,
  required final Duration position,
  required final bool isActive,
  required final ChantingStateEntity chantingState,
  required final double maxWidth,
  super.key,
}) extends StatelessWidget {
  /// Returns the text style used for rendering lyrics lines.
  /// This is used when rendering the text and calculating the line heights
  /// for the varied extent sliver.
  static TextStyle getLyricsTextStyle(BuildContext context) {
    return context.theme.textTheme.headlineMedium!.copyWith(
      fontWeight: FontWeight.w700,
      color: AppColors.appWhite,
    );
  }

  static EdgeInsets getLinePaddingForWidth(double maxWidth) {
    final vertical = 8.0;
    final horizontal = switch (DesignSpec.breakpointForWidth(maxWidth)) {
      .xs => 24.0,
      .sm => 32.0,
      .md => 40.0,
      .lg => 48.0,
      .xl => 60.0,
    };
    return EdgeInsets.only(
      left: horizontal,
      right: horizontal * 3,
      top: vertical,
      bottom: vertical,
    );
  }

  static final RegExp lineBreakPattern = RegExp(r'\\n|\r?\n');

  @override
  Widget build(BuildContext context) {
    final textSpans = <InlineSpan>[];
    var hasWordOnCurrentParagraph = false;

    for (final word in line.words) {
      final fragments = word.text.split(lineBreakPattern);

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
                position: position,
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
      padding: getLinePaddingForWidth(maxWidth),
      child: Text.rich(
        TextSpan(children: textSpans, style: LyricTextStyle.of(context)),
      ),
    );
  }

  static String displayText(LyricsLineEntity line) {
    final text = StringBuffer();
    var hasWordOnCurrentParagraph = false;

    for (final word in line.words) {
      final fragments = word.text.split(lineBreakPattern);

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
}
