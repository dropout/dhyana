import 'package:chanting/src/domain/entity/lyrics_line_entity.dart';
import 'package:chanting/src/domain/entity/lyrics_word_entity.dart';
import 'package:chanting/src/presentation/view/player/lyric_line.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  LyricsWordEntity word(String text) => LyricsWordEntity(
    text: text,
    start: Duration.zero,
    end: const Duration(seconds: 1),
  );

  test('display text converts escaped line breaks to paragraph spacing', () {
    final line = LyricsLineEntity(
      text: r'First \n second',
      start: Duration.zero,
      end: const Duration(seconds: 2),
      words: [word('First'), word(r'\n'), word('second')],
    );

    expect(LyricLine.displayText(line), 'First\n\nsecond');
  });

  test('display text handles breaks embedded in a word', () {
    final line = LyricsLineEntity(
      text: r'First\nsecond',
      start: Duration.zero,
      end: const Duration(seconds: 2),
      words: [word(r'First\nsecond')],
    );

    expect(LyricLine.displayText(line), 'First\n\nsecond');
  });

  test('display text leaves ordinary lyrics unchanged', () {
    final line = LyricsLineEntity(
      text: 'First second',
      start: Duration.zero,
      end: const Duration(seconds: 2),
      words: [word('First'), word('second')],
    );

    expect(LyricLine.displayText(line), 'First second');
  });
}
