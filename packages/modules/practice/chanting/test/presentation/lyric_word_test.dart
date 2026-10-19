import 'package:chanting/src/domain/entity/lyrics_word_entity.dart';
import 'package:chanting/src/presentation/view/player/lyric_text_style.dart';
import 'package:chanting/src/presentation/view/player/lyric_word.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const word = LyricsWordEntity(
    text: 'word',
    start: Duration(seconds: 1),
    end: Duration(seconds: 3),
  );

  test('phase follows playback position', () {
    LyricWordPhase at(Duration p) =>
        LyricWordWidget.phaseAtPosition(word: word, position: p);
    expect(at(const Duration(milliseconds: 999)), LyricWordPhase.pending);
    expect(at(const Duration(seconds: 1)), LyricWordPhase.active);
    expect(at(const Duration(seconds: 3)), LyricWordPhase.sung);
  });

  Future<void> pump(WidgetTester tester, Duration position) =>
      tester.pumpWidget(
        MaterialApp(
          home: LyricTextStyle(
            style: const TextStyle(fontSize: 20),
            child: LyricWordWidget(word: word, position: position),
          ),
        ),
      );

  Color? colorOf(WidgetTester tester) =>
      tester.widget<Text>(find.text('word')).style!.color;

  testWidgets('animates to the new phase color and ends on it', (tester) async {
    await pump(tester, Duration.zero);
    final pending = LyricWordWidget.colorOf(LyricWordPhase.pending);
    final active = LyricWordWidget.colorOf(LyricWordPhase.active);
    expect(colorOf(tester), pending);

    await pump(tester, const Duration(seconds: 2));
    await tester.pump(LyricWordWidget.fadeDuration ~/ 2);
    expect(colorOf(tester), isNot(pending));
    expect(colorOf(tester), isNot(active));

    await tester.pump(LyricWordWidget.fadeDuration);
    expect(colorOf(tester), active);
  });

  testWidgets('sung fade is longer than the active fade', (tester) async {
    await pump(tester, const Duration(seconds: 2));
    await pump(tester, const Duration(seconds: 4));

    await tester.pump(LyricWordWidget.fadeDuration);
    expect(
      colorOf(tester),
      isNot(LyricWordWidget.colorOf(LyricWordPhase.sung)),
    );

    await tester.pump(LyricWordWidget.sungFadeDuration);
    expect(colorOf(tester), LyricWordWidget.colorOf(LyricWordPhase.sung));
  });

  testWidgets('interrupted fade restarts from the on-screen color', (
    tester,
  ) async {
    await pump(tester, Duration.zero);
    await pump(tester, const Duration(seconds: 2));
    await tester.pump(LyricWordWidget.fadeDuration ~/ 2);
    final mid = colorOf(tester);

    await pump(tester, const Duration(seconds: 4));
    expect(colorOf(tester), mid);
  });
}
