import 'package:chanting/src/domain/entity/lyrics_word_entity.dart';
import 'package:chanting/src/presentation/view/player/lyric_line.dart';
import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

class LyricWordWidget extends StatelessWidget {
  final LyricsWordEntity word;
  final Duration position;

  const LyricWordWidget({
    required this.word,
    required this.position,
    super.key,
  });

  static Color colorAtPosition({
    required LyricsWordEntity word,
    required Duration position,
  }) {
    final pendingColor = Colors.grey.shade200;
    final activeColor = AppColors.gold;
    // final sungColor = Colors.grey.shade200;
    final sungColor = AppColors.appWhite;

    if (position < word.start) return pendingColor;
    if (position >= word.end) return sungColor;

    final wordDuration = word.end - word.start;
    if (wordDuration <= Duration.zero) return activeColor;

    final fadeDuration = Durations.medium1.inMicroseconds.toDouble();
    final wordHalfDuration = wordDuration.inMicroseconds / 2;
    final fadeWindow = fadeDuration < wordHalfDuration
        ? fadeDuration
        : wordHalfDuration;
    if (fadeWindow == 0) return activeColor;

    final elapsed = (position - word.start).inMicroseconds.toDouble();
    final remaining = (word.end - position).inMicroseconds.toDouble();

    if (elapsed < fadeWindow) {
      return Color.lerp(pendingColor, activeColor, elapsed / fadeWindow)!;
    }
    if (remaining <= fadeWindow) {
      return Color.lerp(activeColor, sungColor, 1 - remaining / fadeWindow)!;
    }
    return activeColor;
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      word.text,
      style: LyricLine.getLyricsTextStyle(context).copyWith(
        color: colorAtPosition(word: word, position: position),
      ),
    );
  }
}
