import 'package:chanting/src/domain/entity/lyrics_word_entity.dart';
import 'package:chanting/src/presentation/view/player/lyric_word.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const word = LyricsWordEntity(
    text: 'word',
    start: Duration(seconds: 1),
    end: Duration(seconds: 3),
  );

  test('color follows playback position through word transitions', () {
    expect(
      LyricWordWidget.colorAtPosition(
        word: word,
        position: const Duration(milliseconds: 999),
      ),
      Colors.grey.shade200,
    );
    expect(
      LyricWordWidget.colorAtPosition(
        word: word,
        position: const Duration(seconds: 1, milliseconds: 125),
      ),
      Color.lerp(Colors.grey.shade200, AppColors.gold, 0.5),
    );
    expect(
      LyricWordWidget.colorAtPosition(
        word: word,
        position: const Duration(seconds: 2),
      ),
      AppColors.gold,
    );
    expect(
      LyricWordWidget.colorAtPosition(
        word: word,
        position: const Duration(seconds: 2, milliseconds: 875),
      ),
      Color.lerp(AppColors.gold, Colors.grey.shade600, 0.5),
    );
    expect(
      LyricWordWidget.colorAtPosition(
        word: word,
        position: const Duration(seconds: 3),
      ),
      Colors.grey.shade600,
    );
  });

  test('short words fade in and out within their own duration', () {
    final shortWord = word.copyWith(
      start: Duration.zero,
      end: const Duration(milliseconds: 100),
    );

    expect(
      LyricWordWidget.colorAtPosition(
        word: shortWord,
        position: const Duration(milliseconds: 25),
      ),
      Color.lerp(Colors.grey.shade200, AppColors.gold, 0.5),
    );
    expect(
      LyricWordWidget.colorAtPosition(
        word: shortWord,
        position: const Duration(milliseconds: 50),
      ),
      AppColors.gold,
    );
    expect(
      LyricWordWidget.colorAtPosition(
        word: shortWord,
        position: const Duration(milliseconds: 75),
      ),
      Color.lerp(AppColors.gold, Colors.grey.shade600, 0.5),
    );
  });
}
