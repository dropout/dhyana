import 'package:flutter/material.dart';

class InsetShadowPainter extends CustomPainter {
  final Color shadowColor;
  final double blurRadius;
  final double borderRadius;
  final Offset offset;

  const InsetShadowPainter({
    required this.shadowColor,
    required this.blurRadius,
    required this.borderRadius,
    required this.offset,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final rrect = RRect.fromRectAndRadius(
      Offset.zero & size,
      Radius.circular(borderRadius),
    );

    // Even-odd fill leaves a shifted rounded hole; blurring the ring inwards gives the inset shadow.
    final path = Path()
      ..fillType = PathFillType.evenOdd
      ..addRect(rrect.outerRect.inflate(blurRadius * 3 + offset.distance))
      ..addRRect(rrect.shift(offset));

    canvas
      ..save()
      ..clipRRect(rrect)
      ..drawPath(
        path,
        Paint()
          ..color = shadowColor
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurRadius / 2),
      )
      ..restore();
  }

  @override
  bool shouldRepaint(covariant InsetShadowPainter oldDelegate) {
    return oldDelegate.shadowColor != shadowColor ||
        oldDelegate.blurRadius != blurRadius ||
        oldDelegate.borderRadius != borderRadius ||
        oldDelegate.offset != offset;
  }
}
