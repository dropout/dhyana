import 'package:core/core.dart';
import 'package:material_ui/material_ui.dart';

/// Provides the width-dependent lyrics [TextStyle] to lyric lines and words.
class LyricTextStyle extends InheritedWidget {
  const LyricTextStyle({super.key, required this.style, required super.child});

  final TextStyle style;

  /// Picks the font size based on the [Breakpoint] for [maxWidth].
  static TextStyle resolve(TextStyle base, double maxWidth) {
    final size = switch (DesignSpec.breakpointForWidth(maxWidth)) {
      Breakpoint.xs => 36.0,
      Breakpoint.sm => 42.0,
      Breakpoint.md => 60.0,
      Breakpoint.lg => 80.0,
      Breakpoint.xl => 96.0,
    };
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
