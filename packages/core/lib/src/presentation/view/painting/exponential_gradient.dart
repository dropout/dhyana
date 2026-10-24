import 'dart:ui';

import 'package:assets/assets.dart';
import 'package:core/core.dart';
import 'package:flutter_shaders/flutter_shaders.dart';
import 'package:material_ui/material_ui.dart';
import 'package:vector_math/vector_math.dart' as vm;

/// Vertical gradient from [colorBegin] (top) to [colorEnd] (bottom) where the
/// blend factor is `t^exponent`.
class ExponentialGradient extends StatelessWidget {
  final Color colorBegin;
  final Color colorEnd;
  final double exponent;
  final Widget? child;

  const ExponentialGradient({
    required this.colorBegin,
    required this.colorEnd,
    this.exponent = 2.0,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    if (!ShaderRenderingScope.isEnabled(context)) {
      return DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [colorBegin, colorEnd],
          ),
        ),
        child: child,
      );
    }

    final shader = context.services.shaderService.get(
      Assets.shaderExponentialGradient,
    );

    return CustomPaint(
      painter: _ExponentialGradientPainter(
        shader: shader,
        colorBegin: colorBegin,
        colorEnd: colorEnd,
        exponent: exponent,
      ),
      child: child,
    );
  }
}

class _ExponentialGradientPainter extends CustomPainter {
  final FragmentShader shader;
  final Color colorBegin;
  final Color colorEnd;
  final double exponent;
  final Paint _paint;

  _ExponentialGradientPainter({
    required this.shader,
    required this.colorBegin,
    required this.colorEnd,
    required this.exponent,
  }) : _paint = Paint()..shader = shader;

  @override
  void paint(Canvas canvas, Size size) {
    shader.setFloatUniforms((setter) {
      setter.setVector(vm.Vector2(size.width, size.height));
      setter.setVector(
        vm.Vector4(colorBegin.r, colorBegin.g, colorBegin.b, colorBegin.a),
      );
      setter.setVector(
        vm.Vector4(colorEnd.r, colorEnd.g, colorEnd.b, colorEnd.a),
      );
      setter.setFloat(exponent);
    });
    canvas.drawRect(Offset.zero & size, _paint);
  }

  @override
  bool shouldRepaint(_ExponentialGradientPainter old) =>
      shader != old.shader ||
      colorBegin != old.colorBegin ||
      colorEnd != old.colorEnd ||
      exponent != old.exponent;
}
