import 'package:material_ui/material_ui.dart';

/// Provides the width-dependent lyrics [TextStyle] to lyric lines and words.
class LyricTextStyle extends InheritedWidget {
  const LyricTextStyle({super.key, required this.style, required super.child});

  final TextStyle style;

  static const double _referenceWidth = 375;
  static const double _minScale = 0.8;
  static const double _maxScale = 1.4;

  /// Scales the [base] font size proportionally to [maxWidth].
  static TextStyle resolve(TextStyle base, double maxWidth) {
    final baseSize = base.fontSize ?? 28;
    final scale = (maxWidth / _referenceWidth).clamp(_minScale, _maxScale);
    // Rounding to 0.5 avoids re-measuring on sub-pixel resizes.
    final size = (baseSize * scale * 2).roundToDouble() / 2;
    return base.copyWith(fontSize: size);
  }

  static TextStyle of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<LyricTextStyle>();
    assert(widget != null, 'No LyricTextStyle found in context');
    return widget!.style;
  }

  @override
  bool updateShouldNotify(LyricTextStyle oldWidget) => style != oldWidget.style;
}
