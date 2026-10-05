/// Configuration of the visual effects in the lyrics view.
/// Every effect can be toggled on its own, or all of them with [enabled].
class LyricsEffectsConfig {
  /// Master switch; when false no effect is applied.
  final bool enabled;

  /// Worm-like staggered scrolling when the active line changes.
  final bool wormScroll;
  final Duration wormDuration;

  /// Delay (fraction of [wormDuration]) per line below the active one.
  final double wormDelayPerLine;

  /// Upper bound for the stagger delay (fraction of [wormDuration]).
  final double wormMaxDelay;

  /// Fades lines the further they are from the active line.
  final bool fade;
  final double minOpacity;
  final double opacityFalloffPerLine;

  /// Shrinks inactive lines, anchored on the left edge.
  final bool scale;
  final double inactiveScale;

  /// Blurs lines the further they are from the active line.
  final bool blur;
  final double blurSigmaPerLine;
  final double maxBlurSigma;

  /// Skips the blur while the user scrolls so lines stay readable.
  final bool blurWhileUserScrolling;

  /// Duration of fade, scale and blur transitions.
  final Duration transitionDuration;

  const LyricsEffectsConfig({
    this.enabled = true,
    this.wormScroll = true,
    this.wormDuration = const Duration(milliseconds: 600),
    this.wormDelayPerLine = 0.06,
    this.wormMaxDelay = 0.4,
    this.fade = true,
    this.minOpacity = 0.3,
    this.opacityFalloffPerLine = 0.2,
    this.scale = true,
    this.inactiveScale = 0.94,
    this.blur = true,
    this.blurSigmaPerLine = 0.8,
    this.maxBlurSigma = 3,
    this.blurWhileUserScrolling = false,
    this.transitionDuration = const Duration(milliseconds: 350),
  });

  /// Plain lyrics view: instant scroll to the line, no per-line effects.
  static const LyricsEffectsConfig disabled = LyricsEffectsConfig(
    enabled: false,
  );

  bool get isWormScrollOn => enabled && wormScroll;
  bool get isFadeOn => enabled && fade;
  bool get isScaleOn => enabled && scale;
  bool get isBlurOn => enabled && blur;
  bool get hasLineEffects => isFadeOn || isScaleOn || isBlurOn;

  LyricsEffectsConfig copyWith({
    bool? enabled,
    bool? wormScroll,
    Duration? wormDuration,
    double? wormDelayPerLine,
    double? wormMaxDelay,
    bool? fade,
    double? minOpacity,
    double? opacityFalloffPerLine,
    bool? scale,
    double? inactiveScale,
    bool? blur,
    double? blurSigmaPerLine,
    double? maxBlurSigma,
    bool? blurWhileUserScrolling,
    Duration? transitionDuration,
  }) {
    return LyricsEffectsConfig(
      enabled: enabled ?? this.enabled,
      wormScroll: wormScroll ?? this.wormScroll,
      wormDuration: wormDuration ?? this.wormDuration,
      wormDelayPerLine: wormDelayPerLine ?? this.wormDelayPerLine,
      wormMaxDelay: wormMaxDelay ?? this.wormMaxDelay,
      fade: fade ?? this.fade,
      minOpacity: minOpacity ?? this.minOpacity,
      opacityFalloffPerLine:
          opacityFalloffPerLine ?? this.opacityFalloffPerLine,
      scale: scale ?? this.scale,
      inactiveScale: inactiveScale ?? this.inactiveScale,
      blur: blur ?? this.blur,
      blurSigmaPerLine: blurSigmaPerLine ?? this.blurSigmaPerLine,
      maxBlurSigma: maxBlurSigma ?? this.maxBlurSigma,
      blurWhileUserScrolling:
          blurWhileUserScrolling ?? this.blurWhileUserScrolling,
      transitionDuration: transitionDuration ?? this.transitionDuration,
    );
  }
}
