import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class ShaderInsetShadowPainter extends CustomPainter {
  final ui.FragmentShader shader;
  final Color shadowColor;
  final double blurRadius;
  final double borderRadius;
  final Offset offset;

  ShaderInsetShadowPainter({
    required this.shader,
    required this.shadowColor,
    required this.blurRadius,
    required this.borderRadius,
    required this.offset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 1. Set size uniform (uSize: vec2)
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);

    // 2. Set shadow color uniform (uColor: vec4)
    shader.setFloat(2, shadowColor.r / 255.0);
    shader.setFloat(3, shadowColor.g / 255.0);
    shader.setFloat(4, shadowColor.b / 255.0);
    shader.setFloat(5, shadowColor.a);

    // 3. Set blur radius (uBlur: float)
    shader.setFloat(6, blurRadius);

    // 4. Set corner radius (uRadius: float)
    shader.setFloat(7, borderRadius);

    // 5. Set shadow offset (uOffset: vec2)
    shader.setFloat(8, offset.dx);
    shader.setFloat(9, offset.dy);

    final Paint paint = Paint()..shader = shader;

    // Draw full rect; shader handles rounding and inner clipping
    canvas.drawRect(Offset.zero & size, paint);
  }

  @override
  bool shouldRepaint(covariant ShaderInsetShadowPainter oldDelegate) {
    return oldDelegate.shader != shader ||
        oldDelegate.shadowColor != shadowColor ||
        oldDelegate.blurRadius != blurRadius ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.offset != offset;
  }
}