import 'package:chanting/src/presentation/view/player/lyric_focus.dart';
import 'package:chanting/src/presentation/view/player/lyrics_effects_config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const config = LyricsEffectsConfig();

  LyricFocusValues values(
    int d, {
    LyricsEffectsConfig c = config,
    bool u = false,
  }) => lyricFocusValues(distance: d, config: c, isUserScrolling: u);

  test('active line is fully visible, sharp and unscaled', () {
    final v = values(0);
    expect(v.opacity, 1);
    expect(v.scale, 1);
    expect(v.blurSigma, 0);
  });

  test('effects grow with distance and are capped', () {
    expect(values(2).opacity, lessThan(values(1).opacity));
    expect(values(100).opacity, config.minOpacity);
    expect(values(100).blurSigma, config.maxBlurSigma);
    expect(values(1).scale, config.inactiveScale);
  });

  test('disabled config applies nothing', () {
    final v = values(5, c: LyricsEffectsConfig.disabled);
    expect((v.opacity, v.scale, v.blurSigma), (1.0, 1.0, 0.0));
    expect(LyricsEffectsConfig.disabled.hasLineEffects, isFalse);
  });

  test('single effects can be turned off', () {
    final v = values(3, c: config.copyWith(blur: false, fade: false));
    expect(v.blurSigma, 0);
    expect(v.opacity, 1);
    expect(v.scale, config.inactiveScale);
  });

  test('blur is skipped while user scrolls unless allowed', () {
    expect(values(3, u: true).blurSigma, 0);
    expect(
      values(
        3,
        u: true,
        c: config.copyWith(blurWhileUserScrolling: true),
      ).blurSigma,
      greaterThan(0),
    );
  });
}
