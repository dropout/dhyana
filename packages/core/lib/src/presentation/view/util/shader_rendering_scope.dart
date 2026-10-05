import 'package:flutter/widgets.dart';

class ShaderRenderingScope extends InheritedWidget {
  const ShaderRenderingScope({
    required this.enabled,
    required super.child,
    super.key,
  });

  final bool enabled;

  static bool isEnabled(BuildContext context) {
    return context
            .dependOnInheritedWidgetOfExactType<ShaderRenderingScope>()
            ?.enabled ??
        true;
  }

  @override
  bool updateShouldNotify(ShaderRenderingScope oldWidget) =>
      enabled != oldWidget.enabled;
}
