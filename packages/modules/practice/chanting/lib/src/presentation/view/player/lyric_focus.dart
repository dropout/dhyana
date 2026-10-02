import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:chanting/src/presentation/view/player/lyrics_effects_config.dart';
import 'package:material_ui/material_ui.dart';

/// Per-line values derived from the distance to the active line.
class LyricFocusValues {
  final double opacity;
  final double scale;
  final double blurSigma;

  const LyricFocusValues(this.opacity, this.scale, this.blurSigma);
}

/// Computes the focus values for a line [distance] lines from the active one.
LyricFocusValues lyricFocusValues({
  required int distance,
  required LyricsEffectsConfig config,
  required bool isUserScrolling,
}) {
  final opacity = config.isFadeOn
      ? math.max(config.minOpacity, 1 - distance * config.opacityFalloffPerLine)
      : 1.0;
  final scale = config.isScaleOn && distance > 0 ? config.inactiveScale : 1.0;
  final blurAllowed =
      config.isBlurOn && (config.blurWhileUserScrolling || !isUserScrolling);
  final sigma = blurAllowed
      ? math.min(distance * config.blurSigmaPerLine, config.maxBlurSigma)
      : 0.0;
  return LyricFocusValues(opacity, scale, sigma);
}

/// Applies fade, scale and blur to a lyric line based on its distance
/// from the active line. Renders [child] untouched when no effect is on.
class LyricFocus extends StatelessWidget {
  final int index;
  final int activeIndex;
  final bool isUserScrolling;
  final LyricsEffectsConfig config;
  final Widget child;

  const LyricFocus({
    super.key,
    required this.index,
    required this.activeIndex,
    required this.isUserScrolling,
    required this.config,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    if (!config.hasLineEffects) return child;

    final values = lyricFocusValues(
      distance: (index - activeIndex).abs(),
      config: config,
      isUserScrolling: isUserScrolling,
    );

    return TweenAnimationBuilder<double>(
      tween: Tween(end: values.blurSigma),
      duration: config.transitionDuration,
      child: child,
      builder: (context, sigma, child) {
        Widget result = child!;
        if (sigma > 0.05) {
          result = ImageFiltered(
            imageFilter: ui.ImageFilter.blur(
              sigmaX: sigma,
              sigmaY: sigma,
              tileMode: TileMode.decal,
            ),
            child: result,
          );
        }
        return AnimatedScale(
          scale: values.scale,
          alignment: Alignment.centerLeft,
          duration: config.transitionDuration,
          curve: Curves.easeOut,
          child: AnimatedOpacity(
            opacity: values.opacity,
            duration: config.transitionDuration,
            child: result,
          ),
        );
      },
    );
  }
}
